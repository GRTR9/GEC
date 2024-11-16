CREATE EXTERNAL TABLE userprofile ( 
userid STRING, 
gender STRING, 
age INT, 
country STRING, 
registered STRING 
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE LOCATION '/user/bigred/userprofile'; 

CREATE EXTERNAL TABLE userdemand ( 
userid STRING, 
time STRING, 
artname STRING, 
traname STRING ) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t' 
STORED AS TEXTFILE LOCATION '/user/bigred/userdemand';
