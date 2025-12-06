-- Create application user with privileges
CREATE USER loyalty_admin IDENTIFIED BY muhanguzi
DEFAULT TABLESPACE loyalty_data
TEMPORARY TABLESPACE loyalty_temp
QUOTA UNLIMITED ON loyalty_data;

GRANT CONNECT, RESOURCE, DBA TO loyalty_admin;
