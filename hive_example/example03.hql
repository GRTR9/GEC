INSERT OVERWRITE DIRECTORY '/user/bigred/hive_example03' ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE 
select COUNT(*) from userprofile where (age >=20 AND age <=30);
