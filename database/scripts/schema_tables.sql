CREATE TABLE CUSTOMERS (
    customer_id      NUMBER PRIMARY KEY,
    full_name        VARCHAR2(100) NOT NULL,
    email            VARCHAR2(100) UNIQUE,
    phone_number     VARCHAR2(20),
    registration_date DATE DEFAULT SYSDATE,
    total_points     NUMBER DEFAULT 0
);

CREATE TABLE PURCHASES (
    purchase_id     NUMBER PRIMARY KEY,
    customer_id     NUMBER REFERENCES CUSTOMERS(customer_id),
    purchase_date   DATE DEFAULT SYSDATE,
    total_amount    NUMBER(10,2),
    points_earned   NUMBER
);

CREATE TABLE REWARDS (
    reward_id       NUMBER PRIMARY KEY,
    reward_name     VARCHAR2(100) NOT NULL,
    description     VARCHAR2(200),
    points_required NUMBER NOT NULL
);

CREATE TABLE REDEMPTIONS (
    redemption_id   NUMBER PRIMARY KEY,
    customer_id     NUMBER REFERENCES CUSTOMERS(customer_id),
    reward_id       NUMBER REFERENCES REWARDS(reward_id),
    redemption_date DATE DEFAULT SYSDATE,
    points_deducted NUMBER
);
