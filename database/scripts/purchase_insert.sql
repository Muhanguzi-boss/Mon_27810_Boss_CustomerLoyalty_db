-- Bulk insert purchases
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO PURCHASES (
      purchase_id, customer_id, purchase_date, total_amount, points_earned
    ) VALUES (
      1000 + i,
      MOD(i, 100) + 1, -- assign to customers 1–100
      SYSDATE - DBMS_RANDOM.VALUE(1, 180), -- random date within last 6 months
      ROUND(DBMS_RANDOM.VALUE(50, 500), 2), -- purchase between 50 and 500
      ROUND(DBMS_RANDOM.VALUE(5, 50)) -- points earned between 5 and 50
    );
  END LOOP;
END;
/
