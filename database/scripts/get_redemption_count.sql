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
