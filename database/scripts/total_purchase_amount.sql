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
