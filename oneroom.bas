1 GOTO401 
2 *|  **  ONE ROOM ADVENTURE **
3 *|
4 *|        BY: JORGE MIR
5 *|
6 *|          (C) 1982
7 *|
8 *|  *************************
9 
10 CLS:PRINT"   * A ONE ROOM ADVENTURE *"
11 PRINT STRING$(32,"-");
12 PRINT:PRINT" YOU HAVE JUST AWAKENED.":PRINT:PRINT" YOU DON'T HAVE THE SLIGHTEST    IDEA WHERE YOU ARE OR EVEN      WHO YOU ARE!"
13 PRINT:PRINT" YOU SEEM TO HAVE AMNESIA FROM   A BLOW TO YOUR HEAD."
14 ST$=STRING$(32,CHR$(140))
15 DIM VB$(85),RM$(85),OB$(85),EX$(85),OB(85),D(85,6),D$(6),F(30),F$(30):MX=8:CA=0:XT=0
16 FOR X=1TO6:READ D$(X):NEXTX
17 X=0
18 X=X+1:READ RM$(X):IF RM$(X)="END" THEN 20
19 FOR Y=1TO6:READ D(X,Y):NEXTY:GOTO18
20 X=0
21 X=X+1:READ OB$(X):IF OB$(X)="END"THEN NO=X-1:GOTO24:ELSE READ I$,OB(X):OB$=OB$+I$
22 IF X>6 THEN READ EX$(X-6)
23 GOTO 21
24 X=0
25 X=X+1:READ I$:IF I$="END" THEN 26 ELSE VB$(X)=I$:VB$=VB$+LEFT$(I$,3):GOTO25
26 X=0
27 X=X+1:READ F$(X):IF F$(X)="END" THEN 28 ELSE GOTO27
28 GOSUB383
29 CLS:PRINT:PRINT" IF YOU GET STUCK AND DO NOT     KNOW WHAT TO DO, JUST TYPE IN   'HELP' AND SEE WHAT HAPPENS."
30 PRINT:PRINT" ALSO, IF SOME OF MY ANSWERS DO  NOT MAKE SENSE TO YOU, PLEASE   KEEP IN MIND THAT SOMETIMES I   MAY GET CONFUSED."
31 PRINT:PRINT" IF THAT HAPPENS, YOU SHOULD     JUST KEEP TRYING OTHER THINGS."
32 GOSUB 383
33 CLS:PRINT:PRINT" IF YOU GET TIRED OF PLAYING     THIS ADVENTURE AND YOU HAVEN'T  SOLVED IT.  JUST TYPE 'SAVE'."
34 PRINT:PRINT" YOU CAN CONTINUE THE ADVENTURE  AT A LATER TIME BY TYPING THE   WORD 'LOAD'."
35 GOSUB383
36 YOU=1
37 CLS:PRINT"I AM ";
38 IF YOU<0 THEN YOU=2
39 PRINT RM$(YOU):IF YOU>1 THEN 43
40 PRINT"I AM SITTING ON A CHAIR"
41 IF F(2)=0 THEN PRINT"I AM BLINDFOLDED"
42 GOTO 48
43 PRINT"I CAN SEE: ":F=0
44 FOR I=1 TO NO
45 IF INT(OB(I))<>INT(YOU) THEN 47
46 PRINT" "OB$(I):F=1
47 NEXT:IF F=0 THEN PRINT"  NOTHING INTERESTING"
48 IF BT>6 THEN F(1)=0
49 IF F(1)=1 THEN BT=BT+1:GOSUB385
50 IF F(13)=1 AND OB(49)<>0 THEN PRINT"SOMETHING JUST CAME THROUGH THE BROKEN WINDOW.":F(13)=0:OB(54)=6:EX$(37)="THERE IS A PIECE OF PAPER TIED  TO ONE OF ITS LEGS."
51 PRINT ST$;
52 INPUT"WHAT SHOULD I DO";I$
53 IF LEN(I$)=1 THEN X=INSTR("NSEWUD",I$):IF X>0 AND X<7 THEN YOU=X+1:GOTO37
54 IF I$=""THEN52 ELSE IF I$="LOOK" THEN CLS:GOTO37
55 IF I$="QUIT" THEN END
56 IF I$="SAVE" THEN 351
57 IF I$="HELP" THEN 92
58 IF I$="LOAD" THEN 357
59 IF I$="RADIO OFF" THEN F(1)=0:PRINT"OK, RADIO IS OFF.":GOTO48
60 IF I$="PLAY RADIO" OR I$="RADIO ON" THEN IF OB(14)=0 THEN F(1)=1:GOTO48:ELSE PRINT"IT NEEDS A BATTERY.":GOTO48
61 IF LEFT$(I$,3)<>"INV"THEN 67
62 CLS:PRINT"I AM CARRYING:":CA=0
63 FOR I=1TO NO
64 IF OB(I)=-1THEN PRINT"  ";OB$(I):CA=CA+1
65 NEXT:IF CA=0 THEN PRINT"NOTHING"
66 GOTO 48
67 REM
68 SP=INSTR(I$,CHR$(32)):IF SP=0 THEN PRINT"TRY USING TWO WORD COMMANDS.":GOTO48
69 V$=LEFT$(I$,SP-1):O$=MID$(I$,SP+1)
70 A$=LEFT$(V$,3):B$=LEFT$(O$,3)
71 IF A$="TAK" THEN A$="GET"
72 IF A$="LEA" THEN A$="DRO"
73 IF A$="LOO" THEN A$="FAC"
74 IF A$="MOV" THEN A$="PUS"
75 IF A$="TEA" THEN A$="BRE"
76 IF A$="TOU" THEN A$="FEE"
77 IF B$="FLO" THEN B$="DOW"
78 IF B$="CEI" THEN B$="UP "
79 IF A$="SHR" THEN A$="CUT"
80 IF A$="UNL" THEN A$="OPE"
81 IF B$="CB" THEN B$="RIG"
82 IF B$="BIR" THEN B$="DOV"
83 V=(INSTR(VB$,A$)+2)/3:IF V<1 THEN PRINT"SORRY, I JUST DON'T KNOW HOW TO":PRINT V$" ANYTHING.":GOTO 48
84 O=(INSTR(OB$,B$)+2)/3:IF O>1THEN115
85 IF A$="EXA"ANDB$="POC"THEN IF OB(35)=-1 AND OB(24)=0THENPRINT"I SEE A PAIR OF PLIERS.":GOTO48:ELSE IF OB(35)=-1 AND OB(24)<>0THEN PRINT"POCKETS ARE EMPTY":GOTO48:ELSEPRINT"I DON'T HAVE ANY POCKETS.":GOTO48
86 IF A$="EXA"ANDB$="ROO"THENPRINT"IT'S A LARGE ROOM.  THERE IS A  WINDOW AND A DOOR AND THERE ARE LOTS OF THINGS AROUND.":GOTO48
87 IF A$="EXA"ANDB$="GAT"THENPRINT"THE ONLY WAY TO OPEN IT IS TO   CUT THE WIRE.":GOTO48
88 GOTO115
89 *|**************************
90 *|****** HELP SECTION ******
91 *|**************************
92 INPUT"TELL ME WHICH OBJECT HAS YOU A  LITTLE PUZZLED";I$:PRINT ST$
93 IF I$="ROPE" THEN PRINT"HAVE YOU TRIED RUBBING IT ON    SOMETHING SHARP?":GOTO48
94 IF I$="RADIO" THEN PRINT"TRY PLAYING IT.":GOTO48
95 IF I$="CB" OR I$="SET" THEN PRINT"READ A BOOK ON IT.":GOTO48
96 IF I$="DOVE" OR I$="BIRD" THEN PRINT"LET IT FLY AWAY AND SEE WHAT    HAPPENS.":GOTO48
97 IF I$="MOUSE"OR I$="RAT" THEN PRINT"YOU CAN'T CATCH IT, SO DON'T    WASTE YOUR TIME.":GOTO48
98 IF I$="STOVE" THEN PRINT"THERE MAY BE SOMETHING IN IT.":GOTO48
99 IF I$="ANTENNA" THEN PRINT"YOU CAN MAKE AN ANTENNA OUT OF  WIRE.":GOTO48
100 IF I$="WINDOW" THEN PRINT"IT CAN'T BE OPENNED, SO DON'T   WASTE YOUR TIME.":GOTO48
101 IF I$="CORD"THENPRINT"IT WON'T DO ANY GOOD UNLESS IT  IS PLUGGED IN.":GOTO48
102 IF I$="ROOM" THEN PRINT"IN CASE YOU DIDN'T KNOW IT, YOU CAN ALSO LOOK UP OR DOWN.":GOTO48
103 IF I$="ME"ORI$="ALL" OR I$="" OR I$="ANYTHING" OR I$="EVERYTHING" THEN PRINT"TRY MOVING THINGS AROUND.":GOTO48
104 IF I$="BUTTON" THEN PRINT"IF YOU PUSH IT, YOU MAY BE ABLE TO TRANSMIT ON THE CB.":GOTO48
105 IF I$="CHAIR" THEN PRINT"HAVE YOU TRIED FEELING IT?":GOTO48
106 IF I$="DOOR" THEN PRINT"IT CAN ONLY BE OPENNED FROM THE OUTSIDE.":GOTO48
107 IF I$="GLASS" THEN PRINT"IT CAN BE USED FOR CUTTING.":GOTO48
108 IF I$="HANGER" THEN PRINT"MAYBE IT CAN BE USED AS A CB    ANTENNA.":GOTO48
109 IF I$="HOLE" THEN PRINT"TRYING COVERING THE HOLE WITH   SOMETHING.":GOTO48
110 IF I$="TOOLBOX" THEN PRINT"YOU NEED SOMETHING WITH WHICH   TO OPEN IT.":GOTO48
111 IF I$="PILLOW" THEN PRINT"TRY GETTING WHAT'S INSIDE.":GOTO48
112 IF I$="PAPER" THEN PRINT"YOU NEED TO HAVE SOMETHING IN   YOUR HANDS BEFORE YOU CAN READ  IT.":GOTO48
113 IF I$="BLINDFOLD"THEN PRINT"YOU NEED TO UNTIE    YOUR HANDS BEFORE YOU CAN REMOVEIT.":GOTO48
114 PRINT"SORRY, I CAN'T HELP YOU WITH    THAT ITEM.":GOTO48
115 F=0:IF OB(O)=YOU THEN F=1 ELSE IF OB(O)=-1 THEN F=2
116 *|IF PEEK(&H88)*256+PEEK(&H89)>1471THENCLS
117 ON V GOTO 120,146,154,167,172,181,205,212,215,222,227,229,235,239,242,246,253,257,261,266,275
118 IF LEN(I$)=1 THENPRINT"I CAN'T GO THAT WAY!":GOTO 37
119 PRINT"I DON'T UNDERSTAND WHAT YOU ARE TELLING ME.":GOTO48
120 *|*** GET ***
121 IF F(2)=0 THEN PRINT"I CAN'T GET ANYTHING NOW!":GOTO48
122 IF F=2 THEN PRINT"I ALREADY HAVE IT!":GOTO48
123 IF CA=>MX THEN PRINT"I CAN'T CARRY ANYTHING ELSE!":GOTO48
124 IF O<1 THEN PRINT"WHY DO YOU WANT TO DO THAT FOR?":GOTO48
125 IF O<7 OR O=15 OR O=16 OR O=17 OR O=26 OR O=39 OR O=40 OR O=41 OR O=46THEN PRINT"DON'T BE SILLY!":GOTO48
126 IF O=11 OR O=27 OR O=32OR O=50 THEN PRINT"I CAN'T, IT'S TOO HEAVY!":GOTO48
127 IF O=12 THEN IF F(6)=0 THEN PRINT"I CAN'T, DESK IS LOCKED.":GOTO48:ELSE EX$(O-6)="I SEE A CB SET.":IF V=3 THEN 166
128 IF O=43 AND OB(54)=0 THEN IF F(5)=0THEN PRINT"I CAN'T, THE CAGE IS NOT OPEN.":GOTO48
129 IF O=43 AND OB(49)=-1 THEN IF OB(54)=6 THEN OB(49)=0:OB(54)=0:GOTO144:ELSEPRINT"IT WON'T COME TO ME.":GOTO48
130 IF O=43 AND OB(49)<>-1THEN PRINT"IT WON'T COME TO ME.":GOTO48
131 IF O=45 THEN IF LEFT$(EX$(34),2)="I "THEN EX$(34)="THERE IS NOTHING IN THERE.":GOTO144:ELSE GOTO145
132 IF O=31 THEN PRINT"I CAN'T DO THAT.":GOTO48
133 IF O=30 THEN OB(31)=YOU
134 IF O=54 AND F(7)=1 THEN F(7)=0:OB(54)=0:OB(49)=0:O=43:GOTO144
135 IF O=55 AND OB(55)=0 THEN PRINT"I CAN'T, THE WIRE IS WRAPPED    TOO TIGHT.":GOTO48
136 IF O=35 THEN OB$(O)="A COAT":OB(36)=5:GOTO144
137 IF O=36 THEN OB$(O)="A HANGER":GOTO144
138 IF O=33 THEN EX$(26)="I SEE A CAN OPENER.":GOTO144
139 IF O=18 THEN OB(40)=3
140 IF O=29 THEN IF F(6)=0THEN145ELSE EX$(6)="IT'S NOW EMPTY.":GOTO144
141 IF O=44 AND LEFT$(EX$(37),1)<>"T" THEN PRINT"I DON'T SEE ANY PAPER HERE.":GOTO48 ELSE EX$(37)="IT'S A SPECIAL TYPE DOVE."
142 IF O=56 THEN EX$(26)="THERE IS NOTHING THERE.":GOTO144
143 IF O=49 THEN IF OB(49)=0 THEN 145 ELSE 144
144 OB(O)=-1:PRINT"OK, I GOT IT.":CA=CA+1:GOTO48
145 PRINT"I CAN'T GET THAT NOW.":GOTO48
146 *|*** DROP ***
147 IF F<>2 THEN 153
148 IF O=43 AND F(4)=1THEN PRINT"THE DOVE FLEW AWAY THROUGH THE  BROKEN WINDOW.":F(13)=1:OB(43)=0:GOTO152
149 IF O=43 THEN OB(43)=0:OB(54)=6:PRINT"OK, I LET THE DOVE GO.":GOTO152
150 IF YOU=6 THEN YOU=7
151 OB(O)=YOU:PRINT"OK, I DROPPED IT."
152 CA=CA-1:GOTO48
153 PRINT"I DON'T HAVE IT.":GOTO48
154 *|*** OPEN ***
155 IF O=13 THEN PRINT"THE BACK COVER POPPED OPEN AND  SOMETHING FELL TO THE FLOOR.":OB(14)=7:GOTO48
156 IF O=11 THEN IF OB(45)=-1 THEN F(6)=1:GOTO166:ELSE PRINT"I DON'T HAVE ANY KEYS.":GOTO48
157 IF O<>42GOTO159
158 IF OB(55)=0THENPRINT"I CAN'T, THE GATE IS WIRED SHUT.":GOTO48 ELSE IF F(4)=1THENPRINT"THE DOVE JUST FLEW OUT THROUGH  THE BROKEN WINDOW.":F(13)=1:F(5)=1: ELSEF(5)=1:OB(54)=6:F(7)=1:EX$(O-6)="IT'S EMPTY.":GOTO166
159 IF O=12 THEN127
160 IF O=40 THEN INPUT"THE COMBINATION";I$:IF I$="4R8L12R"THEN PRINT"CLICK!":EX$(O-6)="I SEE A SET OF KEYS.":GOTO166
161 IF O=21AND(F=1 OR F=2) THEN IF OB(56)=-1 THEN OB(22)=YOU:OB(23)=YOU:OB(25)=YOU:GOTO166:ELSE PRINT"THE TOP IS RUSTED AND CANNOT BE OPENED.":GOTO48
162 IF O=50 THEN IF OB(37)=0THEN PRINT"I OPENED THE STOVE AND SAW AN   ELECTRIC CORD INSIDE.":GOTO48ELSE PRINT"THERE IS NOTHING IN IT.":GOTO48
163 IF F=0GOTO380ELSE IF O=50THEN 166
164 PRINT"SORRY, IT DOES NOT OPEN.":GOTO48
165 PRINT"IT'S ALREADY OPEN.":GOTO48
166 PRINT"OK, IT'S NOW OPEN.":GOTO48
167 *|*** CLOSE ***
168 IF O=42 THEN IF F(5)=1 GOTO171 ELSE PRINT"IT'S ALREADY CLOSED.":GOTO48
169 IF F=0GOTO380
170 PRINT"I TRIED, BUT IT DOESN'T CLOSE.":GOTO48
171 PRINT"OK, IT'S NOW CLOSED.":GOTO48
172 *|*** EXAMINE ***
173 IF O<1 THEN PRINT"DID ANYBODY MENTION ANYTHING    ABOUT ANY";:PRINT MID$(I$,INSTR(I$," "));"?":GOTO48
174 IF F(2)=0 THEN PRINT"I CAN'T, I'M BLINDFOLDED.":GOTO48
175 IF O<7 THEN YOU=O+1:GOTO37
176 IF B$="POC"THEN IF OB(24)=0 ANDOB(35)=-1THEN PRINT"I SEE A PAIR OF PLIERS.":GOTO48:ELSE PRINT"THE POCKETS ARE EMPTY.":GOTO48
177 IF O=44 AND F<>2 THEN PRINT"I DON'T HAVE IT.":GOTO48
178 IF O=44 AND OB(51)<>-1THENPRINT"THERE IS PRINTING ON IT.":GOTO48
179 PRINT EX$(O-6):GOTO48
180 PRINT"NOTHING SPECIAL ABOUT IT.":GOTO48
181 *|*** PUSH ***
182 IF F<>1 THEN 187
183 IF O=11 THEN OB(15)=2:GOTO204
184 IF O=27 THEN OB(39)=YOU:GOTO204
185 IF O=30 THEN OB(31)=YOU:GOTO204
186 IF O=31 THEN IFOB(22)<>-1 THEN PRINT"I CAN'T WITH JUST MY HANDS.":GOTO48:ELSE OB(20)=YOU:GOTO204
187 IF O<>46 THEN 203
188 IF F(16)=0 THEN PRINT"IT WILL NOT WORK AT ALL WITHOUT AN ANTENNA!":GOTO48
189 IF OB(29)=0THEN 203
190 IF F(9)=0 OR F(10)=0 THEN PRINT"THE CB RIG DOES NOT SEEM TO BE  WORKING AT ALL.":GOTO48
191 PRINT"THE CB SWITCHED TO TRANSMIT.    WHAT DO YOU WANT TO SAY? ":LINE INPUT I$
192 IF F(14)=1 THEN BT=BT+1:IF BT=>10 THEN PRINT"SORRY BUDDY, BUT I CAN'T HEAR   YOU ANYMORE.  YOUR BATTERIES    MUST BE LOW.":EX$(8)="THEY ARE DEAD.":F(14)=0:GOTO48:ELSE PRINT"I HEAR YOU OLD BUDDY, KEEP ON   TALKING SO WE CAN FIND YOU.":BT=BT+1:GOTO48
193 IF F(15)=1 AND XT=0 THEN PRINT"I HEAR YOU OLD BUDDY, KEEP ON   TALKING SO WE CAN FIND YOU.":XT=XT+1:GOTO48:ELSE XT=XT+1
194 IF F(15)<>2 THEN 203 ELSE ON XT GOTO 196,197,198,199,200
195 PRINT"WE HEAR YOU OLD BUDDY!  KEEP    YAKING ON THAT RIG!":GOTO48
196 PRINT"WE ARE GETTING SOME MORE HELP.  JUST STAY PUT!":GOTO48
197 PRINT"WE GOT YOUR SIGNAL TRACKED DOWN AND WE THINK WE KNOW WHERE YOU  ARE!":GOTO48
198 PRINT"KEEP THOSE LIPS GOING, BUDDY,   SO WE CAN FIND YOU QUICKER.":GOTO48
199 PRINT"WE SEE A BUILDING IN THE FIELD. THAT MUST BE IT!":PRINT"WE'RE COMING IN!"
200 CLS:PRINT"THE TRUCK DRIVERS CRASHED THE   DOOR AND GOT YOU OUT SAFELY."
201 PRINT:PRINT"NEXT TIME BE MORE CAREFUL WHEN YOU SEE A ROBBERY TAKING PLACE!"
202 PRINT:PRINT:END
203 PRINT"NOTHING HAPPENED.":GOTO48
204 PRINT"OK, IT MOVED.":GOTO48
205 *|*** BREAK ***
206 IF F=0 THEN 380
207 INPUT"WITH WHAT";I$:GOSUB382:IF X>0THEN207
208 IF O=26 THEN IF I$="CROWBAR" OR I$="HAMMER" OR I$="RACK" THEN PRINT"THE GLASS WINDOW PANES BROKE.":F(4)=1:OB(19)=7:EX$(O-6)="THE WINDOW IS BROKEN.":GOSUB398:GOTO48:ELSE GOTO211
209 IF O=26 AND F(7)=1 THEN PRINT"THE DOVE FLEW OUT THE BROKEN    WINDOW.":F(13)=1:OB(54)=0:OB(43)=0:GOTO48
210 IF O=33 AND OB(19)=-1 THEN PRINT"SOMETHING FELL OUT OF IT.":OB(51)=7:EX$(27)="IT'S TORN AND THERE IS NOTHING  IN IT.":GOTO48
211 PRINT"I TRIED, BUT NOTHING HAPPENED.":GOTO48
212 *|*** ENTER ***
213 IF F=0 THEN 380
214 PRINT"I TRIED TO ENTER, BUT COULDN'T.":GOTO48
215 *|*** READ ***
216 IF F<>2 THEN PRINT"I DON'T HAVE IT.":GOTO48
217 IF O=28 THEN PRINT"THE BOOK SAYS:":PRINT"IN ORDER TO OPERATE CB SET YOU  NEED SOME POWER, AN ANTENNA     AND A MICROPHONE.":GOTO48
218 IF O=44 AND OB(51)<>-1THEN PRINT"THE PRINT IS TOO SMALL TO READ  WITH THE NAKED EYE.":GOTO48 ELSE PRINT EX$(O-6):GOTO48
219 IF F<>1 THEN 213
220 IF F=0 THEN 380
221 PRINT "NOTHING SPECIAL NOTED.":GOTO48
222 *|*** TURN ***
223 IF O=17 THEN F(10)=1:GOTO226
224 PRINT"I TRIED, BUT NOTHING HAPPENED.":GOTO48
225 IF F=0 GOTO 380
226 PRINT"OK, I TURNED IT.":GOTO48
227 *|*** RUN ***
228 PRINT"DON'T BE RIDICULOUS!":GOTO48
229 *|*** SHAKE ***
230 IF F<>2 THEN PRINT"I DON'T HAVE IT TO SHAKE.":GOTO48
231 IF O=48 THEN PRINT"SOME SEEDS FELL TO THE FLOOR.":ELSE 233
232 IF F(17)=0 THEN PRINT"A MOUSE ATE THE SEEDS AND TOOK  OFF BEFORE I COULD CATCH IT!":GOTO48:ELSE OB(49)=7:GOTO48
233 REM
234 PRINT"NOTHING HAPPENED.":GOTO48
235 *|*** UNTIE ***
236 IF F(3)=0 THEN 381
237 IF O=9 THEN 255
238 GOTO48
239 *|*** FEEL ***
240 IF O=7 THEN PRINT"I FEEL SOMETHING LIKE A NAIL.":GOTO48
241 PRINT"I DON'T FEEL ANYTHING UNUSUAL.":GOTO48
242 *|*** RUB ***
243 INPUT"ON WHAT";I$:GOSUB382:IFX>0THEN243
244 IF O=8 AND I$="NAIL" THEN F(3)=1:OB(8)=7:PRINT"OK, THE ROPE WAS TORN  BY THE   NAIL WHEN I RUBBED IT.":GOTO48
245 PRINT"NOTHING HAPPENED.":GOTO48
246 *|*** CUT ***
247 IF F(3)=0 THEN 381
248 INPUT"WITH WHAT";I$:GOSUB382:IF X>0THEN248
249 IF O=33 THEN 210
250 IF O=55 AND I$="PLIERS" AND OB(24)=-1 THEN PRINT"OK, THE WIRE IS NOW CUT.":OB(55)=7:EX$(49)="THE WIRE HAS BEEN CUT.":GOTO48:ELSE PRINT"I CAN'T.":GOTO48
251 IF O=33 AND F=0 AND (I$="GLASS" OR I$="BROKEN GLASS") THEN IF OB(19)<>-1 PRINT"I DON'T HAVE THE GLASS WITH ME.":GOTO48:ELSE IF OB(19)=-1 THEN PRINT"SOMETHING CAME OUT OF THE TORN  PILLOW.":OB(51)=7:EX$(27)="IT IS TORN.":GOTO48
252 PRINT"I CAN'T CUT IT.":GOTO48
253 *|*** REMOVE ***
254 IF F(3)=0 THEN 381
255 IF O=9 AND F(2)=0 THEN F(2)=1:PRINT"OK, I DID.":YOU=2:GOTO48
256 PRINT"IT CAN'T BE REMOVED.":GOTO48
257 *|*** FACE ***
258 IF O<1 THEN 172
259 IF O<7 THEN YOU=O+1:GOTO37
260 GOTO172
261 *|*** GO ***
262 IF F(2)=0 OR F(3)=0 THEN 281
263 IF OB(O)=0 THEN PRINT "I DON'T KNOW WHAT YOU MEAN!":GOTO48
264 IF OB(O)=-1 THEN PRINT"I CAN'T, I'M CARRYING IT!":GOTO48
265 YOU=OB(O):PRINT"OK, I DID.":GOTO48
266 *|*** CONNECT ***
267 IF F=0 THEN PRINT"I DON'T SEE THAT HERE.":GOTO48
268 INPUT"WHERE";I$:GOSUB382:IFX>0THEN268
269 IF O=37 ANDI$="OUTLET" THEN PRINT"OK, CORD IS NOW PLUGGED INTO THEOUTLET.":EX$(O-6)="IT'S PLUGGED IN.":IF LEFT$(EX$(23),2)="CB" THEN F(9)=1:EX$(23)="CB IS READY TO GO!":GOTO271:ELSEGOTO270
270 IF O=37 AND (I$="RIG" OR I$="CB")THEN PRINT"OK, CB RIG NOW HAS THE CORD     CONNECTED.":IF LEFT$(EX$(29),4)="THE" THEN F(9)=1:EX$(23)="CB NOW HAS A CORD AND MIKE.":GOTO48
271 IF F(15)=0THEN F(15)=1 ELSE IF F(15)=1 THEN F(15)=2:F(9)=1
272 IF O=55 THEN PRINT"THAT WIRE WON'T DO ANY GOOD, IT HAS BEEN CUT INTO SMALL PIECES.":GOTO48
273 IF O=36 THEN PRINT"OK, THE WIRE HANGER FIT NICELY  INTO THE ANTENNA JACK!":F(16)=1:GOTO48
274 IFO=37 THENGOTO48 ELSEPRINT"I CAN'T CONNECT THAT.":GOTO48
275 *|*** PUT ***
276 IF F<>2THENPRINT"I DON'T HAVE IT.":GOTO48:ELSEINPUT" WHERE";I$:GOSUB382:IF X>0THEN276
277 IF O=43 AND I$="CAGE" THEN EX$(36)="I SEE A DOVE.":OB(O)=0:F(5)=0:GOTO280
278 IF O=20 AND I$="HOLE"THEN PRINT"OK, THE HOLE IS NOW PLUGGED UP  AND THE MOUSE CAN'T GET OUT.":F(17)=1:OB(39)=0:OB(20)=5:GOTO48
279 PRINT"I CAN'T.":GOTO48
280 PRINT"OK, I DID.":GOTO48
281 PRINT"I CAN'T DO THAT.":GOTO48
282 *|*******DIRECTIONS******
283 DATA NORTH,SOUTH,EAST,WEST,UP,DOWN
284 *|*******  ROOMS  *******
285 DATA IN THE MIDDLE OF A ROOM,0,0,0,0,0,0
286 DATA FACING THE NORTH WALL,0,0,0,0,0,0
287 DATA FACING THE SOUTH WALL,0,0,0,0,0,0
288 DATA FACING THE EAST WALL,0,0,0,0,0,0
289 DATA FACING THE WEST WALL,0,0,0,0,0,0
290 DATA LOOKING AT THE CEILING,0,0,0,0,0,0
291 DATA LOOKING AT THE FLOOR,0,0,0,0,0,0
292 DATA END
293 *|****** OBJECTS *****
294 DATANORTH,NOR,0,SOUTH,SOU,0,EAST,EAS,0,WEST,WES,0,UP ,UP ,0,DOWN,DOW,0
295 DATA A CHAIR,CHA,2,THE CHAIR LOOKS RATHER FRAGILE.
296 DATA A PIECE OF ROPE,ROP,7,IT'S JUST A REGULAR ROPE.
297 DATA A BLINDFOLD,BLI,7,IT'S JUST A PIECE OF CLOTH.
298 DATA A NAIL,NAI,0,THE NAIL IS QUITE SHARP.
299 DATA A DESK,DES,2,IT'S THE TYPE WITH A ROLLOVER   TOP AND HAS A LARGE DRAWER ON   THE SIDE.
300 DATA A DRAWER,DRA,0,THE DRAWER IS LOCKED AND CAN'T  BE OPENNED.
301 DATA A RADIO,RAD,2,IT'S A PORTABLE RADIO.
302 DATA A BATTERY,BAT,0,IT'S A 12 VOLT BATTERY.
303 DATA AN ELECTRIC OUTLET,OUT,0,IT'S A 120 VOLT OUTLET.
304 DATA A DOOR,DOO,3,IT'S LOCKED FROM THE OUTSIDE.
305 DATA A SWITCH ON THE WALL,SWI,3,IT'S A LIGHT SWITCH
306 DATA A PICTURE,PIC,3,IT'S A PICTURE OF A BOAT IN A   NICE WOODEN FRAME.
307 DATA BROKEN GLASS,GLA,0,THE BROKEN GLASS IS VERY SHARP.
308 DATA A ROUND BOX,BOX,0,THE BOX IS EMPTY.
309 DATA A TOOLBOX,TOO,4,IT'S MADE OF METAL.
310 DATA A CROWBAR,CRO,0,JUST A REGULAR CROWBAR.
311 DATA A SCREWDRIVER,SCR,0,IT'S THE REGULAR KIND.
312 DATA A PAIR OF PLIERS,PLI,0,IT'S THE LONG NOSE TYPE.
313 DATA A HAMMER,HAM,0,NOTHING SPECIAL ABOUT IT.
314 DATA A WINDOW,WIN,5,THE PANES HAVE BEEN PAINTED.
315 DATA ANTIQUE FURNITURE,FUR,5,IT'S A BOOKCASE.
316 DATA A BOOK,BOO,0,IT'S A BOOK ON CB RADIOS.
317 DATA A CB RIG,RIG,0,THERE IS A MICROPHONE ALREADY   ATTACHED TO IT.
318 DATA A SMALL RUG,RUG,7,IT'S AN ORIENTAL RUG.
319 DATA A LOOSE BOARD,BOA,0,IT SEEMS TO GIVE A LITTLE.
320 DATA A COUCH,COU,4,THERE ARE SOME PILLOWS ON IT.
321 DATA PILLOW,PIL,0,IT FEELS RATHER HEAVY.
322 DATA A COAT RACK,RAC,5,IT'S MADE OF METAL.
323 DATA A COAT ON THE RACK,COA,5,IT'S A SPORTS COAT.
324 DATA A HANGER ON THE RACK,HAN,0,JUST A REGULAR WIRE HANGER.
325 DATA AN ELECTRIC CORD,COR,0,ONE END IS BARE AND THE OTHER   END HAS A PLUG ON IT.
326 DATA A MICROPHONE,MIC,0,IT IS ATTACHED TO THE CB SET ANDHAS A BUTTON ON IT.
327 DATA A HOLE ON THE WALL,HOL,0,LOOKS LIKE IT WAS MADE BY A     LARGE RAT.
328 DATA A VAULT ON THE WALL,VAU,0,IT HAS A COMBINATION LOCK ON IT.
329 DATA WALL,WAL,0,NOTHING SPECIAL ABOUT IT.
330 DATA A BIG BIRD CAGE,CAG,4,IT HAS A WHITE DOVE IN IT.
331 DATA A WHITE DOVE,DOV,0,IT'S A SPECIAL TYPE DOVE.
332 DATA A PIECE OF PAPER,PAP,0,THE CHARACTERS '4R8L12R' ARE    WRITTEN ON IT.
333 DATA A SET OF KEYS,KEY,0,I SEE SEVERAL SMALL KEYS.
334 DATA A RED BUTTON,BUT,0,JUST A REGULAR BUTTON.
335 DATA A FLOWER POT,POT,3,SUNFLOWERS ARE GROWING IN IT.
336 DATA SUNFLOWERS,SUN,0,THEY ARE KIND OF DRY.
337 DATA SUNFLOWER SEEDS,SEE,0,NOTHING SPECIAL ABOUT THEM.
338 DATA A WOODBURNING STOVE,STO,4,IT'S A FRANKLIN STOVE.
339 DATA A MAGNIFYING LENS,LEN,0,IT'S A SHERLOCK HOLMES OFFICIAL FAN CLUB LENS.
340 DATA PIECES OF WOOD,WOO,0,NOTHING SPECIAL.
341 DATA PIECES OF CARDBOARD,CAR,0,NOTHING SPECIAL.
342 DATA A BIRD FLYING AROUND,BIR,0,IT'S THE DOVE I SAW BEFORE.
343 DATA WIRE,WIR,0,IT'S HOLDING THE DOOR CLOSED.
344 DATA CAN OPENER,OPE,0,IT'S THE HEAVY DUTY TYPE.
345 DATA END
346 *|****** VERBS ******
347 DATA GET,DROP,OPEN,CLOSE,EXAMINE,PUSH,BREAK,ENTER,READ,TURN,RUN,SHAKE
348 DATA UNTIE,FEEL,RUB,CUT,REMOVE,FACE,GO ,CONNECT,PUT
349 DATA END
350 *|***** SAVE/LOAD ********
351 GOSUB363:OPEN"O",DV,"DATA"
352 PRINT#DV,YOU
353 FOR X=1 TO NO
354 PRINT#DV,OB(X)
355 NEXT X
356 CLOSE:CLS:GOTO37
357 GOSUB363:OPEN"I",DV,"DATA"
358 INPUT#DV,YOU
359 FOR X=1 TO NO
360 INPUT#DV,OB(X):NEXT X
361 IF EOF(DV) THEN CLOSE
362 CLS:GOTO37
363 CLS:PRINT"INDICATE DEVICE TO BE USED:"
364 PRINT:PRINT"  C - CASSETTE     D - DISK"
365 PRINT:INPUT"YOUR CHOICE";DV$
366 IF DV$="D" THEN DV=1 ELSE IF DV$="C" THEN DV=-1 ELSE 365
367 PRINT:PRINT"PRESS ANY KEY WHEN THE DEVICE   IS READY."
368 IF INKEY$=""THEN368 ELSE RETURN
369 *|***ELIMINATE OBJECT FROM
370 *|   OBJECT LIST
371 MID$(OB$,O*3-2,3)="   "
372 RETURN
373 *| *** FLAGS USED ***
374 DATA RADIO OFF OR ON, BLINDFOLD ON OR OFF, HANDS TIED OR UNTIED, WINDOW OK OR BROKEN
375 DATA BIRD CAGE CLOSED OR OPEN,DESK LOCKED OR UNLOCKED,BIRD IN ROOM OR NOT IN
376 DATA STOVE OFF OR ON,CB OFF OR ON,SWITCH OFF OR ON,ANTENNA OFF OR ON,TOOL BOX LOCKED OR UNLOCKED
377 DATA DOVE DID NOT LEAVE ROOM,CB RUNNING ON BATTERIES,CB RUNNING ON ELECTRICITY,ANTENNA OFF OR ON
378 DATA HOLE NOT PLUGGED OR PLUGGED,CORD NOT CONNECTED OR CONNECTED
379 DATA END
380 PRINT"I DON'T SEE ANYTHING LIKE THAT  AROUND HERE.":GOTO48
381 PRINT"I CAN'T, MY HANDS ARE TIED WITH A ROPE.":GOTO48
382 X=INSTR(I$," "):IF X>0 THEN PRINT:PRINT"PLEASE, ANSWER WITH ONE WORD.":PRINT:RETURN:ELSE RETURN
383 PRINT@482,"<PRESS ANY KEY TO CONTINUE>";
384 IF INKEY$=""THEN384 ELSE RETURN
385 IF BT<>3 THEN 392
386 SOUND100,10
387 CLS:PRINT" RADIO ANNOUNCER INTERRUPTS THE  PROGRAM!"
388 PRINT:PRINT" A TRUCK STOP HAS BEEN HELD UP.  ONE OF THE TRUCK DRIVERS HAS    BEEN KIDNAPPED."
389 PRINT:PRINT" THERE ARE HUNDREDS OF TRUCK-    DRIVERS SEARCHING AROUND FOR    THEIR FRIEND."
390 PRINT:PRINT" IF YOU HAVE A CB SET, TURN IT   ON AND LISTEN TO THE ACTION!"
391 RETURN
392 IF BT<>5 THEN PRINT"I HEAR MUSIC COMING FROM THE    RADIO.":RETURN
393 SOUND200,10
394 CLS:PRINT" RADIO ANNOUNCER INTERRUPTS THE  PROGRAM."
395 PRINT:PRINT" THE SEARCH FOR THE KIDNAPPED    TRUCK DRIVER CONTINUES."
396 PRINT:PRINT" HIS SEMI TRUCK WAS FOUND IN     AN ABANDONED ROAD.  THERE IS    SPECULATION HE MAY NOT BE       ALIVE."
397 RETURN
398 IF OB(54)<>0 OR OB(43)<>0  THEN PRINT"THE DOVE FLEW AWAY THROUGH THE  BROKEN WINDOW.":OB(54)=0:OB(43)=0:F(13)=1:RETURN
399 RETURN
400 GOTO 48
401 GOTO2
