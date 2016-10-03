prologues:=2;
verbatimtex
%&latex

 \documentclass{article}
 \usepackage[latin1]{inputenc}
 \usepackage[frenchb]{babel}
 \usepackage{amsmath}
 \begin{document}
etex
%%
%prologues:=2;

input courbescp11;
 vardef titre(expr pos,largeur,hauteur,texte)=
   save $;
   picture $;
   $=image(
     fill ((pos shifted(-largeur/2*x.u,-hauteur/2*y.u))--(pos shifted(largeur/2*x.u,-hauteur/2*y.u))--(pos shifted(largeur/2*x.u,hauteur/2*y.u))--(pos shifted(-largeur/2*x.u,hauteur/2*y.u))--cycle) withcolor jaune;
     draw ((pos shifted(-largeur/2*x.u,-hauteur/2*y.u))--(pos shifted(largeur/2*x.u,-hauteur/2*y.u))--(pos shifted(largeur/2*x.u,hauteur/2*y.u))--(pos shifted(-largeur/2*x.u,hauteur/2*y.u))--cycle);
      
     label(texte,pos);
     );
   $
 enddef;

 string marque_c;
 marque_c="non";
 vardef representation[](expr a,b,nb)(text texte)=
   save $;
   path $;
   if marque_c="cartesienne":
     $=courbe@(a,b,nb,texte)
   elseif marque_c="polaire":
     $=polaire@(a,b,nb,texte)
   elseif marque_c="param":
     $=param@(a,b,nb,texte)
   elseif marque_c="polaireparam":
     $=polaireparam@(a,b,nb,texte)
   fi;
   $
 enddef;
%%%%%%%%%%%%%%%%%%%%%%
%%   DEBUT DES FIGURES
%%%%%%%%%%%%%%%%%%%%%%

 
beginfig(1);
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x);
  vardef F(expr t) = 0.31*(t+1)**2+0.5 enddef;


  draw courbe2(-1,4,100,F(x));% withcolor bleu;
  labelise1(btex $y=x$ etex,0.83);
  labelise2(btex $C_f$ etex,0.1);
  %construction de la toile d'araignée
  u0=3.7;
  %u1=F(u0);
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  %A1:=pointcourbe2(u1);
  %B1:=pointcourbe1(u1);
   drawarrow (u0*cm,0)--A0 dashed evenly;
   %drawarrow A0--B1;
   %drawarrow B1--A1;
for i:=1 step 1 until 5 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));
  label.bot(btex $u_2$ etex,(u[2]*cm,0));
  label.bot(btex $u_3$ etex,(u[3]*cm,0));
  
endfig;
%%____________________________________________________

beginfig(2);
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.25* t*(7.6-t) enddef; %Def la fonction

  draw courbe2(-1,4,100,F(x));% withcolor bleu;
  labelise1(btex $y=x$ etex,0.1);
  labelise2(btex $C_f$ etex,0.5);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.45;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
for i:=1 step 1 until 7 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));
  label.bot(btex $u_2$ etex,(u[2]*cm,0));
  label.bot(btex $u_3$ etex,(u[3]*cm,0));
   label.bot(btex $u_4$ etex,(u[4]*cm,0));
  
 endfig;
 %%____________________________________________________

beginfig(3); %Convergence en spirale
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =3.3-0.8*t enddef; %Def la fonction

  draw courbe2(-1,4,100,F(x));% withcolor bleu;
  labelise1(btex $y=x$ etex,0.8);
  labelise2(btex $C_f$ etex,0.25);
  %construction de la toile d'araignée
  %Initialisation
  u0=-0.55;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
for i:=1 step 1 until 15 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));
  label.bot(btex $u_2$ etex,(u[2]*cm,0));
  label.bot(btex $u_3$ etex,(u[3]*cm,0));
  label.bot(btex $u_4$ etex,(u[4]*cm,0));
  label.bot(btex $u_5$ etex,(u[5]*cm,0));
   label.bot(btex $u_6$ etex,(u[6]*cm,0));
  
 endfig;

  %%____________________________________________________

beginfig(4); %Divergence en spirale
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =3.4-1.2*t enddef; %Def la fonction

  draw courbe2(-1,4,100,F(x));% withcolor bleu;
  labelise1(btex $y=x$ etex,0.8);
  labelise2(btex $C_f$ etex,0.25);
  %construction de la toile d'araignée
  %Initialisation
  u0=1.35;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
for i:=1 step 1 until 10 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));
  % label.bot(btex $u_2$ etex,(u[2]*cm,0));
%   label.bot(btex $u_3$ etex,(u[3]*cm,0));
%   label.bot(btex $u_4$ etex,(u[4]*cm,0));
%   label.bot(btex $u_5$ etex,(u[5]*cm,0));
%    label.bot(btex $u_6$ etex,(u[6]*cm,0));
  label.bot(btex $u_8$ etex,(u[8]*cm,0));
  label.bot(btex $u_9$ etex,(u[9]*cm,0));
  label.bot(btex $u_{10}$ etex,(u[10]*cm,0));
  
endfig;
  %%____________________________________________________

beginfig(5); %Divergence croissante
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.5*(t+2.5)**2-1.5 enddef; %Def la fonction

  draw courbe2(-1,4,100,F(x));% withcolor bleu;
  labelise1(btex $y=x$ etex,0.8);
  labelise2(btex $C_f$ etex,0.5);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.2;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
for i:=1 step 1 until 6 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
%  label.bot(btex $u_1$ etex,(u[1]*cm,0));
%   label.bot(btex $u_2$ etex,(u[2]*cm,0));
   label.bot(btex $u_3$ etex,(u[3]*cm,0));
%   label.bot(btex $u_4$ etex,(u[4]*cm,0));
   label.bot(btex $u_5$ etex,(u[5]*cm,0));
    label.bot(btex $u_6$ etex,(u[6]*cm,0));
%  label.bot(btex $u_8$ etex,(u[8]*cm,0));
%  label.bot(btex $u_9$ etex,(u[9]*cm,0));
%  label.bot(btex $u_{10}$ etex,(u[10]*cm,0));
  
endfig;

beginfig(6); %Fonction logistique 4-cycle 
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.885*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.4);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.26;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
  pickup pencircle scaled 0.3;
for i:=1 step 1 until 95 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
 pickup pencircle scaled 1.5;
