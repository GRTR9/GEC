INSERT OVERWRITE DIRECTORY '/user/bigred/hive_example04' ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE 
select age,count(age) from userprofile group by age order by age DESC limit 1;
