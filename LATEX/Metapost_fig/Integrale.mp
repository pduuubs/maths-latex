prologues:=2;
verbatimtex
 %\documentclass{article}
 %\usepackage[latin1]{inputenc}
 %\usepackage[frenchb]{babel}
 %\usepackage{amsmath}
 %\begin{document}
etex


beginfig(1) 
  u:=1cm; 
  pair O,A,B,C,D,E,F,G;
  path p[];
   O:=(0,0);A:=(0,3u); B:=(2.7u,1.5u); C:=(5*u,0.8u);
  D:=(xpart C,0); E:=(xpart B,0); F:=(xpart C,ypart B);
  G:=(xpart B,ypart C);
    %pickup pencircle scaled 0.5bp;
  
  %draw E--F;
  %dotlabel.urt(btex $A$ etex, A);
  %dotlabel.urt(btex $B$ etex, B);
  %label.urt(btex $C$ etex, C);
  %label.urt(btex $D$ etex, D);
  %label.bot(btex $E$ etex, E);
  %label.top(btex $F$ etex, F);
  p0=O--A{dir -3}..B{dir -20}--E--cycle;
  fill p0 withcolor 0.7white;
  p1= E--G--C--D--cycle;
  p2= E--B--F--D--cycle;
  fill p2 withcolor 0.9white;
  draw E--B--F--D dashed evenly;
  N:=16;
  pickup pencircle scaled 1.2bp;
  for i=1 upto N:
    draw (xpart B+0.5pt,i*(ypart C)/(N+1))--(xpart C-0.5pt,i*(ypart C)/(N+1)) dashed withdots scaled 0.4;
    endfor;
  pickup pencircle scaled 0.8bp;
  draw O--A{dir -3}..B{dir -20}..C{dir -7}..(xpart C+0.4*u,ypart C-0.05*u);
  drawarrow O--(xpart C+0.5*u,0);
  drawarrow O--(0,ypart A+0.5*u);
  pickup pencircle scaled 0.5bp;
  draw C--(0,ypart C) dashed evenly scaled 0.5;
  draw B--(0,ypart B) dashed evenly scaled 0.5;
  label(btex $A(x)$ etex, (1.2u,2u));
  label.bot (btex $x$ etex, (xpart B,0));
   label.bot (btex $0$ etex, (0,0));
  label.bot (btex $x+h$ etex, (xpart C,0));
  label.lft (btex $f(x)$ etex, (0,ypart B));
  label.lft (btex $f(x+h)$ etex, (0,ypart C));
  label.urt(btex $C_f$ etex, (1.4u,2.3u));
endfig;