for i:=91 step 1 until 95 :
  
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
pickup pencircle scaled 0.3;
draw ((u[1]*cm,0)--A[1]) dashed evenly;
draw ((u[91]*cm,0)--A[91]) dashed evenly;
draw ((u[92]*cm,0)--A[92]) dashed evenly;
draw ((u[93]*cm,-0.3cm)--A[93]) dashed evenly;
draw ((u[94]*cm,0)--A[94]) dashed evenly;
  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));
  label.bot(btex $u_{91}$ etex,(u[91]*cm,0));
  label.bot(btex $u_{92}$ etex,(u[92]*cm,0));
  label.bot(btex $u_{93}$ etex,(u[93]*cm,-0.3cm));
  label.bot(btex $u_{94}$ etex,(u[94]*cm,0));
  label.bot(btex $u_{95}$ etex,(u[95]*cm,-0.6cm));
  
endfig;
beginfig(7); %Fonction logistique 2-cycle 
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.78*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.4);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.26;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
  pickup pencircle scaled 0.3;
for i:=1 step 1 until 95 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
draw ((u[1]*cm,0)--A[1]) dashed evenly;
draw ((u[91]*cm,0)--A[91]) dashed evenly;
draw ((u[92]*cm,0)--A[92]) dashed evenly;
  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));
  label.bot(btex $u_{91}$ etex,(u[91]*cm,0));
  label.bot(btex $u_{92}$ etex,(u[92]*cm,0));
  label.bot(btex $u_{93}$ etex,(u[93]*cm,-0.3cm));
  label.bot(btex $u_{94}$ etex,(u[94]*cm,-0.3cm));
  
endfig;
%%________________________________


beginfig(8); %Fonction logistique 2 cycle attracteur
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.85*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.3);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.25;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
for i:=1 step 1 until 12 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
%  label.bot(btex $u_1$ etex,(u[1]*cm,0));
%   label.bot(btex $u_2$ etex,(u[2]*cm,0));
%   label.bot(btex $u_3$ etex,(u[3]*cm,0));
%   label.bot(btex $u_4$ etex,(u[4]*cm,0));
%   label.bot(btex $u_5$ etex,(u[5]*cm,0));
%    label.bot(btex $u_6$ etex,(u[6]*cm,0));
%  label.bot(btex $u_8$ etex,(u[8]*cm,0));
%  label.bot(btex $u_9$ etex,(u[9]*cm,0));
%  label.bot(btex $u_{10}$ etex,(u[10]*cm,0));
  
endfig;
%______________________
beginfig(9); %Fonction logistique 6-cycle
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.908*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.3);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.27;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
   pickup pencircle scaled 0.3;
for i:=1 step 1 until 120 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
%  label.bot(btex $u_1$ etex,(u[1]*cm,0));
%   label.bot(btex $u_2$ etex,(u[2]*cm,0));
%   label.bot(btex $u_3$ etex,(u[3]*cm,0));
%   label.bot(btex $u_4$ etex,(u[4]*cm,0));
%   label.bot(btex $u_5$ etex,(u[5]*cm,0));
%    label.bot(btex $u_6$ etex,(u[6]*cm,0));
%  label.bot(btex $u_8$ etex,(u[8]*cm,0));
%  label.bot(btex $u_9$ etex,(u[9]*cm,0));


  for i:=90 step 1 until 95 :
    draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
  label.bot(btex $u_{90}$ etex,(u[90]*cm,0));
  label.bot(btex $u_{91}$ etex,(u[91]*cm,0));
  label.bot(btex $u_{92}$ etex,(u[92]*cm,0));
  label.bot(btex $u_{93}$ etex,(u[93]*cm,-0.3cm));
  label.bot(btex $u_{94}$ etex,(u[94]*cm,0));
  label.bot(btex $u_{95}$ etex,(u[95]*cm,0));
  label.bot(btex $u_{96}$ etex,(u[96]*cm,-0.3cm));
  
endfig;
beginfig(10); %Fonction logistique 3 cycle
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.958*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.3);
  %construction de la toile d'araignée
  %Initialisation
  u0=1.1;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
for i:=1 step 1 until 120 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
%  label.bot(btex $u_1$ etex,(u[1]*cm,0));
%   label.bot(btex $u_2$ etex,(u[2]*cm,0));
%   label.bot(btex $u_3$ etex,(u[3]*cm,0));
%   label.bot(btex $u_4$ etex,(u[4]*cm,0));
%   label.bot(btex $u_5$ etex,(u[5]*cm,0));
%    label.bot(btex $u_6$ etex,(u[6]*cm,0));
%  label.bot(btex $u_8$ etex,(u[8]*cm,0));
%  label.bot(btex $u_9$ etex,(u[9]*cm,0));


  for i:=80 step 1 until 85 :
    draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
  label.bot(btex $u_{80}$ etex,(u[80]*cm,0));
  label.bot(btex $u_{81}$ etex,(u[81]*cm,0));
  label.bot(btex $u_{82}$ etex,(u[82]*cm,0));
  label.bot(btex $u_{83}$ etex,(u[83]*cm,-0.3cm));
  label.bot(btex $u_{84}$ etex,(u[84]*cm,-0.3cm));
  label.bot(btex $u_{85}$ etex,(u[85]*cm,-0.3cm));
  
endfig;
%%__________________________

beginfig(11); %Fonction logistique 0 attracteur
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.2*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.6);
  %construction de la toile d'araignée
  %Initialisation
  u0=2;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
  pickup pencircle scaled 0.3;
for i:=1 step 1 until 8 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));
%   label.bot(btex $u_2$ etex,(u[2]*cm,0));
%   label.bot(btex $u_3$ etex,(u[3]*cm,0));
%   label.bot(btex $u_4$ etex,(u[4]*cm,0));
%   label.bot(btex $u_5$ etex,(u[5]*cm,0));
%    label.bot(btex $u_6$ etex,(u[6]*cm,0));
%  label.bot(btex $u_8$ etex,(u[8]*cm,0));
%  label.bot(btex $u_9$ etex,(u[9]*cm,0));
endfig;
%%______________________
beginfig(12); %Fonction logistique cv lente
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.72*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.4);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.26;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
  pickup pencircle scaled 0.3;
for i:=1 step 1 until 15 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
draw ((u[1]*cm,0)--A[1]) dashed evenly;
  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));

endfig;

%__________________
beginfig(13); %Fonction logistique cv 
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.66*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.4);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.26;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
  pickup pencircle scaled 0.3;
for i:=1 step 1 until 15 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
draw ((u[1]*cm,0)--A[1]) dashed evenly;
  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));

