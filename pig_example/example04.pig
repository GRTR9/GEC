input2 = load 'userprofile/userprofile.tsv' USING PigStorage ('\t') as (userid:chararray,gender:chararray,age:int,country:chararray,registered:chararray);
age = GROUP input2 BY age;
Cage = FOREACH age GENERATE group as age,COUNT(input2.age) as count;
LOCC = limit (ORDER Cage BY age DESC) 1;
rmf pig_example04;
STORE LOCC INTO 'pig_example04' using PigStorage('\t');

