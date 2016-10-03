prologues:=2;

verbatimtex
%\documentclass[12pt]{article}
%\usepackage[T1]{fontenc}
%\usepackage[dvips]{epsfig}
%\usepackage{amsmath}
etex


beginfig(1)  %transfo pi/2-x
u:=1cm;
 pickup pencircle scaled 0.2mm ;
  draw (-u,0)--(3u,0);
  draw (0,-0.6u)--(0,2.5u);
  drawarrow (0,0)--(1u,0)            withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)            withpen pencircle scaled 1bp;
 
  z0=(1.3,0)*u;
  z1=((sqrt 3)/2,0.5)*1.3u;
drawarrow z0{up}..z1 withpen pencircle scaled 1bp;

pair o,M,B,C,S;
o:=(0,0); M:=((sqrt 3)/2,0.5)*3u;
C:=((sqrt 3)/2,0)*3u; S:=(0,0.5)*3u; 
draw o--M ;% withpen pencircle scaled 0.8bp;  %rayon (Ox) à pi/6
draw M--C dashed evenly; draw M--S dashed evenly;

label.rt(btex ${\theta}$ etex, 1.1*(z0+z1)/2);
label.ulft(btex ${\rho}$ etex, (o+M)/2  );
label.top(btex $M$ etex, M );
dotlabel.llft(btex O etex, o );
dotlabel.bot(btex x etex, C );
dotlabel.lft(btex y etex, S );
label.bot(btex vi etex, (0.5u,0) );
label.lft(btex vj etex, (0,0.5u) );
endfig;

end