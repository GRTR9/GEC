input1 = load 'userdemand/userdemand.tsv' USING PigStorage ('\t') as (userid:chararray,time:chararray,artname:chararray,traname:chararray);
input2 = load 'userprofile/userprofile.tsv' USING PigStorage ('\t') as (userid:chararray,gender:chararray,age:int,country:chararray,registered:chararray);
turkeyuser = filter input2 by (country == 'Turkey');
join1t = JOIN input1 BY userid, turkeyuser BY userid;
timezone = foreach join1t generate $0 as userid,ToDate(time,'yyyy-MM-dd\'T\'HH:mm:ss\'Z\'','Europe/Istanbul') as timezone,$2 as artname,$3 as traname;
rmf pig_example07
STORE timezone INTO 'pig_example07' using PigStorage('\t');
