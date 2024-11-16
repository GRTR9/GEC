input1 = load 'userdemand/userdemand.tsv' USING PigStorage ('\t') as (userid:chararray,time:chararray,artname:chararray,traname:chararray);
calendar = load 'calendar/calendar.csv' USING PigStorage (',') as (yMd:chararray,dofw:chararray,wnofy:chararray);
timesubstring = foreach input1 GENERATE userid, time, SUBSTRING (time, 0, 10) as stime, artname, traname;
jointime = JOIN timesubstring BY stime, calendar BY yMd;
newtime = foreach jointime GENERATE $0 as userid, $1 as time, $6 as dofw, $7 as wnofy, $3 as artname, $4 as traname;
rmf pig_example08
STORE newtime INTO 'pig_example08' using PigStorage('\t');
