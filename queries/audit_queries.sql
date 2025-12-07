-- View all audit log entries
SELECT * FROM AUDIT_LOG ORDER BY attempt_time DESC;

-- Count denied vs allowed attempts
SELECT status, COUNT(*) AS attempt_count
FROM AUDIT_LOG
GROUP BY status;

-- Audit log by action type
SELECT action_type, status, COUNT(*) AS attempt_count
FROM AUDIT_LOG
GROUP BY action_type, status
ORDER BY action_type;

-- Audit log for a specific user
SELECT * FROM AUDIT_LOG
WHERE user_name = 'LOYALTY_ADMIN'
ORDER BY attempt_time DESC;

-- Audit log summary by table
SELECT table_name, status, COUNT(*) AS attempt_count
FROM AUDIT_LOG
GROUP BY table_name, status
ORDER BY table_name;
