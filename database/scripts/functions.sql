--FUNCTIONS

CREATE OR REPLACE FUNCTION get_points_balance (
  p_customer_id IN NUMBER
) RETURN NUMBER IS
  v_balance NUMBER;
BEGIN
  SELECT total_points INTO v_balance
  FROM CUSTOMERS
  WHERE customer_id = p_customer_id;
  RETURN v_balance;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END;
/


-- Returns 1 if eligible, 0 otherwise
CREATE OR REPLACE FUNCTION is_eligible_for_reward (
  p_customer_id IN NUMBER,
  p_reward_id   IN NUMBER
) RETURN NUMBER IS
  v_points       NUMBER;
  v_required     NUMBER;
BEGIN
  SELECT total_points INTO v_points FROM CUSTOMERS WHERE customer_id = p_customer_id;
  SELECT points_required INTO v_required FROM REWARDS WHERE reward_id = p_reward_id;

  IF v_points >= v_required THEN
    RETURN 1;
  ELSE
    RETURN 0;
  END IF;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 0;
END;
/

CREATE OR REPLACE FUNCTION lookup_reward_name (
  p_reward_id IN NUMBER
) RETURN VARCHAR2 IS
  v_name REWARDS.reward_name%TYPE;
BEGIN
  SELECT reward_name INTO v_name FROM REWARDS WHERE reward_id = p_reward_id;
  RETURN v_name;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'UNKNOWN_REWARD';
END;
/

CREATE OR REPLACE FUNCTION get_total_purchases_amount (
  p_customer_id IN NUMBER
) RETURN NUMBER IS
  v_total NUMBER;
BEGIN
  SELECT NVL(SUM(total_amount),0) INTO v_total
  FROM PURCHASES
  WHERE customer_id = p_customer_id;
  RETURN v_total;
END;
/

CREATE OR REPLACE FUNCTION get_redemption_count (
  p_customer_id IN NUMBER
) RETURN NUMBER IS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM REDEMPTIONS
  WHERE customer_id = p_customer_id;
  RETURN v_count;
END;
/
