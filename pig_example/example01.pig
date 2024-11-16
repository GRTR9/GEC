input2 = load 'userprofile/userprofile.tsv' USING PigStorage ('\t') as (userid:chararray,gender:chararray,age:int,country:chararray,registered:chararray);
gender = GROUP input2 BY gender;
Cgender = FOREACH gender GENERATE group as gender,COUNT(input2);
rmf pig_example01;
STORE Cgender INTO 'pig_example01' using PigStorage('\t'); 
quit;