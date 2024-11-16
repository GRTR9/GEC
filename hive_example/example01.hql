INSERT OVERWRITE DIRECTORY '/user/bigred/hive_example01' 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE 
select gender,COUNT(gender) from userprofile group by gender;
