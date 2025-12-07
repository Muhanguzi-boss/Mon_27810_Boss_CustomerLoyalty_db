CREATE OR REPLACE PROCEDURE award_points (
    p_customer_id IN NUMBER,
    p_amount      IN NUMBER
) AS
    v_points NUMBER;
BEGIN
    -- Calculate points (10% of amount)
    v_points := ROUND(p_amount * 0.1);

    -- Insert purchase record using variables, not column names
    INSERT INTO PURCHASES (
        purchase_id, customer_id, purchase_date, total_amount, points_earned
    ) VALUES (
        SEQ_PURCHASES.NEXTVAL, p_customer_id, SYSDATE, p_amount, v_points
    );

    -- Update customer’s total points
    UPDATE CUSTOMERS
    SET total_points = total_points + v_points
    WHERE customer_id = p_customer_id;

    COMMIT;
END;
/


-- Purpose: Redeem a reward if customer has enough points.
-- Params:
--   p_customer_id IN NUMBER
--   p_reward_id   IN NUMBER
--   p_status      OUT VARCHAR2 - 'SUCCESS' or error reason
-- Behavior:
--   Inserts into REDEMPTIONS, deducts points from CUSTOMERS, commits on success.
-- Exceptions logged to ERROR_LOG.
CREATE OR REPLACE PROCEDURE redeem_reward (
    p_customer_id IN NUMBER,
    p_reward_id   IN NUMBER,
    p_status      OUT VARCHAR2
) AS
    v_points_required NUMBER;
    v_customer_points NUMBER;
BEGIN
    p_status := 'INIT';

    -- Get required points for the reward
    SELECT points_required
    INTO v_points_required
    FROM REWARDS
    WHERE reward_id = p_reward_id;

    -- Get customer's current points
    SELECT total_points
    INTO v_customer_points
    FROM CUSTOMERS
    WHERE customer_id = p_customer_id;

    -- Check eligibility
    IF v_customer_points < v_points_required THEN
        p_status := 'INSUFFICIENT_POINTS';
        RAISE_APPLICATION_ERROR(-20020, 'Not enough points to redeem reward');
    END IF;

    -- Insert redemption record
    INSERT INTO REDEMPTIONS (
        redemption_id, customer_id, reward_id, redemption_date, points_deducted
    ) VALUES (
        SEQ_REDEMPTIONS.NEXTVAL, p_customer_id, p_reward_id, SYSDATE, v_points_required
    );

    -- Deduct points from customer
    UPDATE CUSTOMERS
    SET total_points = total_points - v_points_required
    WHERE customer_id = p_customer_id;

    COMMIT;
    p_status := 'SUCCESS';

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_status := 'INVALID_INPUT';
        DECLARE
            v_sqlcode NUMBER := SQLCODE;
            v_sqlerrm VARCHAR2(4000) := 'Customer or reward not found';
        BEGIN
            INSERT INTO ERROR_LOG(module_name, error_code, error_message, context_info)
            VALUES ('redeem_reward', v_sqlcode, v_sqlerrm,
                    'customer_id='||p_customer_id||', reward_id='||p_reward_id);
        END;
        ROLLBACK;
        RAISE;

    WHEN OTHERS THEN
        p_status := 'ERROR';
        DECLARE
            v_sqlcode NUMBER := SQLCODE;
            v_sqlerrm VARCHAR2(4000) := SQLERRM;
        BEGIN
            INSERT INTO ERROR_LOG(module_name, error_code, error_message, context_info)
            VALUES ('redeem_reward', v_sqlcode, v_sqlerrm,
                    'customer_id='||p_customer_id||', reward_id='||p_reward_id);
        END;
        ROLLBACK;
        RAISE;
END;
/

-- Purpose: Adjust a customer's points by a delta (positive or negative).
-- Params:
--   p_customer_id IN NUMBER
--   p_delta       IN OUT NUMBER - input delta; returns actual applied (clamped at 0 floor)
-- Behavior:
--   Applies delta, preventing negative total_points. Commits on success.
CREATE OR REPLACE PROCEDURE adjust_points (
  p_customer_id IN NUMBER,
  p_delta       IN OUT NUMBER
) AS
  v_current NUMBER;
  v_applied NUMBER;
BEGIN
  -- Get current points
  SELECT total_points
  INTO v_current
  FROM CUSTOMERS
  WHERE customer_id = p_customer_id;

  v_applied := p_delta;

  -- Ensure points don't go below zero
  IF v_current + v_applied < 0 THEN
    v_applied := -v_current; -- clamp to zero floor
  END IF;

  -- Update customer's points
  UPDATE CUSTOMERS
  SET total_points = total_points + v_applied
  WHERE customer_id = p_customer_id;

  -- Return actual applied adjustment
  p_delta := v_applied;

  COMMIT;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DECLARE
      v_sqlcode NUMBER := SQLCODE;
      v_sqlerrm VARCHAR2(4000) := 'Customer not found';
    BEGIN
      INSERT INTO ERROR_LOG(module_name, error_code, error_message, context_info)
      VALUES ('adjust_points', v_sqlcode, v_sqlerrm, 'customer_id='||p_customer_id);
    END;
    ROLLBACK;
    RAISE;

  WHEN OTHERS THEN
    DECLARE
      v_sqlcode NUMBER := SQLCODE;
      v_sqlerrm VARCHAR2(4000) := SQLERRM;
    BEGIN
      INSERT INTO ERROR_LOG(module_name, error_code, error_message, context_info)
      VALUES ('adjust_points', v_sqlcode, v_sqlerrm, 'customer_id='||p_customer_id||', delta='||p_delta);
    END;
    ROLLBACK;
    RAISE;
END;
/
