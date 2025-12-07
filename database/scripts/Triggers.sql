--Trigger(Business rule enforcement)
-- Purpose: Keep CUSTOMERS.total_points in sync on direct inserts to PURCHASES.
CREATE OR REPLACE TRIGGER trg_update_points
AFTER INSERT ON PURCHASES
FOR EACH ROW
BEGIN
  UPDATE CUSTOMERS
  SET total_points = total_points + :NEW.points_earned
  WHERE customer_id = :NEW.customer_id;
END;
/
