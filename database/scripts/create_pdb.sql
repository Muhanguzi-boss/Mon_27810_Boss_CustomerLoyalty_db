-- Create Pluggable Database
CREATE PLUGGABLE DATABASE mon_27810_muhanguzi_loyaltyDB
ADMIN USER muhanguzi IDENTIFIED BY muhanguzi
FILE_NAME_CONVERT = (
    'C:/app/pc/product/21c/oradata/XE/pdbseed',
    'C:/app/pc/product/21c/oradata/XE/mon_27810_muhanguzi_loyaltyDB'
);
