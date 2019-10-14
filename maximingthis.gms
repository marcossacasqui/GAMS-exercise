$Title  TRABAJO DE MARCOS SACASQUI, All rights reserved 2018
scalar xx / 0 /;
xx = 49;
VARIABLES
x,y,F;
EQUATIONS
obj,r1;
obj.. F=e=10*x+30*y;
r1.. 4*x+5*y=l=xx;
MODEL
Modelo /obj,r1/

****************************f.l************************************************
Set       iter Loop iterations /1*101/;
scalar    row  Row number in Excel Spreadsheet;
Parameter rep  Report;
File myput;
Put myput;
xx =49;
Loop(iter,
  row=ord(iter)+1;
  xx = xx + 1;
  Solve Modelo using lp maximizing F ;
  Put_utility 'log'    / 'Create GDX File %GAMS.curDir%Result' iter.tl:0 '.gdx';
  Put_utility 'gdxout' / 'Result' iter.tl:0 ;
  Execute_unload;
  Put_utility 'exec' / 'GDXXRW.EXE Result' iter.tl:0 '.gdx o=Result var=F.l rng=Sacasqui!A' row:0:0 ' trace=0';
  rep('F.l',iter)= F.l;
);
Putclose;

Display rep;
Execute_Unload "Report.gdx",rep;
Execute 'GDXXRW.EXE Report.gdx par=rep rng=a1 trace=0';

********************** y.l ***************************************************************

xx =49;
Loop(iter,
  row=ord(iter)+1;
  xx = xx + 1;
  Solve Modelo using lp maximizing F ;
  Put_utility 'log'    / 'Create GDX File %GAMS.curDir%Result' iter.tl:0 '.gdx';
  Put_utility 'gdxout' / 'Result' iter.tl:0 ;
  Execute_unload;
  Put_utility 'exec' / 'GDXXRW.EXE Result' iter.tl:0 '.gdx o=Result var=y.l rng=Sacasqui!B' row:0:0 ' trace=0';
  rep('y.l',iter)= y.l;
);
Putclose;

Display rep;
Execute_Unload "Report.gdx",rep;
Execute 'GDXXRW.EXE Report.gdx par=rep rng=b1 trace=0';

********************** x.m ***************************************************************

xx =49;
Loop(iter,
  row=ord(iter)+1;
  xx = xx + 1;
  Solve Modelo using lp maximizing F ;
  Put_utility 'log'    / 'Create GDX File %GAMS.curDir%Result' iter.tl:0 '.gdx';
  Put_utility 'gdxout' / 'Result' iter.tl:0 ;
  Execute_unload;
  Put_utility 'exec' / 'GDXXRW.EXE Result' iter.tl:0 '.gdx o=Result var=x.m rng=Sacasqui!C' row:0:0 ' trace=0';
  rep('x.m',iter)= x.m;
);
Putclose;

Display rep;
Execute_Unload "Report.gdx",rep;
Execute 'GDXXRW.EXE Report.gdx par=rep rng=c1 trace=0';

********************** b ***************************************************************

xx =49;
Loop(iter,
  row=ord(iter)+1;
  xx = xx + 1;
  Solve Modelo using lp maximizing F ;
  Put_utility 'log'    / 'Create GDX File %GAMS.curDir%Result' iter.tl:0 '.gdx';
  Put_utility 'gdxout' / 'Result' iter.tl:0 ;
  Execute_unload;
  Put_utility 'exec' / 'GDXXRW.EXE Result' iter.tl:0 '.gdx o=Result par=xx rng=Sacasqui!D' row:0:0 ' trace=0';
  rep('xx',iter)= xx;
);
Putclose;

Display rep;
Execute_Unload "Report.gdx",rep;
Execute 'GDXXRW.EXE Report.gdx par=rep rng=d1 trace=0';

