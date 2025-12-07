-- Bulk insert redemptions
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO REDEMPTIONS (
      redemption_id, customer_id, reward_id, redemption_date, points_deducted
    ) VALUES (
      2000 + i,
      MOD(i, 100) + 1, -- link to customers 1–100
      MOD(i, 5) + 1,   -- rewards 1–5
      SYSDATE - DBMS_RANDOM.VALUE(1, 90), -- random date within last 3 months
      CASE MOD(i, 5)
        WHEN 0 THEN 50
        WHEN 1 THEN 100
        WHEN 2 THEN 200
        WHEN 3 THEN 500
        ELSE 1000
      END
    );
  END LOOP;
END;
/
