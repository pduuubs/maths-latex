prologues:=2;
%&latex
verbatimtex
%\documentclass[12pt]{article}
%\usepackage[T1]{fontenc}
%\usepackage[dvips]{epsfig}
%\usepackage{amsmath}
etex
input constantes;
input papiers;

%\begin{document}


def star (expr size, n, pos, color) =
  for a=0 step 360/n until 360 :
draw (origin -- (size/2,0))
rotatedaround (origin,a)
shifted pos withcolor color ;
  endfor ;
enddef ;

def gradcercle (expr n, unite) =  %gradue un cercle trigo, tous les n degrés.

  for a=0 step n  until 360 :     %n: nb de degrés; unite:unité de mesure
draw ((0.97,0)*unite -- (1.03,0)*unite) 
rotatedaround (origin,a) ;
 endfor ;
enddef ;

def graddroite (expr n, unite) =  %gradue la tangente au cercle en (1,0) tous les n degrés
  for a=0 step n  until 180 :%n: nb de degrés; unite:unité de mesure
    draw ((0.97,0)*unite -- (1.03,0)*unite) shifted ((0,(6.283185)*a/360)*unite);
    draw ((0.97,0)*unite -- (1.03,0)*unite) shifted ((0,-(6.283185)*a/360)*unite);
 endfor ;
enddef ;

def gradaxe (expr pas,n, unite) =  %gradue l'axe Ox tous les n degrés
  for a=pas step pas  until n :  %n: nb de degrés; unite:unité de mesure
    draw ((0,0.02)*unite -- (0,-0.02)*unite) shifted ((2*pi*a/360,0)*unite);
   
 endfor ;
enddef ;

vardef enroulage (expr n ,unite) =
  %v = unite* unitvector(direction t of p) rotated 180;
    drawarrow (1,(6.283185)*n/360)*unite{left}..((1,0)*u rotatedaround (origin,n)){dir (-180+n)};
  enddef;

vardef mylabel(expr pic, p, t) =
    save A; pair A;
    A = point t of p +
        8bp * unitvector(direction t of p) rotated 90;
    label(pic, A);
  enddef;


beginfig(1)
  u:=3cm;
 pickup pencircle scaled 0.2mm ;
 star(2u,12,origin, 0.7white) ; %12 rayons en gris
 star(2u,8,origin, 0.5white) ; %8 rayons gris foncé
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)   withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)   withpen pencircle scaled 1bp;
  %draw (0,0) withpen pencircle scaled 4bp;
  path p; 
  p = (0,0)..(-u,u)..(u,u);

	    p:=fullcircle scaled 2.5u; %diametre du cercle
	    draw fullcircle scaled 2u;
	   
	    i:=length(p)/12; 	    mylabel(btex ${\pi}\over {6}$ etex,p,i);
	    i:=length(p)/8; 	    mylabel(btex ${\pi}\over {4}$ etex,p,i);
	    i:=length(p)/6; 	    mylabel(btex ${\pi}\over {3}$ etex,p,i);
	    i:=length(p)/4;         mylabel(btex ${\pi}\over {2}$ etex,p,i);
	    i:=5length(p)/12; 	    mylabel(btex ${5\pi}\over {6}$ etex,p,i);
	    i:=3length(p)/8; 	    mylabel(btex ${3\pi}\over {4}$ etex,p,i);
	    i:=2length(p)/6; 	    mylabel(btex $2{\pi}\over {3}$ etex,p,i);

            i:=-length(p)/12; 	    mylabel(btex $-{{\pi}\over {6}}$ etex,p,i);
	    i:=-length(p)/8; 	    mylabel(btex $-{{\pi}\over {4}}$ etex,p,i);
	    i:=-length(p)/6; 	    mylabel(btex $-{{\pi}\over {3}}$ etex,p,i);
	    i:=-length(p)/4; 	    mylabel(btex $-{{\pi}\over {2}}$ etex,p,i);
	    i:=-5length(p)/12;      mylabel(btex $-{{5\pi}\over {6}}$   etex,p,i);
