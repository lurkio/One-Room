10 CLS:PRINT'"    * A ONE ROOM ADVENTURE *"
11 PRINT STRING$(32,"-");
12 PRINT:PRINT'"You have just awakened.":PRINT:PRINT"You don't have the slightest idea where you are or even who you are!"
13 PRINT:PRINT"You seem to have amnesia from a blow to your head."
14 ST$=STRING$(32,CHR$(140))

15 DIM RM$(7),OB$(56),EX$(50),OB%(57),D$(6),F%(30):MX=8:CA=0:XT=0:BT=0

16 L%=OPENIN("DAT"):FOR X=1TO6:INPUT#L%,D$(X):N.

17 F.X=1TO7:INPUT#L%,RM$(X):N.

20 F.X=1TO56:INPUT#L%,OB$(X),I$,OB%(X)
21 IF X>6 THEN INPUT#L%,EX$(X-6)
22 NEXT:NO=56

23 INPUT#L%,OB$

24 INPUT#L%,VB$:CLOSE#L%

28 GOSUB383

29 CLS:PRINT:PRINT"If you get stuck and do not know what todo, just type in 'HELP' and see what"'"happens."
30 PRINT:PRINT"Also, if some of my answers do not make sense to you, please keep in mind that  sometimes I may get confused."
31 PRINT:PRINT"If that happens, you should just keep   trying other things."
32 GOSUB 383
33 CLS:PRINT:PRINT"If you get tired of playing this"'"adventure and you haven't solved it,"'"just type 'SAVE'."
34 PRINT:PRINT"You can continue the adventure at a"'"later time by typing the word 'LOAD'."
35 GOSUB383
36 YOU=1
37 CLS:PRINT'"I am ";
38 IF YOU<0 THEN YOU=2
39 PRINT RM$(YOU):IF YOU>1 THEN 43
40 PRINT"I am sitting on a chair."
41 IF F%(2)=0 THEN PRINT"I am blindfolded."
42 GOTO 48
43 PRINT"I can see: ":F=0
44 FOR I=1 TO NO
45 IF INT(OB%(I))<>INT(YOU) THEN 47
46 PRINT" "OB$(I):F=1
47 NEXT:IF F=0 THEN PRINT"  NOTHING INTERESTING"
48 IF BT>6 THEN F%(1)=0
49 IF F%(1)=1 THEN BT=BT+1:GOSUB385
50 IF F%(13)=1 AND OB%(49)<>0 THEN PRINT"Something just came through the broken window.":F%(13)=0:OB%(54)=6:EX$(37)="There is a piece of paper tied to one of its legs."
REM 51 PRINT ST$;
52 INPUT'"What should I do? "I$
53 IF LEN(I$)=1 THEN X=INSTR("NSEWUD",I$):IF X>0 AND X<7 THEN YOU=X+1:GOTO37
54 IF I$=""THEN52 ELSE IF I$="LOOK" THEN CLS:GOTO37
55 IF I$="QUIT" THEN END
56 IF I$="SAVE" THEN 351
57 IF I$="HELP" THEN 92
58 IF I$="LOAD" THEN 357
59 IF I$="RADIO OFF" THEN F%(1)=0:PRINT"OK, radio is off.":GOTO48
60 REP.IF I$<>"PLAY RADIO"ANDI$<>"RADIO ON" U.1 EL.IFOB%(14)=0 F%(1)=1:U.1:GOTO48 ELSE PRINT"It needs a battery.":U.1:GOTO48
61 IF LEFT$(I$,3)<>"INV"THEN 67
62 CLS:PRINT'"I am carrying:":CA=0
63 FOR I=1TO NO
64 IF OB%(I)=-1THEN PRINT"  ";OB$(I):CA=CA+1
65 NEXT:IF CA=0 THEN PRINT"NOTHING"
66 GOTO 48
67 REM
68 SP=INSTR(I$,CHR$(32)):IF SP=0 THEN PRINT"Try using two-word commands.":GOTO48
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
83 V=(INSTR(VB$,A$)+2)/3:IF V<1 THEN PRINT"Sorry, i just don't know how to":PRINT V$" anything.":GOTO 48
84 O=(INSTR(OB$,B$)+2)/3:IF O>1THEN115