endfig;
beginfig(14); %Fonction logistique Chaos
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4,4),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =1*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.2);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.27;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
  pickup pencircle scaled 0.2;
for i:=1 step 1 until 200 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
draw ((u[1]*cm,0)--A[1]) dashed evenly;
  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
  label.bot(btex $u_1$ etex,(u[1]*cm,0));

endfig;
%%_______________
beginfig(15); %Fonction logistique 3 cycle
  numeric u[];
  pair A[], B[];
  depart((-1,-1),(4.2,4.2),(0,0),1,1);
  grille(1);
  axes;
  draw courbe1(-1,4,10,x); %y=x
  vardef F(expr t) =0.96*t*(4-t) enddef; %Def la fonction

  draw courbe2(0,4,100,F(x));% withcolor bleu;
  %labelise1(btex $y=x$ etex,0.86);
  labelise2(btex $C_f$ etex,0.3);
  %construction de la toile d'araignée
  %Initialisation
  u0=0.25;
  A0:=pointcourbe2(u0);
  B0:=pointcourbe1(u0);
  drawarrow (u0*cm,0)--A0 dashed evenly;
  %Boucle
for i:=1 step 1 until 120 :
  u[i]:=F(u[i-1]);
  A[i]:=pointcourbe2(u[i]);
  B[i]:=pointcourbe1(u[i]);
  draw A[i-1]--B[i];
  draw B[i]--A[i];
  %draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;

  dotlabel.bot(btex $u_0$ etex,(u[0]*cm,0));
%  label.bot(btex $u_1$ etex,(u[1]*cm,0));
%   label.bot(btex $u_2$ etex,(u[2]*cm,0));
%   label.bot(btex $u_3$ etex,(u[3]*cm,0));
%   label.bot(btex $u_4$ etex,(u[4]*cm,0));
%   label.bot(btex $u_5$ etex,(u[5]*cm,0));
%    label.bot(btex $u_6$ etex,(u[6]*cm,0));
%  label.bot(btex $u_8$ etex,(u[8]*cm,0));
%  label.bot(btex $u_9$ etex,(u[9]*cm,0));


  for i:=80 step 1 until 85 :
    draw ((u[i]*cm,0)--A[i]) dashed evenly;
endfor;
  label.bot(btex $u_{80}$ etex,(u[80]*cm,0));
  label.bot(btex $u_{81}$ etex,(u[81]*cm,0));
  label.bot(btex $u_{82}$ etex,(u[82]*cm,0));
  label.bot(btex $u_{83}$ etex,(u[83]*cm,-0.3cm));
  label.bot(btex $u_{84}$ etex,(u[84]*cm,-0.3cm));
  label.bot(btex $u_{85}$ etex,(u[85]*cm,-0.3cm));
  
endfig;
%__________________

%%#################_________
end               %_________
%%#################



















































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Exemples de NewCourbe ci-dessous

beginfig(2);%ln
  depart((-0.4,-4.2),(6,2.6),(0,0),1,1);
  grille(0.2);
  axes;
  graduantx.bot;
  graduanty.lft;
  draw courbe1(0.02,6,100,ln(x)) withcolor bleu;
  labelise1(btex $y=\ln x$ etex,0.85);
  draw Projection(pointcourbe1(e));
  label.bot(btex e etex,(2.718,0)*1cm);
endfig;

%%%%%%% %%

beginfig(3);%cos
  depart((-6.5,-1.5),(6.5,1.5),(0,0),1,1);
  grille(0.2);
  axes;
  graduantx.bot;
  graduanty.ulft;
  draw courbe2(-10,10,100,cos(x)) withcolor bleu;
  draw titre(placepoint(-2,1),2,0.5,btex $y=\cos(x)$ etex);
endfig;


beginfig(4); %ln et aire
  depart((0,0),(8,8),(1,4),1,1);
  grille(0.5);
  axes;
  graduantx.bot;
  graduanty.llft;
  draw courbe1(0.02,7,100,ln(x)) withcolor violet;
  labelise1(btex $y=\ln x$ etex,0.9);
  marque_re:="hachure";
  draw airesouscourbe1(1,5.6);
endfig;

% beginfig(4);%ln
%   depart((-0.5,-3.5),(6.5,2),(0,0),2,1);
%   grille(0.5);
%   axes;
%   graduantx.bot;
%   graduanty.ulft;
%   draw courbe2(0.025,10,100,ln(x)) withcolor bleu;
%   draw titre(placepoint(0.75,1),1,0.5,btex $y=\ln x$ etex);
% endfig;
% beginfig(5);%Cardioide
%   depart((0,0),(9,10),(1,5),3,3);
%   grille(1);
%   axes;
%   graduantx.bot;
%   graduanty.ulft;
%   marque_c:="polaire";
%   draw representation2(0,2*pi,100,1+cos(theta)) withcolor orange;
%   draw titre(placepoint(2,4/3),2/3,1/3,btex Cardioïde etex);
% endfig;
beginfig(5);%expo et tangente
  
  depart((-4,-0.4),(2.8,4.8),(0,0),1,1);
  grille(0.2);
  axes;
  graduantx.bot;
  graduanty.lft;
  draw courbe1(-4,3,100,exp(x)) withcolor bleu;
  labelise1(btex $y=\text{e}^x$ etex,0.4);
  draw Projection(pointcourbe1(1));
  label.lft(btex e etex,(0,e)*1cm);
  draw courbe2(-4,3,100,x+1) dashed evenly scaled 2;
labelise2(btex $y=x+1$ etex,0.83);
endfig;

beginfig(6); %fonction tan
depart((-3.2,-3.6),(4.8,3.6),(0,0),1,1);
  grille(0.2);
  axes;
  graduantx.bot;
  graduanty.lft;
  draw courbe1(-1.6,1.5,100,tan(x)) withcolor bleu;
  draw courbe2(-3.2,-1.7,100,tan(x)) withcolor bleu;
  draw courbe3(1.7,4.6,100,tan(x)) withcolor bleu;
  draw (pi/2,-3.6)*1cm--(pi/2,3.6)*1cm dashed evenly scaled 2;
  draw (-pi/2,-3.6)*1cm--(-pi/2,3.6)*1cm dashed evenly scaled 2;
  draw (3*pi/2,-3.6)*1cm--(3*pi/2,3.6)*1cm dashed evenly scaled 2;