i:=-3length(p)/8; mylabel(btex $-{{3\pi}\over {4}}$ etex,p,i);
i:=-2length(p)/6; mylabel(btex $-{{2\pi}\over {3}}$ etex,p,i);
i:=length(p)/2; mylabel(btex $\pi$ etex,p,i);
i:=length(p); mylabel(btex $0$ etex,p,i);

	   dotlabel.llft(btex $O$ etex, (0,0));

	    
 % endfor;
	 endfig;



	 
  beginfig(2)  %transfo -x
u:=3cm;
 pickup pencircle scaled 0.2mm ;
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)            withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)            withpen pencircle scaled 1bp;
  draw fullcircle scaled 2u;

pair o,A,B,C,D,E,S;
  o:=(0,0); A:=((sqrt 3)/2,0.5)*u; C:=((sqrt 3)/2,0)*u; S:=(0,0.5)*u; D:=-C; E:=-S;
draw o--A;  %rayon (Ox) à pi/6
draw A--C dashed evenly; draw A--S dashed evenly;
label.llft(btex $O$ etex,o);
  B:=((sqrt 3)/2,-0.5)*u; 
  draw o--B ;
  draw B--C dashed evenly; draw B--E dashed evenly;
  path p; 
  p = (0,0)..(-u,u)..(u,u);
  p:=fullcircle scaled 2.5u;
  i:=length(p)/12;   mylabel(btex $x$ etex,p,i);
  i:=-length(p)/12;   mylabel(btex $-x$ etex,p,i);
endfig;

beginfig(3)  %transfo pi-x
u:=3cm;
 pickup pencircle scaled 0.2mm ;
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)            withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)            withpen pencircle scaled 1bp;
  draw fullcircle scaled 2u;

pair o,A,B,C,D,E,S,BB;
  o:=(0,0); A:=((sqrt 3)/2,0.5)*u; C:=((sqrt 3)/2,0)*u; S:=(0,0.5)*u; D:=-C; E:=-S;
draw o--A;  %rayon (Ox) à pi/6
draw A--C dashed evenly; draw A--S dashed evenly;
label.llft(btex $O$ etex,o);
BB:=((sqrt 3)/2,-0.5)*u;
  B:=(-(sqrt 3)/2,0.5)*u; 
  draw o--B ;
  draw B--D dashed evenly; draw B--S dashed evenly; draw o--BB dashed withdots;


  path p; 

  
 
  p = (0,0)..(-u,u)..(u,u);
  p:=fullcircle scaled 2.5u;
  i:=length(p)/12;   mylabel(btex $x$ etex,p,i);
  i:=5length(p)/12;   mylabel(btex ${\pi}-x$ etex,p,i);


endfig;
 beginfig(4)  %transfo pi+x
u:=3cm;
 pickup pencircle scaled 0.2mm ;
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)            withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)            withpen pencircle scaled 1bp;
  draw fullcircle scaled 2u;

pair o,A,B,C,D,E,S,BB;
  o:=(0,0); A:=((sqrt 3)/2,0.5)*u; C:=((sqrt 3)/2,0)*u; S:=(0,0.5)*u; D:=-C; E:=-S;
label.ulft(btex $O$ etex,o);
  draw o--A;  %rayon (Ox) à pi/6
draw A--C dashed evenly; draw A--S dashed evenly;

  B:=(-(sqrt 3)/2,-0.5)*u; 
  draw o--B ;
  draw B--D dashed evenly; draw B--E dashed evenly; 


 
  path p; 
  p = (0,0)..(-u,u)..(u,u);
  p:=fullcircle scaled 2.5u;
  i:=length(p)/12;   mylabel(btex $x$ etex,p,i);
  i:=7length(p)/12;   mylabel(btex ${\pi}+x$ etex,p,i);
endfig;

 beginfig(5)  %transfo pi/2-x
u:=3cm;
 pickup pencircle scaled 0.2mm ;
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)            withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)            withpen pencircle scaled 1bp;
  draw fullcircle scaled 2u;


pair o,A,B,C,D,E,S,BB;
  o:=(0,0); A:=((sqrt 3)/2,0.5)*u; C:=((sqrt 3)/2,0)*u; S:=(0,0.5)*u; D:=(0.5,0)*u; E:=(0,(sqrt 3)/2)*u;
