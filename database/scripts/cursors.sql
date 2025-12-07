SET SERVEROUTPUT ON;
DECLARE
  CURSOR c_top_customers IS
    SELECT customer_id, full_name, total_points
    FROM CUSTOMERS
    ORDER BY total_points DESC
    FETCH FIRST 10 ROWS ONLY;
  v_id     CUSTOMERS.customer_id%TYPE;
  v_name   CUSTOMERS.full_name%TYPE;
  v_points CUSTOMERS.total_points%TYPE;
BEGIN
  OPEN c_top_customers;
  LOOP
    FETCH c_top_customers INTO v_id, v_name, v_points;
    EXIT WHEN c_top_customers%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('['||v_id||'] '||v_name||' -> '||v_points||' pts');
  END LOOP;
  CLOSE c_top_customers;
END;
/
