input2 = load 'userprofile/userprofile.tsv' USING PigStorage ('\t') as (userid:chararray,gender:chararray,age:int,country:chararray,registered:chararray);
country = GROUP input2 BY country;
Ccountry = FOREACH country GENERATE group as country,COUNT(input2) as count;
LOCC = limit (ORDER Ccountry BY count DESC) 5;
rmf pig_example02;
STORE LOCC INTO 'pig_example02' using PigStorage('\t'); 
