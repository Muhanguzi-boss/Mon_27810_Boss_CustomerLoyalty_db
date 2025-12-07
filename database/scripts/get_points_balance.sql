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
