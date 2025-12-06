-- Create tablespaces for data and indexes
CREATE TABLESPACE loyalty_data
DATAFILE 'C:/app/pc/product/21c/oradata/XE/mon_27810_muhanguzi_loyaltyDB/loyalty_data01.dbf'
SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

CREATE TABLESPACE loyalty_index
DATAFILE 'C:/app/pc/product/21c/oradata/XE/mon_27810_muhanguzi_loyaltyDB/loyalty_index01.dbf'
SIZE 50M AUTOEXTEND ON NEXT 5M MAXSIZE UNLIMITED;

-- Temporary tablespace
CREATE TEMPORARY TABLESPACE loyalty_temp
TEMPFILE 'C:/app/pc/product/21c/oradata/XE/mon_27810_muhanguzi_loyaltyDB/loyalty_temp01.dbf'
SIZE 50M AUTOEXTEND ON NEXT 5M MAXSIZE UNLIMITED;