beginfig(2) 
  u:=1cm; 
  pair O,A,B,C,D,E,F,G,O[];
  path p[];
  O1:=(0,0);O:=(0.6u,0);A:=(0.6u,1.5u); B:=(3.3u,2u); C:=(5*u,1.3u);
  D:=(xpart C,0); E:=(xpart B,0); %F:=(xpart C,ypart B);
  G:=(xpart B,ypart C);
    %pickup pencircle scaled 0.5bp;
  
  %draw E--F;
  %label.urt(btex $A$ etex, A);
  
  %label.urt(btex $B$ etex, B);
  %label.urt(btex $C$ etex, C);
  %label.urt(btex $D$ etex, D);
  %label.bot(btex $E$ etex, E);
  %label.top(btex $F$ etex, F);
  p0=O--A{dir -3}..B{dir -20}--E--cycle;
  fill p0 withcolor 0.7white;


   p3= E--B{dir -20}..C{dir -7}--D--cycle;
   fill p3 withcolor 0.8white;
   
   draw E--B dashed evenly;
   draw D--C dashed evenly;
   draw (xpart A, 0)--A dashed evenly;
 
  pickup pencircle scaled 1.2bp;
 %COURBE
  pickup pencircle scaled 0.8bp;
  draw A{dir -3}..B{dir -20}..C{dir -7}..(xpart C+0.4*u,ypart C-0.05*u);
  %AXES
  drawarrow O1--(xpart C+0.5*u,0);
  drawarrow O1--(0,ypart A+0.5*u);
  pickup pencircle scaled 0.5bp;

  label.bot (btex $c$ etex, (xpart B,0));
   label.bot (btex $0$ etex, (0,0));
   label.bot (btex $b$ etex, (xpart C,0));
   label.bot (btex $a$ etex, (xpart O,0));
 
   label.top(btex $C_f$ etex, C);

   label.bot(btex $\displaystyle\int_a^c f(x) {\rm d}x$ etex, ((0.5*xpart A+0.5*xpart E),1.2u) );
   label.bot(btex $\displaystyle\int_c^b f(x) {\rm d}x$ etex, ((0.5*xpart E+0.5*xpart D),1.2u) );
 endfig;
 beginfig(3)  %Moyenne
  u:=1cm; 
  pair O,A,B,C,D,E,F,G,O[];
  path p[];
  numeric m;
  O1:=(0,0);O:=(0.6u,0);A:=(0.6u,0.2u); B:=(3.3u,2u); C:=(5*u,0.8u);
  D:=(xpart C,0); E:=(xpart B,0); %F:=(xpart C,ypart B);
  G:=(xpart B,ypart C);
    %pickup pencircle scaled 0.5bp;
  
  %draw E--F;
  %label.urt(btex $A$ etex, A);
  
  %label.urt(btex $B$ etex, B);
  %label.urt(btex $C$ etex, C);
  %label.urt(btex $D$ etex, D);
  %label.bot(btex $E$ etex, E);
  %label.top(btex $F$ etex, F);
  %p0=O--A{dir -3}..B{dir -20}--E--cycle;
  %fill p0 withcolor 0.7white;
m=1.25u;
   p2=O--(xpart A,m )--(xpart C,m )--(xpart C,0)--cycle;
   p3= O--A{dir -3}..B{dir -20}..C{dir -7}--D--cycle;
   pickup pencircle scaled 0.8bp;
%draw p2 dashed evenly;
   fill p2 withcolor 0.85white;
   draw O--(xpart A,m )--(xpart C,m )--(xpart C,0) dashed evenly;
   draw (0,m)--(xpart A,m ) dashed evenly;
   %draw E--B dashed evenly;
   draw D--C dashed evenly;
   draw (xpart A, 0)--A dashed evenly;
 
  pickup pencircle scaled 1.2bp;
 %COURBE
  pickup pencircle scaled 0.8bp;
  draw A{dir -3}..B{dir -20}..C{dir -7};%..(xpart C+0.4*u,ypart C-0.05*u);
  %AXES
  drawarrow O1--(xpart C+0.5*u,0);
  drawarrow O1--(0,ypart B+0.5*u);
  pickup pencircle scaled 0.5bp;

  %label.bot (btex $c$ etex, (xpart B,0));
   label.bot (btex $0$ etex, (0,0));
   label.bot (btex $b$ etex, (xpart C,0));
   label.bot (btex $a$ etex, (xpart O,0));
 label.lft (btex $\bar{f}$ etex, (0,m));
   label.top(btex $C_f$ etex, (0.5A+0.5B)+(0,0.5u));

   %label.bot(btex $\displaystyle\int_a^c f(x) {\rm d}x$ etex, ((0.5*xpart A+0.5*xpart E),1.2u) );
   %label.bot(btex $\displaystyle\int_c^b f(x) {\rm d}x$ etex, ((0.5*xpart E+0.5*xpart D),1.2u) );
 endfig;
 
