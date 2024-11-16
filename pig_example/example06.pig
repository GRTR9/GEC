input1 = load 'userdemand/userdemand.tsv' USING PigStorage ('\t') as (userid:chararray,time:chararray,artname:chararray,traname:chararray); 
b1 = foreach input1 generate $0 as userid, $2 as artname; 
b2 = DISTINCT b1; 
b3 = group b2 by (artname); rmf example06; 
b4 = foreach b3 generate FLATTEN(group),COUNT(b2.userid) as num; 
b5 = filter b4 by (num < 2); 
b6 = group b5 all;
b7 = foreach b6 generate COUNT(b5);
rmf pig_example06
STORE b7 INTO 'pig_example06' using PigStorage('\t');