85 REP.IFA$<>"EXA"ORB$<>"POC"U.1EL.IF OB%(35)=-1ANDOB%(24)=0PRINT"I see a pair of pliers.":U.1:GOTO48:EL.REP.IF OB%(35)<>-1 OR OB%(24)=0PRINT"Pockets are empty.":U.1:U.1:GOTO48 ELSEPRINT"I don't have any pockets.":U.1:U.1:GOTO48

86 IF A$="EXA"ANDB$="ROO"THENPRINT"It's a large room. There is a window anda door and there are lots of things"'"around.":GOTO48
87 IF A$="EXA"ANDB$="GAT"THENPRINT"The only way to open it is to cut the"'"wire.":GOTO48
88 GOTO115

89 *|**************************
90 *|****** HELP SECTION ******
91 *|**************************
92 INPUT'"Tell me which object has you a little"'"puzzled: "I$:PRINT
93 IF I$="ROPE" THEN PRINT"Have you tried rubbing it on something  sharp?":GOTO48
94 IF I$="RADIO" THEN PRINT"Try playing it.":GOTO48
95 IF I$="CB" OR I$="SET" THEN PRINT"Read a book on it.":GOTO48
96 IF I$="DOVE" OR I$="BIRD" THEN PRINT"Let it fly away and see what happens.":GOTO48
97 IF I$="MOUSE"OR I$="RAT" THEN PRINT"You can't catch it, so don't waste your time.":GOTO48
98 IF I$="STOVE" THEN PRINT"There may be something in it.":GOTO48
99 IF I$="ANTENNA" THEN PRINT"You can make an antenna out of wire.":GOTO48
100 IF I$="WINDOW" THEN PRINT"It can't be opened, so don't waste your time.":GOTO48
101 IF I$="CORD"THENPRINT"It won't do any good unless it is"'"plugged in.":GOTO48
102 IF I$="ROOM" THEN PRINT"In case you didn't know it, you can alsolook UP or DOWN.":GOTO48
103 IF I$="ME"ORI$="ALL" OR I$="" OR I$="ANYTHING" OR I$="EVERYTHING" THEN PRINT"Try moving things around.":GOTO48
104 IF I$="BUTTON" THEN PRINT"If you push it, you may be able to"'"transmit on the CB.":GOTO48
105 IF I$="CHAIR" THEN PRINT"Have you tried feeling it?":GOTO48
106 IF I$="DOOR" THEN PRINT"It can only be opened from the outside.":GOTO48
107 IF I$="GLASS" THEN PRINT"It can be used for cutting.":GOTO48
108 IF I$="HANGER" THEN PRINT"Maybe it can be used as a CB antenna.":GOTO48
109 IF I$="HOLE" THEN PRINT"Try covering the hole with something.":GOTO48
110 IF I$="TOOLBOX" THEN PRINT"You need something with which to open"'"it.":GOTO48
111 IF I$="PILLOW" THEN PRINT"Try getting what's inside.":GOTO48
112 IF I$="PAPER" THEN PRINT"You need to have something in your hands before you can read it.":GOTO48
113 IF I$="BLINDFOLD"THEN PRINT"You need to untie your hands before you can remove it.":GOTO48
114 PRINT"Sorry, I can't help you with that item.":GOTO48
115 F=0:IF OB%(O)=YOU THEN F=1 ELSE IF OB%(O)=-1 THEN F=2
116 *|IF PEEK(&H88)*256+PEEK(&H89)>1471THENCLS
117 ON V GOTO 120,146,154,167,172,181,205,212,215,222,227,229,235,239,242,246,253,257,261,266,275
118 IF LEN(I$)=1 THENPRINT"I can't go that way!":GOTO 37
119 PRINT"I don't understand what you are telling"'"me.":GOTO48

120 *|*** GET ***
121 IF F%(2)=0 THEN PRINT"I can't get anything now!":GOTO48
122 IF F=2 THEN PRINT"I already have it!":GOTO48
123 IF CA>=MX THEN PRINT"I can't carry anything else!":GOTO48
124 IF O<1 THEN PRINT"Why do you want to do that for?":GOTO48
125 IF O<7 OR O=15 OR O=16 OR O=17 OR O=26 OR O=39 OR O=40 OR O=41 OR O=46THEN PRINT"Don't be silly!":GOTO48
126 IF O=11 OR O=27 OR O=32OR O=50 THEN PRINT"I can't, it's too heavy!":GOTO48
127 IF O=12 THEN IF F%(6)=0 THEN PRINT"I can't, desk is locked.":GOTO48:ELSE IF O=12 EX$(O-6)="I see a CB set.":IF V=3 THEN 166
128 IF O=43 AND OB%(54)=0 THEN IF F%(5)=0THEN PRINT"I can't, the cage is not open.":GOTO48

