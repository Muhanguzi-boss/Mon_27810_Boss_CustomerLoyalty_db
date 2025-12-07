# System Architecture

This document outlines the architecture of the Loyalty System project.

---

## High-Level Overview
- **Database Layer (Oracle XE)**  
  - Core schema: CUSTOMERS, PURCHASES, REWARDS, REDEMPTIONS.  
  - Supporting tables: ERROR_LOG, HOLIDAYS, AUDIT_LOG.  
  - Sequences for auto-generating IDs.  

- **PL/SQL Logic**  
  - Stored procedures (e.g., REDEEM_REWARD, ADJUST_POINTS).  
  - Functions (e.g., check_restriction, log_audit).  
  - Triggers (simple and compound) enforcing business rules.  

- **Business Rules**  
  - Points earned from purchases.  
  - Points deducted for redemptions.  
  - Restrictions: No DML on weekdays or holidays.  
  - Audit logging for all attempts.  

---

## Workflow Diagram (Conceptual)

1. **Customer makes purchase** → PURCHASES table updated → Points earned.  
2. **Customer redeems reward** → REDEMPTIONS table updated → Points deducted.  
3. **Triggers check restrictions** → If weekday/holiday → DENIED.  
4. **Audit log records attempt** → AUDIT_LOG updated with status + reason.  
5. **Errors captured** → ERROR_LOG updated with details.  

---

## Integration Points
- **Frontend (React/Tailwind)**: Connects to backend APIs (future extension).  
- **Backend (PL/SQL)**: Handles business logic, auditing, restrictions.  
- **BI/Analytics**: Queries for customer ranking, redemption trends, audit summaries.  

---

## Security Considerations
- Primary keys and foreign keys enforce integrity.  
- Unique constraints on email prevent duplicates.  
- Triggers enforce business rules consistently.  
- Audit log ensures accountability.  
