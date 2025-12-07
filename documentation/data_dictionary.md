# Data Dictionary

This document defines all tables, columns, and their purpose in the Loyalty System database.

---

## CUSTOMERS
| Column            | Type           | Description                          |
|-------------------|---------------|--------------------------------------|
| customer_id       | NUMBER (PK)   | Unique identifier for each customer. |
| full_name         | VARCHAR2(100) | Customer’s full name.                |
| email             | VARCHAR2(100) | Unique email address.                |
| phone_number      | VARCHAR2(20)  | Contact phone number.                |
| registration_date | DATE          | Date the customer registered.        |
| total_points      | NUMBER        | Current loyalty points balance.      |

---

## PURCHASES
| Column         | Type           | Description                          |
|----------------|---------------|--------------------------------------|
| purchase_id    | NUMBER (PK)   | Unique identifier for each purchase. |
| customer_id    | NUMBER (FK)   | References CUSTOMERS.                |
| purchase_date  | DATE          | Date of purchase.                    |
| total_amount   | NUMBER(10,2)  | Total purchase value.                |
| points_earned  | NUMBER        | Points earned from purchase.         |

---

## REWARDS
| Column         | Type           | Description                          |
|----------------|---------------|--------------------------------------|
| reward_id      | NUMBER (PK)   | Unique identifier for each reward.   |
| reward_name    | VARCHAR2(100) | Name of the reward.                  |
| description    | VARCHAR2(200) | Reward description.                  |
| points_required| NUMBER        | Points needed to redeem reward.      |

---

## REDEMPTIONS
| Column         | Type           | Description                          |
|----------------|---------------|--------------------------------------|
| redemption_id  | NUMBER (PK)   | Unique identifier for redemption.    |
| customer_id    | NUMBER (FK)   | References CUSTOMERS.                |
| reward_id      | NUMBER (FK)   | References REWARDS.                  |
| redemption_date| DATE          | Date of redemption.                  |
| points_deducted| NUMBER        | Points deducted for reward.          |

---

## ERROR_LOG
| Column        | Type           | Description                          |
|---------------|---------------|--------------------------------------|
| log_id        | NUMBER (PK)   | Unique identifier for error log.     |
| module_name   | VARCHAR2(100) | Procedure/function name.             |
| error_code    | NUMBER        | Oracle error code.                   |
| error_message | VARCHAR2(4000)| Oracle error message.                |
| context_info  | VARCHAR2(4000)| Extra context (IDs, parameters).     |
| log_timestamp | TIMESTAMP     | Time of error.                       |

---

## HOLIDAYS
| Column        | Type           | Description                          |
|---------------|---------------|--------------------------------------|
| holiday_date  | DATE (PK)     | Date of holiday.                     |
| description   | VARCHAR2(100) | Holiday name/description.            |

---

## AUDIT_LOG
| Column        | Type           | Description                          |
|---------------|---------------|--------------------------------------|
| audit_id      | NUMBER (PK)   | Unique identifier for audit entry.   |
| user_name     | VARCHAR2(100) | Oracle user performing action.       |
| action_type   | VARCHAR2(20)  | INSERT, UPDATE, DELETE.              |
| table_name    | VARCHAR2(50)  | Table affected.                      |
| attempt_time  | TIMESTAMP     | Time of attempt.                     |
| status        | VARCHAR2(20)  | ALLOWED or DENIED.                   |
| reason        | VARCHAR2(200) | Reason for restriction/allowance.    |