draw o--A;  %rayon (Ox) à pi/6
draw A--C dashed evenly; draw A--S dashed evenly;
label.llft(btex $O$ etex,o);
BB:=((sqrt 3)/2,-0.5)*u;
  B:=(0.5,(sqrt 3)/2)*u; 
  draw o--B ;
  draw B--D dashed evenly; draw B--E dashed evenly; draw o--BB dashed withdots;



    path p; 
  p = (0,0)..(-u,u)..(u,u);
  p:=fullcircle scaled 2.5u;
  i:=length(p)/12;   mylabel(btex $x$ etex,p,i);
  i:=length(p)/6;   mylabel(btex ${{\pi}\over {2}}-x$ etex,p,i);
endfig;

beginfig(6)%Enroulement
  u:=2.3cm;
 pickup pencircle scaled 0.2mm ;
% star(2u,12,origin, 0.7white) ; %12 rayons en gris
% star(2u,8,origin, 0.5white) ; %8 rayons gris foncé
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)   withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)   withpen pencircle scaled 1bp;
  %draw (0,0) withpen pencircle scaled 4bp;
  draw fullcircle scaled 2u;
  draw (1,-3.3)*u--(1,3.3)*u;
pickup pencircle scaled 1.2bp ;
  gradcercle (30,u);
  graddroite (30,u);
pickup pencircle scaled 0.5bp ;
  gradcercle (15,u);
  graddroite (15,u);
  enroulage (90 ,u);
  enroulage (120 ,u);
  enroulage (-60 ,u);
 % enroulage (210 ,u);  
  enroulage (-150 ,u);

  PI=3.1415926;
   label.rt(btex ${\pi}\over {6}$ etex,(1,PI/6)*u);
   label.rt(btex ${\pi}\over {4}$ etex,(1,PI/4)*u);
   label.rt(btex ${\pi}\over {3}$ etex,(1,PI/3)*u);
   label.rt(btex ${\pi}\over {2}$ etex,(1,PI/2)*u);
label.rt   (btex ${5 \pi}\over {6}$ etex,(1,5*PI/6)*u);
label.rt   (btex ${3 \pi}\over {4}$ etex,(1,3*PI/4)*u);
label.rt   (btex ${2 \pi}\over {3}$ etex,(1,2*PI/3)*u);
label.rt   (btex $-{{\pi}\over {6}}$ etex,(1,-PI/6)*u);
label.rt   (btex $-{{\pi}\over {4}}$ etex,(1,-PI/4)*u);
  label.rt (btex $-{{\pi}\over {3}}$ etex,(1,-PI/3)*u);
label.rt   (btex $-{{\pi}\over {2}}$ etex,(1,-PI/2)*u);
label.rt   (btex $-{{5 \pi}\over {6}}$   etex,(1,-5*PI/6)*u);
label.rt   (btex $-{{3 \pi}\over {4}}$ etex,(1,-3*PI/4)*u);
label.rt   (btex $-{{2 \pi}\over {3}}$ etex,(1,-2*PI/3)*u);
label.rt   (btex ${\pi}$ etex,(1,PI)*u);
label.rt   (btex $0, I$ etex,(1,0)*u);
  dotlabel.llft(btex $O$ etex, (0,0));
  dotlabel.lft   (btex $1$ etex,(1,1)*u);
  dotlabel.lft   (btex $2$ etex,(1,2)*u);
  dotlabel.lft   (btex $3$ etex,(1,3)*u);
  dotlabel.lft   (btex $-1$ etex,(1,-1)*u);
  dotlabel.lft   (btex $-2$ etex,(1,-2)*u);
  dotlabel.lft   (btex $-3$ etex,(1,-3)*u);
  label.lft   (btex $D$ etex,(0.9,1.4)*u);
  label.lft   (btex $C$ etex,(-0.65,0.9)*u);
label.bot   (btex $\vi$ etex,(0.4,0)*u);

 label.lft   (btex $\vj$ etex,(-0.08,0.5)*u);
  
  
 % endfor;
 endfig;
  beginfig(7)  %cercle trigo simple
