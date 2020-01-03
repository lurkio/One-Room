  5 @%=2
 10 *FX15
 15 CLS

 20 DIM RM$(7),OB$(56),EX$(50),OB%(57),D$(6),F%(30)
 25 REM DIM VB$(21),D%(8,6),F$(19) *** Not used in actual prog!!!

 30 PRINT'"-- START --"':L%=OPENIN("DAT")

 35 REM *** DIRECTIONS ***
 40 FOR X=1TO6:INPUT#L%,D$(X):PRINTD$(X)
 50 NEXTX

 55 REM *** ROOM DESCRIPTIONS & EXITS *** D(X,Y) not used in actual prog!!!
 60 F.X=1TO7:PRINT
 65 INPUT#L%,RM$(X)
 75 PRINTRM$(X);" ";
 90 NEXT:P.'

 95 REM *** OBJECTS ***
100 F.X=1TO56
105 INPUT#L%,I$
110 OB$(X)=I$:PRINTX;" ";OB$(X);", ";:INPUT#L%,I$,OB%(X):PRINTI$;", ";OB%(X);
120 IF X>6 THEN INPUT#L%,EX$(X-6):PRINT", ";EX$(X-6);
125 PRINT:NEXT
130 INPUT#L%,OB$:PRINT'OB$'

135 REM *** VERBS *** VB$() not used in actual prog!!!
165 INPUT#L%,VB$:PRINTVB$'

185 PRINT'"--END--"'
190 CLOSE#L%
195 END


