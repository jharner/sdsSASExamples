DATA random;
    DO i=1 to 25;
        y = 10 + 2*NORMAL(-1);
        OUTPUT;
    End;
RUN;
PROC MEANS DATA=random;
    VAR Y;
RUN;