labelise3(btex $y=\tan x$ etex,0.75);
label.bot(btex $\pi$ etex, (pi,0)*1cm);

endfig;

%Astroide
  % depart((-5,-5),(5,5),(0,0),4,4);
%   grille(1);
%   axes;
%   graduantx.bot;
%   graduanty.ulft;
%   marque_c:="param";
%   draw representation3(0,2*pi,100,((cos(t))**3,(sin(t))**3)) withcolor violet;
%   draw titre(placepoint(3/4,1),1/2,1/4,btex Astroïde etex);

beginfig(7); %inv
depart((-4.25,-4.25),(4.25,4.25),(0,0),1,1);
  grille(0.25);
  axes;
  graduantx.bot;
  graduanty.lft;
  draw courbe1(-4.2,-0.2,100,1/(x)) withcolor bleu;
  draw courbe2(0.2,4.2,100,1/(x)) withcolor bleu;


  
%   depart((-5,-5),(5,6),(0,0),2,2);
%   grille(1);
%   axes;
%   graduantx.bot;
%   graduanty.ulft;
%   marque_c:="polaireparam";
%   draw representation4(0,2*pi,100,((pi/2)*cos(t),sin(t))) withcolor jaune;
%   draw titre(placepoint(1,2.5),1.5,3/4,btex $\left\{\begin{array}{l}
%     \theta(t)=\dfrac{\pi}{2}\cos t\\
%     \rho(t)=\sin t\\
%     \end{array}
%     \right.$ etex);
 endfig;

beginfig(8);% inv et carré
 depart((-4.25,-4.25),(4.25,4.25),(0,0),1,1);
  grille(0.25);
  axes;
  graduantx.bot;
  graduanty.lft;
  draw courbe1(-4.2,-0.2,100,1/(x)) withcolor bleu;
  draw courbe2(0.2,4.2,100,1/(x)) withcolor bleu;
  draw courbe3(-2.3,2.3,100,x**2) dashed evenly;%withcolor bleu;
  labelise2(btex $y=\frac{1}{x}$ etex,0.8);
  labelise3(btex $y=x^2$ etex,0.85);
  %points à placer sur la parabole
  marqueplus(pointcourbe3(-2));
  marqueplus(pointcourbe3(-1));
  marqueplus(pointcourbe3(-0.5));
   marqueplus(pointcourbe3(2));
  marqueplus(pointcourbe3(1));
  marqueplus(pointcourbe3(0.5));
  marqueplus(pointcourbe3(0));
   %points à placer sur l'hyperbole
   marqueplus(pointcourbe1(-4));
  marqueplus(pointcourbe1(-2));
  marqueplus(pointcourbe1(-1));
  marqueplus(pointcourbe1(-0.5));
  marqueplus(pointcourbe1(-0.25));
%%
  marqueplus(pointcourbe2(4));
  marqueplus(pointcourbe2(2));
  marqueplus(pointcourbe2(1));
  marqueplus(pointcourbe2(0.5));
  marqueplus(pointcourbe2(0.25));
  
 %  depart((0,0),(8,6),(1,3),2,2);
%   grille(1);
%   axes;
%   graduantx.bot;
%   graduanty.ulft;
%   draw polaire1(-pi,pi,100,3*cos(theta)*cos(2*theta)) withcolor bleu;
%   draw titre(placepoint(5/4,1),3/2,1/3,btex $\rho=3\cos\theta\cos(2\theta)$ etex);
endfig;

beginfig(9);
 %lnx /x 
  depart((-0.5,-2.75),(7.25,2.25),(0,0),1,2);
  grille(0.25);
  axes;
  graduantx.bot;
  graduanty.lft;
  draw courbe1(0.02,7.2,100,ln(x)/x) withcolor bleu;
  labelise1(btex $y=\frac{\ln x}{x}$ etex,0.85);
  draw Projection(pointcourbe1(e));
  label.bot(btex e etex,(2.718,0)*1cm);
  label.lft(btex $\frac{1}{\text{e}}$ etex,(0,1/e)*2cm); 
 %  depart((0,0),(14,16),(10,7),3,3);
%   axes;
%   grille(1);
%   graduantx.bot;
%   graduanty.ulft;
%   draw polaire1(0,2*pi,200,(5/3)*cos(2*theta)-cos(theta)) dashed evenly withcolor bleu;
%   pair I,A,O;
%   O=z.origine*cm;
%   A=point(0.5*length Cpo1) of Cpo1;
%   I=1/2[z.origine*cm,A];
%   dotlabel.llft(btex A etex,A);
%   dotlabel.top(btex I etex,I);
%   pair m[],M[];
%   vues=100;
%   for j=0 upto vues:
%     m[j]=point(j*length Cpo1/vues) of Cpo1;
%     M[j]=((distance(A,I)**2)/(distance(I,m[j])**2))*(m[j]-I);
%   endfor;
%   path courbeinv;
%   courbeinv=M0
%   for j=1 upto vues:
%     ..M[j]
%   endfor;
%   draw courbeinv shifted I withcolor rouge;
%   draw titre(placepoint(-5/3,2.5),3,1/3,btex Le scarabée (en bleu) et sa courbe inverse (rouge) etex);
endfig;

beginfig(10);
  %x/lnx
  depart((-0.5,-4.25),(7.25,6.25),(0,0),1,1);
  grille(0.25);
  axes;
  graduantx.bot;
  graduanty.lft;
  draw courbe1(0.02,0.98,100,x/(ln(x))) withcolor bleu;
  draw courbe2(1.02,7.25,100,x/(ln(x))) withcolor bleu;
  labelise2(btex $y=\frac{x}{\ln x}$ etex,0.85);
  draw Projection(pointcourbe2(e));
  label.bot(btex e etex,(e,0)*1cm);
  label.lft(btex e etex,(0,e)*1cm);

   % depart((0,0),(9,10),(1,5),1,1);
%   axes;
%   grille(1);
%   graduantx.bot;
%   graduanty.ulft;
%   draw polaire1(-pi/2+0.01,pi/2-0.01,100,(2*(sin(theta))**2)/(cos(theta))) withcolor orange;
%   draw titre(placepoint(5,4),3,1,btex Cissoïde droite etex);
%   draw titre(placepoint(5,3),2,1,btex $\rho=2\dfrac{\sin^2\theta}{\cos\theta}$ etex);
endfig;

beginfig(11);

  depart((-1,-0.5),(13,13.5),(0,0),2,0.1);
  grille(0.25);
  grilleprincipale(2) ;
  axes;

  graduextousles(1); %ici même effet que  graduantx.bot;
  gradueytousles(10); %Macro perso.
  %%%%
  %graduanty.lft;
  draw courbe1(0,6,100,(6-x)**2*4*x) ;
  
%  depart((3,0),(12,10),(5,5),1,1);
%   axes;
%   grille(1);
%   graduantx.bot;
%   graduanty.ulft;
%   draw polaire1(-pi/2+0.01,pi/2-0.01,100,(2*cos(2*theta))/(cos(theta))) withcolor orange;
%   draw titre(placepoint(3.5,4),6,1,btex Strophoïde droite : $\rho=2\dfrac{\cos2\theta}{\cos\theta}$ etex);

endfig;


beginfig(12);
 depart((-1,-0.5),(12.5,13.5),(0,0),2,0.1);
  grille(0.2);
  grilleprincipale(2) ;
  axes;

  graduextousles(1); %ici même effet que  graduantx.bot;
  gradueytousles(10); %Macro perso.
  %%%%
  %graduanty.lft;
  draw courbe1(0,6,100,(6-x)**2*4*x) ;
%draw tangente1(0);
  draw demitangente1(0,8);
  draw tangentevp1(2,1);
   draw tangentevp1(4,6);
  
  
 %  depart((0,0),(9,10),(3,5),1,0.5);
%   axes;
%   grille(1);
%   graduantx.bot;
%   graduanty.ulft;
%   draw polaire1(-pi/2+0.01,pi/2-0.01,100,(8*cos(theta))-2/(cos(theta))) withcolor orange;
%   draw titre(placepoint(3,6),4,4,btex\begin{minipage}{3cm} Trisectrice de\\ Mac-Laurin\\$\rho=8\cos\theta-\dfrac{2}{\cos\theta}$\end{minipage} etex);
endfig;

beginfig(13);%Fonction affine cours seconde
  depart((-2,-2),(2,2),(0,0),1,1);
axes;
grille(1);
draw courbe1(-2,2,20,0.5*x-1);

  % depart((0,0),(9,10),(4,5),1,2);
%   axes;
%   grille(1);
%   graduantx.bot;
%   graduanty.ulft;
%   draw courbe1(-5,5,100,4*x/(x**2+1)) withcolor orange;
%   draw titre(placepoint(-2,1.5),4,0.5,btex Anguinéa : $y=\dfrac{4x}{x^2+1}$ etex);
endfig;
beginfig(14);%Fonction affine cours seconde
  depart((-2,-2),(2,2),(0,0),1,1);
axes;
grille(1);
draw courbe1(-2,2,20,-x+1);
 %  depart((0,0),(9,10),(1,5),2,1);
%   axes;
%  grille(1);
%   graduantx.bot;
%   graduanty.ulft;
%   draw courbe1(0.001,1.9999,100,sqrt((4*(2-x))/x)) withcolor orange;
%   draw courbe2(0.001,1.9999,100,-sqrt((4*(2-x))/x)) withcolor orange;
%   draw titre(placepoint(2.5,3),3,0.5,btex Cubique d'Agnesi : $xy^2=4(2-x)$ etex);
endfig;
beginfig(15);%Fonction affine cours seconde
  depart((-2,-2),(2,2),(0,0),1,1);
axes;
grille(1);
draw courbe1(-2,2,20,1.5);
  
%   depart((0,0),(9,10),(3,5),1.5,1.5);
%   axes;
%   grille(1);
%  graduantx.bot;
%   graduanty.ulft;
%   draw param1(0,2*pi,100,(2*cos(t)+cos(2*t),2*sin(t)-sin(2*t))) withcolor orange;
%   draw titre(placepoint(2,2),4,1,btex\begin{minipage}{6cm}Hypocycloïde à trois rebroussements\\$\left\{\begin{tabular}{l}    $x(t)=2\cos t+\cos2t$\\    $y(t)=2\sin t-\sin2t$\\    \end{tabular}    \right.$  \end{minipage}  etex);
 endfig;
%%%%%%%%%%
beginfig(16); %Parabole aire rectangle périm 12
   depart((-0.5,-0.5),(7,10),(0,0),1,1);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   %grille(0.5);
   grilleprincipale(1);
  axes;
  %graduantx.bot;
  graduationx("1");
  graduationy("1");
  %graduanty.lft;
  draw courbe1(0,6,100,x*(6-x)) withcolor violet;
  labelise1(btex $y=x(6-x)$ etex,0.5);
 
endfig;
beginfig(17); %Maurice Sotaski
  path sap, sapp, sapsym, sapent;
  numeric ux, uy;
  ux:=1.5; uy:=0.5;
   depart((-0.5,-0.5),(8.3334*ux,21*uy),(0,0),ux,uy);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   
  grilleprincipale(0.5) ;
  

 
  %axes;
  %graduantx.bot;
  %graduationx("1");
  graduationy("1");
  %graduanty.lft;
  draw courbe1(0,3,20,x*x*x-4*x*x+20);% withcolor bleu;
  draw courbe2(0,5,2,3*x+2) dashed evenly; %withcolor bleu;
  dotlabel.urt(btex $A$ etex,(0,20*uy*cm));
  dotlabel.top(btex $B$ etex,(3*ux*cm,11*uy*cm));
  label.ulft(btex $T$ etex,(5*ux*cm,17*uy*cm));
  %label.urt(btex $\mathscr{C}_f$ etex,(1.5*ux*cm,15*uy*cm));
 
  %%pied des sapins
pickup pencircle scaled 8bp;
   linecap:=butt;
   draw ((0,0)shifted (4*ux*cm,0)--(0, 2*uy*cm) shifted (4*ux*cm,0)) withcolor .5white;
   pickup pencircle scaled 6bp;
   draw ((0,0)shifted (5.5*ux*cm,0)--(0, 2*0.75*uy*cm) shifted (5.5*ux*cm,0)) withcolor .5white;
pickup pencircle scaled 1bp;
  %Sapins
  uxx:=0.6*ux;
  sap= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm) ;
  %sapsym=buildcycle(sap, sap reflectedabout((0,1),(0,-1)));
  

  sapsym= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle ;
  fill sapsym shifted (4*ux*cm,0) withcolor .7white  ;
  
  sapsym:= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle  ;
  fill sapsym reflectedabout((0,1),(0,-1)) shifted (4*ux*cm,0) withcolor .7white  ;

  draw sap shifted (4*ux*cm,0) ;
  draw sap reflectedabout((0,1),(0,-1))  shifted (4*ux*cm,0)  ;

  
   sapsym:= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle ;
  fill sapsym scaled 0.75 shifted (5.5*ux*cm,0) withcolor .7white  ;
  
  sapsym:= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle  ;
  fill sapsym scaled 0.75 reflectedabout((0,1),(0,-1)) shifted (5.5*ux*cm,0) withcolor .7white  ;
   draw sap scaled 0.75 shifted (5.5*ux*cm,0) ;
   draw sap scaled 0.75 reflectedabout((0,1),(0,-1))  shifted (5.5*ux*cm,0)  ;
   
linecap:=rounded;
axes;
 graduextousles(1); %ici même effet que  graduantx.bot;
  gradueytousles(5);
 
  %sapent= sapsym shifted (4*ux*cm,0)  ;
  %draw sapent;% withcolor .8white;
  
endfig;
beginfig(18); %Maurice Sotaski Corrigé
  path sap, sapp, sapsym, sapent;
  numeric ux, uy;
  ux:=1.5; uy:=0.5;
   depart((-0.5,-0.5),(8.3334*ux,21*uy),(0,0),ux,uy);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   
  grilleprincipale(0.5) ;
  

 
  %axes;
  %graduantx.bot;
  %graduationx("1");
  graduationy("1");
  %graduanty.lft;
  draw courbe1(0,3,20,x*x*x-4*x*x+20);% withcolor bleu;
  draw courbe2(0,5,2,3*x+2) dashed evenly; %withcolor bleu;
  draw courbe3(3,7,2,-3*x+26) dashed evenly; %withcolor bleu;
   draw courbe4(3,6.88,20,-1.5*x*x+12*x-11.5);
  dotlabel.urt(btex $A$ etex,(0,20*uy*cm));
  dotlabel.top(btex $B$ etex,(3*ux*cm,11*uy*cm));
  dotlabel.top(btex $$ etex,(5*ux*cm,11*uy*cm));
  label.ulft(btex $T$ etex,(5*ux*cm,17*uy*cm));
  %label.urt(btex $\mathscr{C}_f$ etex,(1.5*ux*cm,15*uy*cm));
 
  %%pied des sapins
pickup pencircle scaled 8bp;
   linecap:=butt;
   draw ((0,0)shifted (4*ux*cm,0)--(0, 2*uy*cm) shifted (4*ux*cm,0)) withcolor .5white;
   pickup pencircle scaled 6bp;
   draw ((0,0)shifted (5.5*ux*cm,0)--(0, 2*0.75*uy*cm) shifted (5.5*ux*cm,0)) withcolor .5white;
pickup pencircle scaled 1bp;
  %Sapins
  uxx:=0.6*ux;
  sap= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm) ;
  %sapsym=buildcycle(sap, sap reflectedabout((0,1),(0,-1)));
  

  sapsym= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle ;
  fill sapsym shifted (4*ux*cm,0) withcolor .7white  ;
  
  sapsym:= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle  ;
  fill sapsym reflectedabout((0,1),(0,-1)) shifted (4*ux*cm,0) withcolor .7white  ;

  draw sap shifted (4*ux*cm,0) ;
  draw sap reflectedabout((0,1),(0,-1))  shifted (4*ux*cm,0)  ;

  
   sapsym:= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle ;
  fill sapsym scaled 0.75 shifted (5.5*ux*cm,0) withcolor .7white  ;
  
  sapsym:= (0,2*uy*cm)--(1*uxx*cm,2*uy*cm)--(0.7*uxx*cm,5*uy*cm)--(0.9*uxx*cm,4.8*uy*cm)--(0.4*uxx*cm,8*uy*cm)--(0.6*uxx*cm,7.7*uy*cm)--(0,12*uy*cm)--cycle  ;
  fill sapsym scaled 0.75 reflectedabout((0,1),(0,-1)) shifted (5.5*ux*cm,0) withcolor .7white  ;
   draw sap scaled 0.75 shifted (5.5*ux*cm,0) ;
   draw sap scaled 0.75 reflectedabout((0,1),(0,-1))  shifted (5.5*ux*cm,0)  ;
   
linecap:=rounded;
axes;
 graduextousles(1); %ici même effet que  graduantx.bot;
  gradueytousles(5);
 
  %sapent= sapsym shifted (4*ux*cm,0)  ;
  %draw sapent;% withcolor .8white;
  
endfig;

beginfig(19);
  depart((-1,-0.5),(2.5,3.5),(0,0),1,1);
  grille(0.5);
  axes;
  graduationx("1");
  graduationy("1");
 
  draw courbe1(-1,2,100,(x-0.5)**2+0.75);% withcolor bleu;
  %labelise1(btex $y=\text{e}^x$ etex,0.4);
  %draw Projection(pointcourbe1(1));
  
  %draw courbe2(-4,3,100,x+1) dashed evenly scaled 2;
%labelise2(btex $y=x+1$ etex,0.83);
endfig;
beginfig(20); %Discont.1
  path  dc, ac;
  depart((-1,-0.5),(2.5,3.5),(0,0),1,1);
  grille(0.5);
  axes;
  graduationx("1");
  graduationy("1");
 
  draw courbe1(-1,1,100,(x-0.5)**2+0.75);% withcolor bleu;
  draw courbe2(1,2,100,((x-2)**2)*(-1)+3);% withcolor bleu;
  dotlabel(btex $$ etex , pointcourbe2(1));

 dc=halfcircle rotated 90 scaled 0.1cm shifted (0.05cm,0);

  
   ac= dc rotated 45 shifted  pointcourbe1(1); draw ac;
 
 endfig;
 beginfig(21); %Discont.2
  path  dc, ac;
  depart((-1,-0.5),(2.5,3.5),(0,0),1,1);
  grille(0.5);
  axes;
  graduationx("1");
  graduationy("1");
 
  draw courbe1(-1,1,100,(x-0.5)**2+0.75);% withcolor bleu;
  draw courbe2(1,2,100,((x-2)**2)*(-1)+3);% withcolor bleu;
  dotlabel(btex $$ etex , (1cm,1.5cm));%pointcourbe2(1));

 dc=halfcircle rotated 90 scaled 0.1cm shifted (0.05cm,0);

  
 ac= dc rotated 45 shifted  pointcourbe1(1); draw ac;
 ac:= dc rotated -116 shifted  pointcourbe2(1); draw ac;
 