129 REP.IF O<>43 OR OB%(49)<>-1 U.1EL. IF OB%(54)=6 THEN OB%(49)=0:OB%(54)=0:U.1:GOTO144:ELSEPRINT"It won't come to me.":U.1:GOTO48

130 IF O=43 AND OB%(49)<>-1THEN PRINT"It won't come to me.":GOTO48

131 IF O=45 THEN IF LEFT$(EX$(34),2)="I "THEN EX$(34)="There is nothing in there.":GOTO144:ELSE IF O=45 GOTO145

132 IF O=31 THEN PRINT"I can't do that.":GOTO48
133 IF O=30 THEN OB%(31)=YOU
134 IF O=54 AND F%(7)=1 THEN F%(7)=0:OB%(54)=0:OB%(49)=0:O=43:GOTO144
135 IF O=55 AND OB%(55)=0 THEN PRINT"I can't, the wire is wrapped too tight.":GOTO48
136 IF O=35 THEN OB$(O)="A COAT":OB%(36)=5:GOTO144
137 IF O=36 THEN OB$(O)="A HANGER":GOTO144
138 IF O=33 THEN EX$(26)="I see a can opener.":GOTO144
139 IF O=18 THEN OB%(40)=3

140 IF O=29 THEN IF F%(6)=0THEN145ELSE IFO=29 EX$(6)="It's now empty.":GOTO144

141 IF O=44 AND LEFT$(EX$(37),1)<>"T" THEN PRINT"I don't see any paper here.":GOTO48 ELSE EX$(37)="It's a special type dove."

142 IF O=56 THEN EX$(26)="There is nothing there.":GOTO144
143 IF O=49 THEN IF OB%(49)=0 THEN 145 ELSE IF O=49 G.144
144 OB%(O)=-1:PRINT"OK, I got it.":CA=CA+1:GOTO48
145 PRINT"I can't get that now.":GOTO48

146 *|*** DROP ***
147 IF F<>2 THEN 153
148 IF O=43 AND F%(4)=1THEN PRINT"The dove flew away through the broken"'"window.":F%(13)=1:OB%(43)=0:GOTO152
149 IF O=43 THEN OB%(43)=0:OB%(54)=6:PRINT"OK, I let the dove go.":GOTO152
150 IF YOU=6 THEN YOU=7
151 OB%(O)=YOU:PRINT"OK, I dropped it."
152 CA=CA-1:GOTO48
153 PRINT"I don't have it.":GOTO48

154 *|*** OPEN ***
155 IF O=13 THEN PRINT"The back cover popped open and somethingfell to the floor.":OB%(14)=7:GOTO48

156 IF O=11 THEN IF OB%(45)=-1 THEN F%(6)=1:GOTO166 EL.IF O=11 PRINT"I don't have any keys.":GOTO48

157 IF O<>42GOTO159

158 IF OB%(55)=0THENPRINT"I can't, the gate is wired shut.":GOTO48 ELSE IF F%(4)=1THENPRINT"The dove just flew out through the"'"broken window.":F%(13)=1:F%(5)=1 ELSEF%(5)=1:OB%(54)=6:F%(7)=1:EX$(O-6)="It's empty.":GOTO166

159 IF O=12 THEN127
160 IF O=40 THEN INPUT" The combination? "I$:IF I$="4R8L12R"THEN PRINT"CLICK!":EX$(O-6)="I see a set of keys.":GOTO166

161 IF O=21AND(F=1 OR F=2) THEN IF OB%(56)=-1 THEN OB%(22)=YOU:OB%(23)=YOU:OB%(25)=YOU:GOTO166:ELSE IF O=21AND(F=1 OR F=2) PRINT"The top is rusted and cannot be opened.":GOTO48

162 IF O=50 THEN IF OB%(37)=0THEN PRINT"I opened the stove and saw an electric"'"cord inside.":GOTO48ELSE IFO=50 PRINT"There is nothing in it.":GOTO48

163 IF F=0GOTO380ELSE IF O=50THEN 166
164 PRINT"Sorry, it does not open.":GOTO48
165 PRINT"It's already open.":GOTO48
166 PRINT"OK, it's now open.":GOTO48

