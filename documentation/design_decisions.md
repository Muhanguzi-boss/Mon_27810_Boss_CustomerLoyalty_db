# Design Decisions

This document explains the rationale behind major design choices in the Loyalty System.

---

## Schema Design
- **CUSTOMERS, PURCHASES, REWARDS, REDEMPTIONS** chosen as core entities to model loyalty program.  
- **ERROR_LOG** added to capture runtime exceptions for debugging and accountability.  
- **HOLIDAYS** added to store business rule restrictions.  
- **AUDIT_LOG** added to track all DML attempts (allowed/denied).  

---

## Business Rules
- **Points System**: Purchases earn points, rewards deduct points.  
- **Restrictions**: Employees cannot perform DML on weekdays or holidays.  
- **Auditing**: Every attempt logged with user, action, status, reason.  

---

## PL/SQL Logic
- **Procedures**: Encapsulate business operations (e.g., REDEEM_REWARD).  
- **Functions**: Modular checks (e.g., check_restriction, log_audit).  
- **Triggers**: Enforce restrictions automatically before DML.  
- **Compound Trigger**: Demonstrates advanced PL/SQL by centralizing logic.  

---

## Error Handling
- **RAISE_APPLICATION_ERROR** used for clear messages.  
- **ERROR_LOG** ensures errors are persisted for review.  

---

## Testing Strategy
- **Weekday test** → DENIED.  
- **Weekend test** → ALLOWED.  
- **Holiday test** → DENIED.  
- **Audit log** → Verified after each attempt.  

---

## GitHub Organization
- **scripts/** → SQL scripts for schema, procedures, triggers.  
- **queries/** → Data retrieval, analytics, audit queries.  
- **documentation/** → Data dictionary, architecture, design decisions.  
- **screenshots/** → Evidence of compilation and test results.  