endfig;
 beginfig(22); %Discont.3
  
  depart((-1,-0.5),(2.5,3.5),(0,0),1,1);
  grille(0.5);
  axes;
  graduationx("1");
  graduationy("1");
 
  draw courbe1(-1,2,100,(x-0.5)**2+0.75);% withcolor bleu;
  
  %dotlabel(btex $$ etex , (1cm,1.5cm));%pointcourbe2(1));
fill fullcircle scaled 0.1cm shifted pointcourbe1(1) withcolor white;
   draw fullcircle scaled 0.1cm shifted pointcourbe1(1);
 
 
 endfig;
  beginfig(23); %Discont.4
  
  depart((-1,-0.5),(2.5,3.5),(0,0),1,1);
  grille(0.5);
  axes;
  graduationx("1");
  graduationy("1");
 
  draw courbe1(-1,2,100,(x-0.5)**2+0.75);% withcolor bleu;
  
  dotlabel(btex $$ etex , (1cm,2cm));%pointcourbe2(1));
fill fullcircle scaled 0.1cm shifted pointcourbe1(1) withcolor white;
   draw fullcircle scaled 0.1cm shifted pointcourbe1(1);
 
 
 endfig;
  beginfig(24); %Grille pour la fonction Pi
  
  depart((-0.5,-0.5),(14.4,4.5),(0,0),0.3,0.3);
  grilleprincipale(0.3);
  axes;
  graduextousles(5); %ici même effet que  graduantx.bot;
  gradueytousles(2);
  %graduationx("1");
  %graduationy("1");
 
 
