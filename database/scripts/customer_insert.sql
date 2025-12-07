-- Bulk insert customers
BEGIN
  FOR i IN 1..100 LOOP
    INSERT INTO CUSTOMERS (
      customer_id, full_name, email, phone_number, registration_date, total_points
    ) VALUES (
      i,
      'Customer_' || i,
      'customer' || i || '@example.com',
      '0788000' || LPAD(i, 3, '0'),
      SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- random registration date within last year
      0
    );
  END LOOP;
END;
/