u:=2cm;
 pickup pencircle scaled 0.2mm ;
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(0.97u,0)            withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,0.97u)            withpen pencircle scaled 1bp;
  draw fullcircle scaled 2u;
  pair M;
  M:=(1,0)*u rotated 60 ;
  draw origin--M withpen pencircle scaled 0.2bp;
label.bot   (btex $\vi$ etex,(0.45,0)*u);
   label.lft   (btex $\vj$ etex,(-0.1,0.5)*u);
    dotlabel.llft(btex $O$ etex, (0,0));
  dotlabel.urt(btex $M$ etex, M);
  label.lft   (btex $C$ etex,(-0.7,-0.8)*u);
label.rt   (btex $I$ etex,(1,0)*u);
label.lft   (btex $I'$ etex,(-1,0)*u);
label.top   (btex $J$ etex,(0,1)*u);
label.bot   (btex $J'$ etex,(0,-1)*u);

%path p; 
  %p = (0,0)..(-u,u)..(u,u);
  %p:=quartercircle scaled 2.5u;
  %drawarrow p;
 
endfig;
beginfig(8)%Cercle gradué
  u:=3cm;
 pickup pencircle scaled 0.2mm ;
% star(2u,12,origin, 0.7white) ; %12 rayons en gris
% star(2u,8,origin, 0.5white) ; %8 rayons gris foncé
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)   withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)   withpen pencircle scaled 1bp;
  %draw (0,0) withpen pencircle scaled 4bp;
  draw fullcircle scaled 2u;
  pickup pencircle scaled 1.2bp ;
  gradcercle (30,u);
   pickup pencircle scaled 0.3bp ;
   gradcercle (15,u);
   label.bot   (btex $\vi$ etex,(0.4,0)*u);
  label.lft   (btex $\vj$ etex,(-0.08,0.5)*u);
  dotlabel.llft(btex $O$ etex, (0,0));
 
endfig;
beginfig(9)%cercle trigo gradué tous les pi/12 sur fond de papier milli pour tracer la courbe de sin
  papiermillimetre((0,0),2,2,(-2,-2),(13,2),orange);
  u:=2cm;
 pickup pencircle scaled 0.2mm ;
% star(2u,12,origin, 0.7white) ; %12 rayons en gris
% star(2u,8,origin, 0.5white) ; %8 rayons gris foncé
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
 % drawarrow (0,0)--(1u,0)   withpen pencircle scaled 1bp;
 % drawarrow (0,0)--(0,1u)   withpen pencircle scaled 1bp;
  %draw (0,0) withpen pencircle scaled 4bp;
  draw fullcircle scaled 2u;
  pickup pencircle scaled 0.8bp ;
  gradcercle (30,u);
  pickup pensquare scaled 0.8bp ;
  gradaxe (30,360,u);
  pickup pencircle scaled 0.4bp ;
  gradcercle (15,u);
  pickup pensquare scaled 0.4bp ;
  gradaxe (15,360,u);
 % label.bot(btex ${\pi}\over {6}$ etex,(pi/6,0)*u);
  %label.bot(btex ${\pi}\over {4}$ etex,(pi/4,0)*u);
  %label.bot(btex ${\pi}\over {2}$ etex,(pi/2,0)*u);
  %label.bot(btex $p$ etex,(3.07,0)*u);
  %label.bot(btex ${3\pi}\over {2}$ etex,(3*pi/2,0)*u);
  %label.bot(btex $2p$ etex,(2*pi,0)*u);
  label.bot(btex p12 etex,(pi/(12)-0.1,0)*u);
  label.bot(btex p6 etex,(pi/(6)-0.1,0)*u);
  label.bot(btex p4 etex,(pi/(4)-0.1,0)*u);
  label.bot(btex p2 etex,(pi/2-0.05,0)*u);
  label.bot(btex $p$ etex,(3.07,0)*u);
  label.bot(btex 3p2 etex,(3*pi/2-0.1,0)*u);
  label.bot(btex 2p etex,(2*pi,0)*u);
  
  
  %label.bot   (btex $i$ etex,(0.4,0)*u);
  %label.lft   (btex $j$ etex,(-0.08,0.5)*u);
  %dotlabel.llft(btex $O$ etex, (0,0));
endfig;  
end