endfig;
%%%#####################################"

beginfig(25); %Fonction cube CC1 TS 2007
  depart((-6,-8.5),(6,8.5),(0,0),2.5,1);
  %%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
 % millimetrecentreorigine ;%(orange);
  %millimetrepourcourbe;
  millimetrecentreorigine;
  %grille(0.5);
  %grilleprincipale(1);
 
 axes;
   draw courbe1(-2.5,2.5,100,x**3);% withcolor bleu;
  graduantx.bot;
  graduanty.lft;
  
endfig;

beginfig(26);% DL2 TS 2007
  depart((-5.5,-16.5),(5.5,7),(0,0),1,1);
  grille(0.5);
  axes;
  graduantx.bot;
  gradueytousles(5);
  %graduanty.lft;
  draw courbe1(-5.5,-0.1,100,4/(x)) withcolor bleu;
  draw courbe2(0.1,5.5,100,4/(x)) withcolor bleu;
  draw courbe3(-5,5,100,x**2-15) withcolor rouge;%dashed evenly;%withcolor bleu;
  labelise2(btex $y=\frac{4}{x}$ etex,0.5);
  labelise3(btex $y=x^2-15$ etex,0.75);

  draw Projection(pointcourbe2(4));
  draw Projection(pointcourbe3(-0.26795));
  draw Projection(pointcourbe3(-3.73205));
  label.top(btex $\alpha$ etex,(-3.73205,0)*1cm);
  label.top(btex $\beta$ etex,(-0.26795,0)*1cm);
  %points à placer sur la parabole
  marqueplus(pointcourbe3(-2));
  marqueplus(pointcourbe3(-1));
  marqueplus(pointcourbe3(-0.5));
   marqueplus(pointcourbe3(2));
  marqueplus(pointcourbe3(1));
  marqueplus(pointcourbe3(0.5));
  marqueplus(pointcourbe3(0));
   %points à placer sur l'hyperbole
   marqueplus(pointcourbe1(-4));
  marqueplus(pointcourbe1(-2));
  marqueplus(pointcourbe1(-1));
  marqueplus(pointcourbe1(-0.5));
  marqueplus(pointcourbe1(-0.25));
