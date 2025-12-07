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
