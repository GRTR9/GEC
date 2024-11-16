INSERT OVERWRITE DIRECTORY '/user/bigred/hive_example05' 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE 
select traname,artname,count(userid) cnt from 
(select DISTINCT userid as userid,artname as artname,traname as traname from userdemand) dud 
group by traname,artname order by cnt desc,traname asc limit 10;  
