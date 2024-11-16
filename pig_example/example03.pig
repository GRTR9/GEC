input2 = load 'userprofile/userprofile.tsv' USING PigStorage ('\t') as (userid:chararray,gender:chararray,age:int,country:chararray,registered:chararray);
age20_30 = FILTER input2 BY (age >= 20) AND (age <= 30);
Gage = GROUP age20_30 ALL;
Cage = FOREACH Gage GENERATE COUNT(age20_30) as count;
rmf pig_example03;
STORE Cage INTO 'pig_example03' using PigStorage('\t'); 