%%
  marqueplus(pointcourbe2(4));
  marqueplus(pointcourbe2(2));
  marqueplus(pointcourbe2(1));
  marqueplus(pointcourbe2(0.5));
  marqueplus(pointcourbe2(0.25));
endfig;
beginfig(27);% DL2 TS 2007
 depart((-4.5,-6.5),(5.5,6.5),(0,0),1,0.2);
  grille(0.5);
  axes;
  graduantx.bot;
  gradueytousles(5);
  %graduanty.lft;
  
  draw courbe1(-4.5,5.25,100,x**3-15x-4) withcolor bleu;%dashed evenly;%withcolor bleu;
  draw tangente1(5**0.5);
  draw tangente1(-(5**0.5));
  labelise1(btex $y=x^3-15x-4$ etex,0.92);

  %draw Projection(pointcourbe1(4));
  %draw Projection(pointcourbe1(-0.27));
  %draw Projection(pointcourbe1(-3.735));
  %points à placer sur la parabole
 
endfig;
beginfig(28); %Fonction cube CC1 TS 2007 CORRIGé
  depart((-5.5,-5.5),(5.5,7.5),(0,0),2.5,1);
  millimetrecentreorigine;
 
 axes;
 draw courbe1(-2.5,2.5,100,x**3);% withcolor bleu;
 draw courbe2(-2.5,2.5,100,3*x+1);
 %entrecourbes(courbe1,courbe2,-2.5,2.5);
 %buildcycle(courbe1,courbe2);
 draw Projection(pointcourbe2(-1.53));
 draw Projection(pointcourbe2(-0.35));
 draw Projection(pointcourbe2(1.88));
 label.top(btex $\alpha$ etex,(-1.53,0)*2.5cm);
 label.top(btex $\beta$ etex,(-0.35,0)*2.5cm);
 label.bot(btex $\gamma$ etex,(1.88,0)*2.5cm);
 labelise1(btex $y=x^3$ etex,0.72);
 labelise2(btex $\Delta : \ y=3x+1$ etex,0.62);
  graduantx.bot;
  graduanty.lft;
  
endfig;
beginfig(29); %Fonction CC2 TS 2007 
  depart((-6,-1),(9,6),(0,0),2.5,5);
  millimetrecentreorigine;
  axes;
  drawarrow (0,0)--(2.5cm,0) withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,5cm) withpen pencircle scaled 1bp;
  graduantx.bot;
  graduanty.lft;
  
endfig;
beginfig(30); %Fonction CC2 TS 2007 
   depart((-6,-1),(9,6),(0,0),2.5,5);
  millimetrecentreorigine;
  axes;
  draw courbe1(-6,8.5,100,1/(1+e**(-x)));% withcolor bleu;
  draw courbe2(-6,8.5,100,0.25*x+0.5);% withcolor bleu;
  draw courbe3(-6,8.5,100,1);% withcolor bleu;
 
  graduantx.bot;
  graduanty.lft;
  drawarrow (0,0)--(2.5cm,0) withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,5cm) withpen pencircle scaled 1bp;