167 *|*** CLOSE ***
168 IF O=42 THEN IF F%(5)=1 GOTO171 ELSE IFO=42 PRINT"It's already closed.":GOTO48
169 IF F=0GOTO380
170 PRINT"I tried, but it doesn't close.":GOTO48
171 PRINT"OK, it's now closed.":GOTO48

172 *|*** EXAMINE ***
173 IF O<1 THEN PRINT"did anybody mention anything about any";:PRINT MID$(I$,INSTR(I$," "));"?":GOTO48
174 IF F%(2)=0 THEN PRINT"I can't, I'm blindfolded.":GOTO48
175 IF O<7 THEN YOU=O+1:GOTO37

176 IF B$="POC"THEN IF OB%(24)=0 ANDOB%(35)=-1THEN PRINT"I see a pair of pliers.":GOTO48:ELSE IF B$="POC" PRINT"The pockets are empty.":GOTO48

177 IF O=44 AND F<>2 THEN PRINT"I don't have it.":GOTO48
178 IF O=44 AND OB%(51)<>-1THENPRINT"There is printing on it.":GOTO48
179 PRINT EX$(O-6):GOTO48
180 PRINT"Nothing special about it.":GOTO48

181 *|*** PUSH ***
182 IF F<>1 THEN 187
183 IF O=11 THEN OB%(15)=2:GOTO204
184 IF O=27 THEN OB%(39)=YOU:GOTO204
185 IF O=30 THEN OB%(31)=YOU:GOTO204

186 IF O=31 THEN IFOB%(22)<>-1 THEN PRINT"I can't with just my hands.":GOTO48:ELSE IFO=31 OB%(20)=YOU:GOTO204

187 IF O<>46 THEN 203
188 IF F%(16)=0 THEN PRINT"It will not work at all without an"'"antenna!":GOTO48
189 IF OB%(29)=0THEN 203
190 IF F%(9)=0 OR F%(10)=0 THEN PRINT"The CB rig does not seem to be working  at all.":GOTO48
191 INPUTLINE"The CB switched to transmit. What do youwant to say? "I$

192 IF F%(14)=1 BT=BT+1:IFBT>=10P."Sorry buddy, but I can't hear you"'"anymore. Your batteries must be low.":EX$(8)="They are dead.":F%(14)=0:G.48:EL.IF F%(14)=1P."I hear you old buddy, keep on talking sowe can find you.":BT=BT+1:G.48

193 IF F%(15)=1 AND XT=0 THEN PRINT"I hear you old buddy, keep on talking sowe can find you.":XT=XT+1:GOTO48:ELSE XT=XT+1

194 IF F%(15)<>2 THEN 203 ELSE ON XT GOTO 196,197,198,199,200
195 PRINT"'We hear you old buddy! Keep yakking on that rig!'":GOTO48
196 PRINT"'We are getting some more help. Just"'"stay put!'":GOTO48
197 PRINT"'We got your signal tracked down and we think we know where you are!'":GOTO48
198 PRINT"'Keep those lips going, buddy, so we canfind you quicker.'":GOTO48
199 PRINT"'We see a building in the field. That"'"must be it!'":PRINT'"'We're coming in!'"
200 PRINT'"The truck drivers crashed the door and  got you out safely."
201 PRINT:PRINT"Next time be more careful when you see arobbery taking place!"
202 PRINT:PRINT:END
203 PRINT"Nothing happened.":GOTO48
204 PRINT"OK, it moved.":GOTO48

205 *|*** BREAK ***
206 IF F=0 THEN 380
207 INPUT" With what? "I$:GOSUB382:IF X>0THEN207

208 IF O=26 THEN IF I$="CROWBAR" OR I$="HAMMER" OR I$="RACK" THEN PRINT"The glass window panes broke.":F%(4)=1:OB%(19)=7:EX$(O-6)="The window is broken.":GOSUB398:GOTO48:ELSE IF O=26 GOTO211

209 IF O=26 AND F%(7)=1 THEN PRINT"The dove flew out the broken window.":F%(13)=1:OB%(54)=0:OB%(43)=0:GOTO48
210 IF O=33 AND OB%(19)=-1 THEN PRINT"Something fell out of it.":OB%(51)=7:EX$(27)="It's torn and there is nothing in it.":GOTO48
211 PRINT"I tried, but nothing happened.":GOTO48

