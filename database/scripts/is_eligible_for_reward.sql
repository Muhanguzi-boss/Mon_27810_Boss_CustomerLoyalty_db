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
