options nocenter nodate nonumber skip=0 ls=80 formdlim=''
  formchar = '|----|+|---+=|-/\<>*';
title; footnote;
data oil;
	do method = 1 to 3;
		do field = 1 to 4;
			do reps = 1 to 2;
			input barrels @@;
			output;
			end;
		end;
	end;
cards;
2 1 4 2 3 1 1 1
4 5 3 3 6 7 6 5
6 4 8 8 7 8 5 6
;
proc print;
proc anova;
	class method field;
	model barrels = method field method*field;
	test h = method e = method*field;
quit;	
	