212 *|*** ENTER ***
213 IF F=0 THEN 380
214 PRINT"I tried to enter, but couldn't.":GOTO48

215 *|*** READ ***
216 IF F<>2 THEN PRINT"I don't have it.":GOTO48
217 IF O=28 THEN PRINT"The book says:":PRINT"In order to operate CB set you need somepower, an antenna and a microphone.":GOTO48

218 IF O=44 AND OB%(51)<>-1THEN PRINT"The print is too small to read with the naked eye.":GOTO48 ELSE PRINT EX$(O-6):GOTO48

219 IF F<>1 THEN 213
220 IF F=0 THEN 380
221 PRINT "Nothing special noted.":GOTO48

222 *|*** TURN ***
223 IF O=17 THEN F%(10)=1:GOTO226
224 PRINT"I tried, but nothing happened.":GOTO48
225 IF F=0 GOTO 380
226 PRINT"OK, I turned it.":GOTO48

227 *|*** RUN ***
228 PRINT"Don't be ridiculous!":GOTO48

229 *|*** SHAKE ***
230 IF F<>2 THEN PRINT"I don't have it to shake.":GOTO48

231 IF O=48 THEN PRINT"Some seeds fell to the floor.":ELSE 233

232 IF F%(17)=0 THEN PRINT"A mouse ate the seeds and took off"'"before i could catch it!":GOTO48:ELSE OB%(49)=7:GOTO48

233 REM
234 PRINT"NOTHING HAPPENED.":GOTO48

235 *|*** UNTIE ***
236 IF F%(3)=0 THEN 381
237 IF O=9 THEN 255
238 GOTO48

239 *|*** FEEL ***
240 IF O=7 THEN PRINT"I feel something like a nail.":GOTO48
241 PRINT"I don't feel anything unusual.":GOTO48

242 *|*** RUB ***
243 INPUT" On what? "I$:GOSUB382:IFX>0THEN243
244 IF O=8 AND I$="NAIL" THEN F%(3)=1:OB%(8)=7:PRINT"OK, the rope was torn by the nail when Irubbed it.":GOTO48
245 PRINT"Nothing happened.":GOTO48

246 *|*** CUT ***
247 IF F%(3)=0 THEN 381
248 INPUT" With what? "I$:GOSUB382:IF X>0THEN248
249 IF O=33 THEN 210

250 IF O=55 AND I$="PLIERS" AND OB%(24)=-1 THEN PRINT"OK, the wire is now cut.":OB%(55)=7:EX$(49)="The wire has been cut.":GOTO48:ELSE PRINT"I can't.":GOTO48

251 REP.IFO<>33ORF<>0OR(I$<>"GLASS"ANDI$<>"BROKEN GLASS")U.1EL.IFOB%(19)<>-1P."I don't have the glass with me.":U.1:G.48:EL.IFOB%(19)=-1P."Something came out of the torn pillow.":OB%(51)=7:EX$(27)="It is torn.":U.1:GOTO48

252 PRINT"I can't cut it.":GOTO48

253 *|*** REMOVE ***
254 IF F%(3)=0 THEN 381
255 IF O=9 AND F%(2)=0 THEN F%(2)=1:PRINT"OK, I did.":YOU=2:GOTO48
256 PRINT"It can't be removed.":GOTO48

257 *|*** FACE ***
258 IF O<1 THEN 172
259 IF O<7 THEN YOU=O+1:GOTO37
260 GOTO172

261 *|*** GO ***
262 IF F%(2)=0 OR F%(3)=0 THEN 281
263 IF OB%(O)=0 THEN PRINT "I don't know what you mean!":GOTO48
264 IF OB%(O)=-1 THEN PRINT"I can't, i'm carrying it!":GOTO48
265 YOU=OB%(O):PRINT"OK, I did.":GOTO48

266 *|*** CONNECT ***
267 IF F=0 THEN PRINT"I don't see that here.":GOTO48
268 INPUT" Where? "I$:GOSUB382:IFX>0THEN268

269 REP.IF O<>37ORI$<>"OUTLET"U.1EL.PRINT"OK, cord is now plugged into the outlet.":EX$(O-6)="It's plugged in.":IF LEFT$(EX$(23),2)="CB" THEN F%(9)=1:EX$(23)="CB is ready to go!":U.1:GOTO271:ELSE U.1:GOTO270

