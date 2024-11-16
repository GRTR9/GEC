INSERT OVERWRITE DIRECTORY '/user/bigred/hive_example02' 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE 
select country,COUNT(country) cc from userprofile group by country order by cc DESC limit 5;