endfig;
%%---------------------
beginfig(31); % exp_a 
   depart((-3,-1),(3,8),(0,0),1,1);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   %grille(0.5);
   grilleprincipale(1);
  axes;
  %graduantx.bot;
  graduationx("1");
  graduationy("1");
  %graduanty.lft;
  draw courbe1(-3,3,50,(0.5**x)) withcolor rouge;
  labelise1(btex $y=0,5^x$ etex,0.2);

  draw courbe2(-3,3,50,(0.8**x)) withcolor bleu;
  labelise2(btex $y=0,8^x$ etex,0.2);
 
endfig;
beginfig(32); % exp_a 
   depart((-3,-1),(3,8),(0,0),1,1);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   %grille(0.5);
   grilleprincipale(1);
  axes;
  %graduantx.bot;
  graduationx("1");
  graduationy("1");
  %graduanty.lft;
  draw courbe1(-3,3,50,(1.3**x)) withcolor rouge;
  labelise1(btex $y=1,3^x$ etex,0.8);

  draw courbe2(-3,3,50,(2**x)) withcolor bleu;
  labelise2(btex $y=2^x$ etex,0.8);
 
endfig;
beginfig(33); % log_a 
   depart((-3,-3),(5,5),(0,0),1,1);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   %grille(0.5);
   grilleprincipale(1);
  axes;
  %graduantx.bot;
  graduationx("1");
  graduationy("1");
  %graduanty.lft;
   draw courbe1(-3,5,50,(0.7**x)) withcolor rouge;
  labelise1(btex $y=0,7^x$ etex,0.15);

  draw courbe2(0.05,3,50,(ln(x)/ln(.7))) withcolor rouge;
  labelise2(btex $y=\log_{0,7}(x)$ etex,0.75);

  draw courbe3(-3,5,50,(0.5**x)) withcolor bleu;
  labelise3(btex $y=0,5^x$ etex,0.15);
   draw courbe4(0.02,5,50,(ln(x)/ln(0.5))) withcolor bleu;
   labelise4(btex $y=\log_{0.5}(x)$ etex,0.7);

   draw courbe4(-3,5,50,x) withcolor orange;
  labelise4(btex $y=x$ etex,0.2);
 
endfig;
beginfig(34); % log_a 
   depart((-2.401,-2.401),(6.401,6.401),(0,0),0.8,0.8);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   %grille(0.5);
   grilleprincipale(0.8);
  axes;
  %graduantx.bot;
  graduationx("1");
  graduationy("1");
  %graduanty.lft;
   draw courbe1(-3,8,50,(1.4**x)) withcolor rouge;
  labelise1(btex $y=1,4^x$ etex,0.8);
  draw courbe2(0.1,8,50,(ln(x)/ln(1.4))) withcolor rouge;
  labelise2(btex $y=\log_{1,4}(x)$ etex,0.8);

  draw courbe3(-3,3,50,(2**x)) withcolor bleu;
  labelise3(btex $y=2^x$ etex,0.8);
   draw courbe4(0.1,8,50,(ln(x)/ln(2))) withcolor bleu;
   labelise4(btex $y=\log_{2}(x)$ etex,0.8);

   draw courbe4(-3,8,50,x) withcolor orange;
  labelise4(btex $y=x$ etex,0.1);
 
endfig;


end






















































beginfig(16);
  depart((0,2),(9,10),(1,5),2,2);
  axes;
  grille(1);
  graduantx.bot;
  graduanty.ulft;
  draw param1(0,2*pi,100,(2*(cos(t))**2,4*((cos(t))**3)*sin(t))) withcolor orange;
  draw titre(placepoint(1.5,2),2,1,btex\begin{minipage}{4cm}
    Quartique piriforme\\$\left\{\begin{tabular}{l}    $x(t)=2\cos^2t$\\    $y(t)=4\cos^3t\sin t$\\    \end{tabular}    \right.$ \end{minipage}   etex);
endfig;
beginfig(17);
  depart((0,0),(9,10),(5,5),1,1);
  axes;
  grille(1);
graduantx.bot;
  graduanty.ulft;
  draw polaire1(0.001,pi/4-0.001,100,sqrt(4/tan(2*theta))) withcolor orange;
  draw polaire1(0.001,pi/4-0.001,100,-sqrt(4/tan(2*theta))) withcolor orange;
  draw polaire1(-pi/2+0.001,-pi/4-0.001,100,sqrt(4/tan(2*theta))) withcolor orange;
  draw polaire1(-pi/2+0.001,-pi/4-0.001,100,-sqrt(4/tan(2*theta))) withcolor orange;
  
  draw titre(placepoint(-3,-3),4,1.5,btex\begin{minipage}{4cm} Quartique régulière\\$\rho^2=\dfrac{4}{\tan2\theta}$\end{minipage} etex);
endfig;
beginfig(18);
  depart((0,0),(9,10),(2,5),0.25,2);
  axes;
  grille(1);
  graduationx(btex $+1$ etex);
  graduanty.ulft;
  draw courbe1(-8,28,200,exp(-x/4)*sin(x)) withcolor orange;
  draw titre(placepoint(12,1),22,0.5,btex Sinusoïde amortie : $y=e^{-\dfrac{x}{4}}\sin x$ etex);
endfig;
beginfig(19);
  depart((0,2),(9,10),(5,5),1,1);
  axes;
  grille(1);
graduantx.bot;
  graduanty.ulft;
  draw polaire1(-23,21,500,3/(ch(theta/5))) withcolor orange;
  draw titre(placepoint(-3,4),3,1.5,btex\begin{minipage}{3cm} Spirale de Poinsot\\$\rho=\dfrac{3}{\mbox{ch}(\theta/5)}$\end{minipage} etex);
endfig;

beginfig(20); %ln et aire
   depart((0,0),(6,10),(0,0),1,1);
%%coins en bas à g et en haut à d, centre du repère,
%%long unités en x puis en y en cm
   
    grille(1);
  axes;
  graduantx.bot;
  graduanty.llft;
  draw courbe1(0,6,100,x*(6-x)) withcolor violet;
  labelise1(btex $y=,x(6-x)$ etex,0.9);
 
endfig;

end