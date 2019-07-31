options linesize = 80 pagesize = 56 nodate pageno = 1;

filename temp "/folders/myfolders/oil.csv";

data oil;
infile temp dlm = "," firstobs = 2;
input method $ field barrels;
run;

proc print data = oil;
run;

proc mixed data = oil; * method = type3;
class method field;
model barrels = method;
random field field*method;
lsmeans method / cl diff; 
run;

proc glm data = oil;
	class method field;
	model barrels = method field method*field;
	test h = method e = method*field;
run;

quit;