270 IF O=37 AND (I$="RIG" OR I$="CB")THEN PRINT"OK, CB rig now has the cord connected.":IF LEFT$(EX$(29),4)="THE" THEN F%(9)=1:EX$(23)="CB now has a cord and mike.":GOTO48
271 IF F%(15)=0THEN F%(15)=1 ELSE IF F%(15)=1 THEN F%(15)=2:F%(9)=1
272 IF O=55 THEN PRINT"That wire won't do any good, it has beencut into small pieces.":GOTO48
273 IF O=36 THEN PRINT"OK, the wire hanger fit nicely into the antenna jack!":F%(16)=1:GOTO48
274 IFO=37 THENGOTO48 ELSEPRINT"I can't connect that.":GOTO48

275 *|*** PUT ***
276 IF F<>2THENPRINT"I don't have it.":GOTO48:ELSEINPUT" Where? "I$:GOSUB382:IF X>0THEN276
277 IF O=43 AND I$="CAGE" THEN EX$(36)="I see a dove.":OB%(O)=0:F%(5)=0:GOTO280
278 IF O=20 AND I$="HOLE"THEN PRINT"OK, the hole is now plugged up and the  mouse can't get out.":F%(17)=1:OB%(39)=0:OB%(20)=5:GOTO48
279 PRINT"I can't.":GOTO48
280 PRINT"OK, I did.":GOTO48
281 PRINT"I can't do that.":GOTO48

350 *|***** SAVE/LOAD ********
351 ONERROR ONERROROFF:V.7:P.'"ERROR. Couldn't save!":TIME=0:REP.U.TIME>300:GOTO37
352 DV%=OPENOUT("DATA"):PRINT#DV%,YOU,OB$(35),OB$(36),EX$(6),EX$(8),EX$(20),EX$(23),EX$(26),EX$(27),EX$(31),EX$(34),EX$(36),EX$(37),EX$(49)
353 FOR X%=1 TO NO
354 PRINT#DV%,OB%(X%)
355 NEXT:F.X%=1TO30:PRINT#DV%,F%(X%):N.
356 CLOSE#DV%:ONERROROFF:CLS:GOTO37
357 ONERROR ONERROROFF:V.7:P.'"ERROR. Couldn't load!":TIME=0:REP.U.TIME>300:GOTO37
358 DV%=OPENIN("DATA"):INPUT#DV%,YOU,OB$(35),OB$(36),EX$(6),EX$(8),EX$(20),EX$(23),EX$(26),EX$(27),EX$(31),EX$(34),EX$(36),EX$(37),EX$(49)
359 FOR X%=1 TO NO
360 INPUT#DV%,OB%(X%):NEXT:F.X%=1TO30:INPUT#DV%,F%(X%):N.
361 IF EOF#DV% THEN CLOSE#DV%:ONERROROFF
362 CLS:GOTO37

380 PRINT"I don't see anything like that around"'"here.":GOTO48
381 PRINT"I can't, my hands are tied with a rope.":GOTO48
382 X=INSTR(I$," "):IF X>0 THEN PRINT:PRINT"Please answer with one word.":PRINT:RETURN:ELSE RETURN

383 PRINT'"<PRESS ANY KEY TO CONTINUE>";:*FX21,0
384 IFGET RETURN

385 IF BT<>3 THEN 392
386 SOUND1,-15,50,10
387 PRINT'"Radio announcer interrupts the program!"
388 PRINT:PRINT"'A truck stop has been held up. One of"'"the truck drivers has been kidnapped.'"
389 PRINT:PRINT"'There are hundreds of truck drivers"'"searching around for their friend.'"
390 PRINT:PRINT"'If you have a CB set, turn it on and"'"listen to the action!'"
391 RETURN
392 IF BT<>5 THEN PRINT"I hear music coming from the radio.":RETURN
393 SOUND1,-15,50,10
394 PRINT'"Radio announcer interrupts the program."
395 PRINT:PRINT"'The search for the kidnapped truck"'"driver continues.'"
396 PRINT:PRINT"'His semi truck was found in an"'"abandoned road. There is speculation he may not be alive.'"
397 RETURN
398 IF OB%(54)<>0 OR OB%(43)<>0 THEN PRINT"The dove flew away through the broken window.":OB%(54)=0:OB%(43)=0:F%(13)=1:RETURN
399 RETURN
400 GOTO 48

