CREATE OR REPLACE PROCEDURE award_points (
    p_customer_id IN NUMBER,
    p_amount      IN NUMBER
) AS
    v_points NUMBER;
BEGIN
    -- Calculate points (e.g., 10% of purchase amount)
    v_points := ROUND(p_amount * 0.1);

    -- Insert purchase record
    INSERT INTO PURCHASES (purchase_id, customer_id, purchase_date, total_amount, points_earned)
    VALUES (SEQ_PURCHASES.NEXTVAL, p_customer_id, SYSDATE, p_amount, v_points);

    -- Update customer total points
    UPDATE CUSTOMERS
    SET total_points = total_points + v_points
    WHERE customer_id = p_customer_id;

    COMMIT;
END;
/
