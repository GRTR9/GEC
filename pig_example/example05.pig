input1 = load 'userdemand/userdemand.tsv' USING PigStorage ('\t') as (userid:chararray,time:chararray,artname:chararray,traname:chararray);
b1 = foreach input1 generate $0 as userid, $2 as artname, $3 as traname;
b2 = DISTINCT b1;
b3 = group b2 by (traname,artname);
b4 = foreach b3 generate FLATTEN(group),COUNT(b2.userid) as num;
b5 = order b4 by num desc,group::traname asc;
b6 = limit b5 10;
rmf pig_example05;
STORE b6 INTO 'pig_example05' using PigStorage('\t'); 
