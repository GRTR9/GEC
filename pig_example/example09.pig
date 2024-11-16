input1 = load 'userdemand/userdemand.tsv' USING PigStorage ('\t') as (userid:chararray,time:chararray,artname:chararray,traname:chararray);
input2 = load 'userprofile/userprofile.tsv' USING PigStorage ('\t') as (userid:chararray,gender:chararray,age:int,country:chararray,registered:chararray);
in1 = foreach input1 generate userid,artname,traname;
in2 = foreach input2 generate userid,country;
in3 = join in2 by userid, in1 by userid;
f4 = foreach in3 generate $0 as userid,$1 as country,$3 as artname,$4 as traname;
d = DISTINCT f4;
topm = group d by (country,traname,artname);
cc = foreach topm generate FLATTEN(group),COUNT(d) as cnt;
fc = group cc by $0;
gfc = foreach fc {
	cf = foreach cc generate $1 as traname,$2 as artname,$3 as cnt;
	occ = order cf by cnt desc,traname asc;
	locc = limit occ 3;
	generate group,locc;
}
rmf pig_example09
STORE gfc INTO 'pig_example09' using PigStorage('\t');