beginfig(4)   %Aire entre courbes
  vardef f(expr x) = 0.5*x*(3-x) enddef;
  vardef g(expr x) = x*x-6*x+6 enddef;
  path p[];
  u:=1cm;
 
  %---------
  v=0.8cm;
  xmin=0;      % 
  xmax=5;       % 
  xscl=1;         %
  ymin=-3.5;        % 
  ymax=3;         % 
  yscl=1;         %
  M=50;

   p3=(1u,v)..(1.5u,1.125v)..(3u,0)..(4u,-1.99v);
  p6=p3..(4u,-2v){dir 235}..(3u,-3v)..(2u,-2v)..(u,v)..cycle;
  fill p6 withcolor 0.7white;
  
  pickup pencircle scaled 0.5pt;
    drawarrow ( (xmin,0) -- (xmax,0) ) scaled u ; 
    drawarrow ( (0,ymin) -- (0,ymax) ) scaled v;
  xmax:=4.5;  
  p1= ( ( xmin*u, (f(xmin))*v )
        for i=1 upto M:
    ..( (xmin + (i/M)*(xmax - xmin))*u, (f( xmin + (i/M)*(xmax - xmin) ))*v)
  endfor ) ;
xmin:=0.6;  xmax:=5;
p2= ( ( xmin*u, (g(xmin))*v )
        for i=1 upto M:
    ..( (xmin + (i/M)*(xmax - xmin))*u, (g( xmin + (i/M)*(xmax - xmin) ))*v)
  endfor ) ;
draw p1;
draw p2;
%p3=(1u,v)..(1.5u,1.125v)..(3u,0)..(4u,-1.99v);
%p4=(u,v)..(2u,-2v)..(3u,-3v)..(4u,-2v){dir 55};
%p6=p3..(4u,-2v){dir 235}..(3u,-3v)..(2u,-2v)..(u,v)..cycle;
%p5=buildcycle(p3,p4);
%draw p6;
%draw p3;
%draw p4;
%fill p6 withcolor 0.7white;
label.urt(btex $y= x(3-x)/2$ etex, (1.5u,1.2v));
label.urt(btex $y=x^2-6x+6$ etex, (0.5u,-3.6v));
endfig;

beginfig(5)   %Aire entre courbes pareil en petit pour exo
  vardef f(expr x) = 0.5*x*(3-x) enddef;
  vardef g(expr x) = x*x-6*x+6 enddef;
  path p[];
  u:=0.5cm;
 
  %---------
  v:=0.4cm;
  xmin:=0;      % 
  xmax:=5;       % 
  xscl:=1;         %
  ymin:=-3.5;        % 
  ymax:=3;         % 
  yscl:=1;         %
  M:=50;

   p3=(1u,v)..(1.5u,1.125v)..(3u,0)..(4u,-1.99v);
  p6=p3..(4u,-2v){dir 235}..(3u,-3v)..(2u,-2v)..(u,v)..cycle;
  fill p6 withcolor 0.7white;
  
  pickup pencircle scaled 0.5pt;
    drawarrow ( (xmin,0) -- (xmax,0) ) scaled u ; 
    drawarrow ( (0,ymin) -- (0,ymax) ) scaled v;
  xmax:=4.5;  
  p1= ( ( xmin*u, (f(xmin))*v )
        for i=1 upto M:
    ..( (xmin + (i/M)*(xmax - xmin))*u, (f( xmin + (i/M)*(xmax - xmin) ))*v)
  endfor ) ;
xmin:=0.6;  xmax:=5;
p2= ( ( xmin*u, (g(xmin))*v )
        for i=1 upto M:
    ..( (xmin + (i/M)*(xmax - xmin))*u, (g( xmin + (i/M)*(xmax - xmin) ))*v)
  endfor ) ;
draw p1;
draw p2;
%p3=(1u,v)..(1.5u,1.125v)..(3u,0)..(4u,-1.99v);
%p4=(u,v)..(2u,-2v)..(3u,-3v)..(4u,-2v){dir 55};
%p6=p3..(4u,-2v){dir 235}..(3u,-3v)..(2u,-2v)..(u,v)..cycle;
%p5=buildcycle(p3,p4);
%draw p6;
%draw p3;
%draw p4;
%fill p6 withcolor 0.7white;
%label.urt(btex $y= x(3-x)/2$ etex, (1.5u,1.2v));
%label.urt(btex $y=x^2-6x+6$ etex, (0.5u,-3.6v));
endfig; 
end