INSERT OVERWRITE DIRECTORY '/user/bigred/hive_example06' 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE 
select count(*) from (
  select artname,count(userid) cnt from (
    select DISTINCT userid as userid,artname as artname from userdemand) dud group by artname having cnt < 2) less2;
