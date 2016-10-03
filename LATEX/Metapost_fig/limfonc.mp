input Kourbes;input geo; 
%prologues:=2;
verbatimtex
%&latex

 \documentclass{article}
 \usepackage{preambule}
 \begin{document}
%\documentclass{polymaths}


etex

color vert_e, turquoise, orange, vert_fonce, rose, vert_mer, bleu_ciel, or, rouge_v,bleu_m,bleu,bleu_f;
vert_e:=(0,0.790002,0.340007);
turquoise:=(0.250999,0.878399,0.815699);
orange:=(0.589999,0.269997,0.080004);
vert_fonce:=(0,1.4*0.392193,0);
rose:=(1.0, 0.752907, 0.796106);
bleu_ciel:=(1.2*0.529405,1.2*0.807794,1);%.2*0.921598);
or:=(1,0.843104,0);
rouge_v:=(0.829997,0.099994,0.119999);
bleu_m:=(0.7*0.529405,0.7*0.807794,0.7);%*0.921598);
bleu_f:=(0.211762,0.3231176,0.3686392);
bleu:=(0.529405,0.807794,1);

beginfig(1)


repere(17cm,5cm,0.5cm,2.5cm,4cm,0.3125cm);
%trace.grille(0.5,0.5pt,0.88white);
%trace.grille(1,0.7pt,0.8white);
marque.unites(1mm);
rtrace.axes(0.5pt);


vardef fx(expr t)=t enddef;
vardef fy(expr t)=t**2-1/t enddef;
rtrace.courbe(0.01,6,1500,1.5pt,vert_fonce);
draw rpoint(0,-5)--rpoint(100,420) dashed evenly;

dotlabel.lrt(btex $A$ etex, rpoint(2,3.5));










decoupe.repere;
etiquette.axes;
etiquette.unites;
endfig;




beginfig(2)


repere(10cm,5cm,1cm,1.5cm,5cm,2.5cm);
%trace.grille(0.5,0.5pt,0.88white);
%trace.grille(1,0.7pt,0.8white);
marque.unites(1mm);
rtrace.axes(0.5pt);


vardef fx(expr t)=t enddef;
vardef fy(expr t)=cos(t) enddef;
rtrace.courbe(0,2,1500,1.5pt,bleu_m);

dotlabel.top(btex etex,rpoint(1,0.540));
draw rpoint(1,0)--rpoint(1,0.540) dashed evenly;
draw rpoint(0,0.540)--rpoint(1,0.540) dashed evenly;
label.lft(btex cos 1 etex, rpoint(0,0.540));


decoupe.repere;
etiquette.axes;
etiquette.unites;
endfig;









beginfig(3)


repere(10cm,3.5cm,1cm,0.5cm,5cm,2.5cm);
%trace.grille(0.5,0.5pt,0.88white);
%trace.grille(1,0.7pt,0.8white);
marque.unites(1mm);
rtrace.axes(0.5pt);


vardef fx(expr t)=t enddef;
vardef fy(expr t)=cos(t) enddef;
rtrace.courbe(0,1,1500,1.5pt,vert_fonce);
vardef fy(expr t)=cos(t-1) enddef;
rtrace.courbe(1,2,1500,1.5pt,vert_fonce);


dotlabel.top(btex etex,rpoint(1,0.540));
draw rpoint(1,0)--rpoint(1,0.540) dashed evenly;
draw rpoint(0,0.540)--rpoint(1,0.540) dashed evenly;
label.lft(btex cos 1 etex, rpoint(0,0.540));
draw halfcircle scaled 0.2cm rotated 270 shifted(rpoint(0.97,1)) ;

decoupe.repere;
etiquette.axes;
etiquette.unites;
endfig;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualisation de la def des lim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=1.5cm;  uy:=1.5cm;
  xmin := -0.2 ; xmax := 5;
  ymin := -0.2 ; ymax := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;


vardef f(expr x) =1/2*x+1/2 enddef;


vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,g(i)*uy) ..
    endfor (b*ux,g(b)*uy)
  enddef;



beginfig(4);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Courbe et point central avec pointillés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes;
label.llft(btex $0$ etex,(0,0));

draw tracee(f,-.2,4.5,.01)  ;
label.rt(btex $ y=f(x)$ etex,(4.5*ux,f(4.5)*uy));


pair A;
pair h,b,g,d;

h:=(0,.1*uy);
b:=(0,-.1*uy);
g:=(-.1*ux,0);
d:=(.1*ux,0);

A:=(3*ux,f(3)*uy) ;

draw A withpen pencircle scaled 2.5bp;

pair B,C;

B:=A xscaled 0;
C:=A yscaled 0;

draw A--B dashed evenly;
draw A--C dashed evenly;

draw (B shifted (-.05*ux,0))--(B shifted (.05*ux,0)) withpen pencircle scaled 2 bp;
draw (C shifted (0,-.05*uy))--(C shifted (0,.05*uy)) withpen pencircle scaled 2 bp;

label.bot(btex $a$ etex,C shifted 1.2 b);
label.lft(btex $\ell$ etex,B shifted g);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Les intervalles et l'axe des y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pair M,N; % points de l'axe des y
pair S,T; % points de l'axe des x
pair p,q; % shift d'epsilon
numeric n; % epsilon

n:=.5;

p:=(0,n*uy);
q:=(0,-n*uy);

N:= B shifted p;
M:= B shifted q;

draw N--(N shifted d)--(N shifted (d+b)) withpen pencircle scaled 2 bp withcolor bleu_m;
draw N--(N shifted g)--(N shifted (g+b)) withpen pencircle scaled 2 bp withcolor bleu_m ;
draw M--(M shifted d)--(M shifted (d+h)) withpen pencircle scaled 2 bp  withcolor bleu_m;
draw M--(M shifted g)--(M shifted (g+h)) withpen pencircle scaled 2 bp withcolor bleu_m ;


label.lft(btex $\ell\!-\!\varepsilon$ etex, M shifted g);
label.lft(btex $\ell\!+\!\varepsilon$ etex, N shifted g);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Les crochets sur l'axe des x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

S:=((3-(2*n))*ux,0);
T:=((3+(2*n))*ux,0); 

draw S--(S shifted h)--(S shifted (h+d)) withpen pencircle scaled 2 bp withcolor 0.6white;
draw S--(S shifted b)--(S shifted (b+d)) withpen pencircle scaled 2 bp withcolor 0.6white ;
draw T--(T shifted h)--(T shifted (h+g)) withpen pencircle scaled 2 bp  withcolor 0.6white;
draw T--(T shifted b)--(T shifted (b+g)) withpen pencircle scaled 2 bp withcolor 0.6white ;

label.bot(btex $a\!+\!\alpha$ etex,T shifted b);
label.bot(btex $a\!-\!\alpha$ etex,S shifted b);


%%%%%%%%%%%%%%%%%%%%%%%%
% Le gras
%%%%%%%%%%%%%%%%%%%%%%%%
pair Q,R; % les points de la courbe
path fleched, flecheb;

fleched=(h+g)--(0,0)--(b+g);%flèche vers la droite
flecheb=(h+g)--(0,0)--(h+d);%flèche vers le bas

Q:=((3-(2*n))*ux,f(3-(2*n))*uy);
R:=((3+(2*n))*ux,f(3+(2*n))*uy);

draw S--T withpen pencircle scaled 2bp withcolor 0.6white;
draw M--N withpen pencircle scaled 2bp withcolor bleu_m;

draw (S shifted 1.5 h)--Q dashed evenly withpen pencircle scaled 1.2bp;
draw (T shifted 1.5 h)--R dashed evenly withpen pencircle scaled 1.2bp;
draw (N shifted 1.5 d)--R dashed evenly withpen pencircle scaled 1.2bp;
draw (M shifted 1.5 d)--Q dashed evenly withpen pencircle scaled 1.2bp;

draw fleched shifted (N+(1*ux,0)) withpen pencircle scaled 1.2bp;
draw fleched shifted (M+(1*ux,0)) withpen pencircle scaled 1.2bp;
draw flecheb shifted (S+(0,0.7*uy)) withpen pencircle scaled 1.2bp;
draw flecheb shifted (T+(0,0.7*uy)) withpen pencircle scaled 1.2bp;

endfig;











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure limite infinie en finie 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=4cm;  uy:=1.5cm;
  xmin := 0 ; xmax := 1.1;
  ymin := -.1 ; ymax := 3.3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0)  ; % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))shifted (.08*ux,0); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;
  
beginfig(5);

axes;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La courbe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef f(expr x) =1/(sqrt x) enddef;

vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  
  draw tracee(g,.1,1,.01) withcolor vert_fonce ;

label.urt(btex $ y=1/x$ etex,(.5*ux,f(.5)*uy)shifted (.05*ux,.35*uy));

%%%%%%%%%%%%%%%%%%%%%%%%%
% Le point M
%%%%%%%%%%%%%%%%%%%%%%%%%

draw(ux,uy) withpen pencircle scaled 3bp;
label.urt(btex Depart etex, (ux,uy));

%%%%%%%%%%%%%%%%%%%%%%%%%
% Tirets
%%%%%%%%%%%%%%%%%%%%%%%%%

draw ((-.05*ux,uy)--(.05*ux,uy))shifted (.08*ux,0);
label.lft(btex $1$ etex,(-.05*ux,uy));

draw (ux,-.1*uy)--(ux,.1*uy);
label.bot(btex $1$ etex,(ux,-.1*uy));

%%%%%%%%%%%%%%%%%%%%%%%%
% Flèches
%%%%%%%%%%%%%%%%%%%%%%%%

path p,q,r;

p:=(-.04*ux,-.1*uy)--(0,0)--(.04*ux,-.1*uy);
q:=p rotated 15;
r:=p rotated 60;
draw q shifted (.15*ux,f(.15)*uy) withcolor vert_fonce;
draw r shifted (.5*ux,f(.5)*uy) withcolor vert_fonce;

endfig;














%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Limite finie en l'infini : 1-1/x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=.5cm;  uy:=3cm;
  xmin := -.5 ; xmax := 12;
  ymin := -.1 ; ymax := 1.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

vardef f(expr x) =x/(x+1) enddef;

vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  

  
beginfig(6);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La courbe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






label.llft(btex $0$ etex,(-.05*ux,-.1*uy));
label.rt(btex $y=\displaystyle \mathbf{1-\frac{1}{x}}$ etex,(1.8*ux,.5*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% L'asymptote et les horizontales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path z;
numeric e;
e:=.15;

z:= (0,(1+e)*uy)--(11.5*ux,(1+e)*uy)--(11.5*ux,(1-e)*uy)--(0,(1-e)*uy)--cycle;
fill z withcolor bleu_ciel;


draw(0,(1+e)*uy)--(11.5*ux,(1+e)*uy) withcolor bleu_m;
label.rt(btex $y=1+\varepsilon$ etex,(11.5*ux,(1+e)*uy));
label.lft(btex $1+\varepsilon$ etex,(-.1*ux,(1+e)*uy));

draw(0,(1-e)*uy)--(11.5*ux,(1-e)*uy)withcolor bleu_m;
label.rt(btex $y=1-\varepsilon$ etex,(11.5*ux,(1-e)*uy));
label.lft(btex $1-\varepsilon$ etex,(-.1*ux,(1-e)*uy));

draw (-.1*ux,uy)--(.1*ux,uy)withcolor bleu_m;
draw (.1*ux,uy)--(11.5*ux,uy) dashed evenly withcolor bleu_m;
label.lft(btex $1$ etex,(-.1*ux,uy));

label.bot(btex $ 1/\varepsilon$ etex,((1/e-1)*ux,0)) ;
draw ((1/e-1)*ux,0)--((1/e-1)*ux,(1-e)*uy) dashed evenly;


draw tracee(f,0,11.5,.008) withpen pencircle scaled 1.5bp withcolor red;


draw ((1/e-1)*ux,(1-e)*uy) withpen pencircle scaled 3bp;

axes;
endfig;



















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lim infinie en infini : racine carrée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numeric xmin, xmax, ymin, ymax;

ux:=1cm; uy:=1cm; xmin := -0.5; xmax := 8;
ymin := xmin; ymax := xmax-1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(7)

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Axe
%%%%%%%%%%%%%%%%%%%%%%%%%%

label.llft(btex $0$ etex,(0,0));

%%%%%%%%%%%%%%%%%%%%%%%
%Fonction, graphe
%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =2.3*sqrt(x) enddef;

vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;


%label.rt(btex $y=2\sqrt{x}$ etex,(xmax*ux,(f(xmax))*uy));

%%%%%%%%%%%%%%%%%%%%%%%%
%Points sur le graphe
%%%%%%%%%%%%%%%%%%%%%%%
pair A[],M[],O[];
path z;
u:=.7;%facteur d'échelle
%a:=2;b:=5;c:=9;%numeros des points particuliers
aa:=2;bb:=5;cc:=9;%numeros des points particuliers

for i=1 upto 12: A[i]:=(i*u*ux,0);% A comme abscisse
                 M[i]:=(i*u*ux,f(i*u)*uy); %M comme courbe !!
                 O[i]:=(0,f(i*u)*uy); %O comme ordonnée
endfor ;

z:=O[bb]--O[bb]shifted (xmax*ux,0)--O[bb]shifted (xmax*ux,0)shifted(0,(ymax-f(5*u))*uy)--O[bb]shifted(0,(ymax-f(5*u))*uy)--cycle;
fill z withcolor bleu_ciel;
axes;
dotlabel.lrt(btex Buzz etex, M[cc]);

for i=1 upto 10:
    draw M[i] withpen pencircle scaled 6bp ;
endfor ;

for i=aa,bb,cc:
    draw A[i]--M[i]--O[i] dashed evenly;
endfor;

label.bot(btex premier essai etex,A[aa]);
label.bot(btex 2ème essai etex,A[bb]);
label.bot(btex 3ème essai etex,A[cc]);

label.lft(btex trop court etex,O[aa] shifted (0,.1*uy));
%label.lft(btex c'est juste etex,O[bb]  shifted (0,.1*uy));
label.lft(btex vers l'infini et au-delà etex,O[cc]  shifted (0,.2*uy));

%%%%%%%%%%%%%%%%%%%
%Tracé des droites
%%%%%%%%%%%%%%%%%%
pair C,D;

C=O[bb]; %Point seuil
D=1/3(O[cc]+2O[cc-1]); %Point seuil

pickup pencircle scaled 2bp;

draw C--C  shifted (xmax*ux,0) withcolor bleu_m;
%draw D--D shifted (xmax*ux,0);

label.lft(btex Seuil etex,C shifted (0,-.1*uy));
%label.lft(btex $A_2$ etex,D shifted (0,-.1*uy));


draw tracee(g,0,xmax,.1)withcolor red;

endfig;















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% comparaison de limites
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numeric xmin, xmax, ymin, ymax;

ux:=1cm; uy:=0.5cm; xmin := -0.5; xmax := 8;
ymin := xmin; ymax := xmax-1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(8)

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Axe
%%%%%%%%%%%%%%%%%%%%%%%%%%

label.llft(btex $0$ etex,(0,0));

%%%%%%%%%%%%%%%%%%%%%%%
%Fonction, graphe
%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =2.3*sqrt(x) enddef;
vardef h(expr x)=4*sqrt(x)-1.7 enddef;



vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;



vardef traceh (suffix gg)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,h(i)*uy) ..
    endfor (b*ux,h(b)*uy)
  enddef;



%label.rt(btex $y=2\sqrt{x}$ etex,(xmax*ux,(f(xmax))*uy));

%%%%%%%%%%%%%%%%%%%%%%%%
%Points sur le graphe
%%%%%%%%%%%%%%%%%%%%%%%
pair A[],M[],O[],OO[],MM[];
path z;
u:=.7;%facteur d'échelle
%a:=2;b:=5;c:=9;%numeros des points particuliers
aa:=1.3;bb:=5;cc:=9;%numeros des points particuliers

for i=1 upto 12: A[i]:=(i*u*ux,0);% A comme abscisse
                 M[i]:=(i*u*ux,f(i*u)*uy); %M comme courbe !!
                 O[i]:=(0,f(i*u)*uy); %O comme ordonnée
                 OO[i]:=(0,h(i*u)*uy);
                 MM[i]:=(i*u*ux,h(i*u)*uy);
endfor ;

z:=O[bb]--O[bb]shifted (xmax*ux,0)--O[bb]shifted (xmax*ux,0)shifted(0,(ymax-f(5*u))*uy)--O[bb]shifted(0,(ymax-f(5*u))*uy)--cycle;
fill z withcolor bleu_ciel;
axes;
%dotlabel.lrt(btex Buzz etex, M[cc]);

draw tracee(g,0,xmax,.1)withcolor bleu_f withpen pencircle scaled 1.5bp;
draw traceh(gg,0,4.73,.1)withcolor 0.6white withpen pencircle scaled 1.5bp;


    draw M[bb] withpen pencircle scaled 6bp ;


draw (aa*u*ux,f(aa*u)*uy) withpen pencircle scaled 6bp ;

draw MM[bb] withpen pencircle scaled 6bp;


    draw A[bb]--M[bb]--O[bb] dashed evenly;


 draw (aa*u*ux,0)-- (aa*u*ux,f(aa*u)*uy)--(0,f(aa*u)*uy) dashed evenly;


draw M[bb]--MM[bb]--OO[bb] dashed evenly;

label.bot(btex $m$ etex,(aa*u*ux,0));
label.bot(btex $M$ etex,A[bb]);
%label.bot(btex 3ème essai etex,A[cc]);

label.lft(btex intersection éventuelle etex, (0,f(aa*u)*uy) shifted (0,.1*uy));
%label.lft(btex c'est juste etex,O[bb]  shifted (0,.1*uy));
label.lft(btex déjà au-dessus du seuil etex,OO[bb]  shifted (0,.2*uy));
label.lrt(btex $y=f(x)$ etex,M[cc]) withcolor bleu_f;
label.lrt(btex $y=g(x)$ etex,(4.73*ux,h(4.73)*uy))withcolor 0.6white;
%%%%%%%%%%%%%%%%%%%
%Tracé des droites
%%%%%%%%%%%%%%%%%%
pair C,D;

C=O[bb]; %Point seuil
D=1/3(O[cc]+2O[cc-1]); %Point seuil

pickup pencircle scaled 2bp;

draw C--C  shifted (xmax*ux,0) withcolor bleu_m;
%draw D--D shifted (xmax*ux,0);

label.lft(btex Seuil etex,C shifted (0,-.1*uy));
%label.lft(btex $A_2$ etex,D shifted (0,-.1*uy));



endfig;

















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gendarmes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=.5cm;  uy:=2.5cm;
  xmin := -.5 ; xmax := 12;
  ymin := -.1 ; ymax := 1.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

vardef f(expr x) =1-1/(x+1) enddef;

vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  



vardef fp(expr x) =1+(sin(x))/(x*sqrt(x)) enddef;

vardef tracep (suffix gp)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,fp(i)*uy) ..
    endfor (b*ux,fp(b)*uy)
  enddef;
  

vardef fs(expr x) =1+1/(x-1) enddef;

vardef traces (suffix gs)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,fs(i)*uy) ..
    endfor (b*ux,fs(b)*uy)
  enddef;
  





  
beginfig(9)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La courbe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






label.llft(btex $0$ etex,(-.05*ux,-.1*uy));
%label.rt(btex $y=\displaystyle \mathbf{1-\frac{1}{x}}$ etex,(1.8*ux,.5*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% L'asymptote et les horizontales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path z;
numeric e;
e:=.15;

z:= (0,(1+e)*uy)--(11.5*ux,(1+e)*uy)--(11.5*ux,(1-e)*uy)--(0,(1-e)*uy)--cycle;
fill z withcolor bleu_ciel;


draw(0,(1+e)*uy)--(11.5*ux,(1+e)*uy) withcolor bleu_m;
label.rt(btex $y=h(x)$ etex,(11.5*ux,(1+e)*uy))withcolor bleu_f;
label.lft(btex $\ell+\varepsilon$ etex,(-.1*ux,(1+e)*uy));

draw(0,(1-e)*uy)--(11.5*ux,(1-e)*uy)withcolor bleu_m;
label.rt(btex $y=g(x)$ etex,(11.5*ux,(1-e)*uy))withcolor 0.6white;
label.lft(btex $\ell-\varepsilon$ etex,(-.1*ux,(1-e)*uy));

label.rt(btex $y=f(x)$ etex,(11.5*ux,1*uy))withcolor bleu;


draw (-.1*ux,uy)--(.1*ux,uy)withcolor bleu_m;
draw (.1*ux,uy)--(11.5*ux,uy) dashed evenly withcolor bleu_m;
label.lft(btex $\ell$ etex,(-.1*ux,uy));

label.bot(btex $ A_g$ etex,((1/e-1)*ux,0)) ;
draw ((1/e-1)*ux,0)--((1/e-1)*ux,(1-e)*uy) dashed evenly;
draw ((1/e+1)*ux,0)--((1/e+1)*ux,(1+e)*uy) dashed evenly;
label.bot(btex $ A_h$ etex,((1/e+1)*ux,0)) ;
dotlabel.bot(btex   etex ,((1/e-1)*ux,(1-e)*uy));
dotlabel.top(btex   etex ,((1/e+1)*ux,(1+e)*uy));


draw tracee(f,0,11.5,.008) withpen pencircle scaled 1.5bp withcolor 0.6white;
draw tracep(fp,1.3,11.5,.008) withpen pencircle scaled 1.5bp withcolor bleu;
draw traces(fs,2.5,11.5,.008) withpen pencircle scaled 1.5bp withcolor bleu_f;





draw ((1/e-1)*ux,(1-e)*uy) withpen pencircle scaled 3bp;

axes;
endfig;












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ASYMPTOTE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(11)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=0.4cm;
  uy:=2cm;
  xmin := -1; xmax := 20;
  ymin := -.7; ymax := 1.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax) ; % axe des y
   %label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   %label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



vardef f(expr x) =1/sqrt(x)+0.125*x-1 enddef;

vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  


vardef fd(expr x) =0.125*x-1 enddef;

vardef traced (suffix gd)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,fd(i)*uy) ..
    endfor (b*ux,fd(b)*uy)
  enddef;



axes; label.llft(btex $0$ etex,(0,-.01*uy));

pair h,b,d,g; % shift des tirets

b:=(0,-.05*uy); h:=(0,.05*uy);
d:=(0.1*ux,0); g:=(-0.1*ux,0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Le deuxième point et l'écart
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path p,T;  pair D,E,F,ee, EO,FO; 
%draw D withpen pencircle scaled 3bp;

p:=tracee(f,0.2,20,0.01);

draw p withpen pencircle scaled 2bp withcolor bleu_f;
D:=(14*ux,f(14)*uy);


T:= traced(fd,3,20,0.01); draw T dashed evenly  withpen pencircle scaled 1.5bp  withcolor 0.6white;

E:=D yscaled 0;

EO:=D xscaled 0;


path r,rr;

r:=D--E;

F:=(T intersectionpoint r);

FO:= F xscaled 0;




rr:=D--F;

ee:=(14*ux,f(14)*uy);
label.lrt(btex $\mathbf{e(x)}$ etex, ee)withcolor bleu_m;

drawarrow D--F withpen pencircle scaled 1.5bp withcolor bleu_m; drawarrow F--D withpen pencircle scaled 1.5bp withcolor bleu_m;
draw F--E dashed withdots withcolor bleu_m  withpen pencircle scaled 1.5bp ;
draw F--FO dashed withdots withcolor bleu_m withpen pencircle scaled 1.5bp ;
draw D--EO dashed withdots withcolor bleu_m withpen pencircle scaled 1.5bp ;
label.lft(btex $f(x)$ etex,EO shifted g)withcolor bleu_m; draw (EO shifted g)--(EO shifted d)withcolor bleu_m;
label.lft(btex $ax+b$ etex,FO shifted g)withcolor bleu_m; draw (FO shifted g)--(FO shifted d)withcolor bleu_m;



label.bot(btex $x$ etex,E shifted b)withcolor bleu_m; draw (E shifted h)--(E shifted b)withcolor bleu_m;

label.ulft(btex $y=f(x)$ etex, (18*ux,f(18)*uy))withcolor bleu_f;
label.lrt(btex $y=ax+b$ etex, (18*ux,fd(18)*uy))withcolor 0.6white;




endfig;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
%%%%%%%   Cercle Trigo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(12);
numeric u;
u=2.5cm ;
drawarrow (-1.2*u,0)--(1.2*u,0);
drawarrow (0,-1.2*u)--(0,1.2*u);
draw fullcircle scaled 5cm;
draw (0,0)--(u,(sind(45)/cosd(45))*u)withcolor 0.4white withpen pencircle scaled 1.5bp ;
%draw (0,sind(45)*u)--(cosd(45)*u,sind(45)*u) dashed evenly;
draw (cosd(45)*u,0)--(cosd(45)*u,sind(45)*u) dashed evenly withcolor bleu_f withpen pencircle scaled 1.5bp ;
draw (u,-1.3*u)--(u,1.3*u) withcolor bleu_m withpen pencircle scaled 1.5bp ;draw((cosd45)*u,sind(45)*u)--(u,0);
drawarrow (0.22*u,0)..(0.22*cosd(45)*u,0.22*sind(45)*u);
dotlabel.llft(btex $0$ etex, (0,0));
dotlabel.lrt(btex $I$ etex, (u,0));
%dotlabel.ulft(btex $J$ etex, (0,u));
%dotlabel.lft(btex $\sin x$ etex, (0,sind(45)*u));
dotlabel.bot(btex $C$ etex, (cosd(45)*u,0));
dotlabel.rt(btex $T$ etex , (u,(sind(45)/cosd(45))*u));

dotlabel.top(btex $ $ etex,(cosd(45)*u,sind(45)*u));label.top(btex $M$ etex,(cosd(45)*u,sind(45)*1.1*u));
endfig;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DIAGRAMME
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





beginfig(13);

  % picture(16.600000,-14.087500)(34.700000,2.850000)
  x = 1.000000cm; y = -1.000000cm;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
  path p;
  p = (22.300000x,4.675000y)..(19.475000x,12.150000y)..(16.650000x,4.675000y)..(19.475000x,-2.800000y)..cycle;
  fill p withcolor bleu_ciel;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (22.300000x,4.675000y)..(19.475000x,12.150000y)..(16.650000x,4.675000y)..(19.475000x,-2.800000y)..cycle
    withpen pencircle scaled 1.2bp withcolor bleu_f;
  path p;
  p = (34.650000x,4.850000y)..(31.975000x,12.400000y)..(29.300000x,4.850000y)..(31.975000x,-2.700000y)..cycle;
  fill p withcolor bleu_ciel;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (34.650000x,4.850000y)..(31.975000x,12.400000y)..(29.300000x,4.850000y)..(31.975000x,-2.700000y)..cycle
    withpen pencircle scaled 1.2bp withcolor bleu_f;
% set_linewidth 0.100000
%metapost_arc
% center->x = 25.531695% center->y = -15.961931% width = 35.080988% height = 35.080988% angle1 = 251.789043% angle2 = 289.008028% set_line_color 0.000000, 0.000000, 0.000000
  draw (20.050000x,0.700000y)..(25.653701x,1.578139y)..(31.244645x,0.622132y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (31.595419x,0.489533y)--(31.216119x,0.900181y)--(31.244645x,0.622132y)--(31.039321x,0.432481y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (31.595419x,0.489533y)--(31.216119x,0.900181y)--(31.244645x,0.622132y)--(31.039321x,0.432481y)--cycle
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
%metapost_arc
% center->x = 37.262705% center->y = -15.504852% width = 52.331576% height = 52.331576% angle1 = 227.543481% angle2 = 258.221659% set_line_color 0.000000, 0.000000, 0.000000
  draw (19.600000x,3.800000y)..(25.335928x,7.784640y)..(31.921587x,10.110006y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (32.290124x,10.179331y)--(31.752525x,10.332588y)--(31.921587x,10.110006y)--(31.844959x,9.841206y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (32.290124x,10.179331y)--(31.752525x,10.332588y)--(31.921587x,10.110006y)--(31.844959x,9.841206y)--cycle
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
%metapost_arc
% center->x = 15.959226% center->y = -15.193976% width = 48.438383% height = 48.438383% angle1 = 278.645818% angle2 = 310.494626% set_line_color 0.000000, 0.000000, 0.000000
  draw (19.600000x,8.750000y)..(26.029764x,6.832224y)..(31.686605x,3.223917y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (31.966540x,2.974393y)--(31.759643x,3.493714y)--(31.686605x,3.223917y)--(31.426945x,3.120468y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (31.966540x,2.974393y)--(31.759643x,3.493714y)--(31.686605x,3.223917y)--(31.426945x,3.120468y)--cycle
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \texttt{x} etex scaled 2.67988,(19.250000x,0.800000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \texttt{x} etex scaled 2.67988,(19.000000x,4.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \texttt{x} etex scaled 2.67988,(19.050000x,9.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \texttt{x} etex scaled 2.67988,(32.100000x,0.550000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \texttt{x} etex scaled 2.67988,(32.350000x,3.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \texttt{x} etex scaled 2.67988,(32.500000x,7.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \texttt{x} etex scaled 2.67988,(32.550000x,10.150000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  D\'EPART etex scaled 3,(17.500000x,13.700000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  ARRIV\'EE etex scaled 3,(30.950000x,13.700000y));
endfig;












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Visualisation PHYSIQUE de la def des lim
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=1.25cm;  uy:=1.15cm;
  xmin := -0.2 ; xmax := 5;
  ymin := -0.2 ; ymax := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $T$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;


vardef f(expr x) =1/2*x+1/2 enddef;


vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,g(i)*uy) ..
    endfor (b*ux,g(b)*uy)
  enddef;








beginfig(14);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Courbe et point central avec pointillés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axes;
label.llft(btex $0$ etex,(0,0));

draw tracee(f,-.2,4.5,.01)  ;
label.rt(btex $ y=p(\mathit{T})$ etex,(4.5*ux,f(4.5)*uy));


pair A;
pair h,b,g,d;

h:=(0,.1*uy);
b:=(0,-.1*uy);
g:=(-.1*ux,0);
d:=(.1*ux,0);

A:=(3*ux,f(3)*uy) ;

draw A withpen pencircle scaled 2.5bp;

pair B,C;

B:=A xscaled 0;
C:=A yscaled 0;

draw A--B dashed evenly;
draw A--C dashed evenly;

draw (B shifted (-.05*ux,0))--(B shifted (.05*ux,0)) withpen pencircle scaled 2 bp;
draw (C shifted (0,-.05*uy))--(C shifted (0,.05*uy)) withpen pencircle scaled 2 bp;

label.bot(btex $\textit{T}_0$ etex,C shifted 1.2 b);
label.lft(btex $p_0$ etex,B shifted g);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Les intervalles et l'axe des y
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


pair M,N; % points de l'axe des y
pair S,T; % points de l'axe des x
pair p,q; % shift d'epsilon
numeric n; % epsilon

n:=.5;

p:=(0,n*uy);
q:=(0,-n*uy);

N:= B shifted p;
M:= B shifted q;

draw N--(N shifted d)--(N shifted (d+b)) withpen pencircle scaled 2 bp withcolor bleu_m;
draw N--(N shifted g)--(N shifted (g+b)) withpen pencircle scaled 2 bp withcolor bleu_m ;
draw M--(M shifted d)--(M shifted (d+h)) withpen pencircle scaled 2 bp  withcolor bleu_m;
draw M--(M shifted g)--(M shifted (g+h)) withpen pencircle scaled 2 bp withcolor bleu_m ;


label.lft(btex $p_0\!-\!\varepsilon$ etex, M shifted g);
label.lft(btex $p_0\!+\!\varepsilon$ etex, N shifted g);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Les crochets sur l'axe des x
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

S:=((3-(2*n))*ux,0);
T:=((3+(2*n))*ux,0); 

draw S--(S shifted h)--(S shifted (h+d)) withpen pencircle scaled 2 bp withcolor 0.6white;
draw S--(S shifted b)--(S shifted (b+d)) withpen pencircle scaled 2 bp withcolor 0.6white ;
draw T--(T shifted h)--(T shifted (h+g)) withpen pencircle scaled 2 bp  withcolor 0.6white;
draw T--(T shifted b)--(T shifted (b+g)) withpen pencircle scaled 2 bp withcolor 0.6white ;

label.bot(btex $\textit{T}_0\!+\!\varepsilon V/R$ etex,T shifted b);
label.bot(btex $\textit{T}_0\!-\!\varepsilon V/R$ etex,S shifted b);


%%%%%%%%%%%%%%%%%%%%%%%%
% Le gras
%%%%%%%%%%%%%%%%%%%%%%%%
pair Q,R; % les points de la courbe
path fleched, flecheb;

fleched=(h+g)--(0,0)--(b+g);%flèche vers la droite
flecheb=(h+g)--(0,0)--(h+d);%flèche vers le bas

Q:=((3-(2*n))*ux,f(3-(2*n))*uy);
R:=((3+(2*n))*ux,f(3+(2*n))*uy);

draw S--T withpen pencircle scaled 2bp withcolor 0.6white;
draw M--N withpen pencircle scaled 2bp withcolor bleu_m;

draw (S shifted 1.5 h)--Q dashed evenly withpen pencircle scaled 1.2bp;
draw (T shifted 1.5 h)--R dashed evenly withpen pencircle scaled 1.2bp;
draw (N shifted 1.5 d)--R dashed evenly withpen pencircle scaled 1.2bp;
draw (M shifted 1.5 d)--Q dashed evenly withpen pencircle scaled 1.2bp;

draw fleched shifted (N+(1*ux,0)) withpen pencircle scaled 1.2bp;
draw fleched shifted (M+(1*ux,0)) withpen pencircle scaled 1.2bp;
draw flecheb shifted (S+(0,0.7*uy)) withpen pencircle scaled 1.2bp;
draw flecheb shifted (T+(0,0.7*uy)) withpen pencircle scaled 1.2bp;

endfig;





















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LIMITE INFINIE EN a NEWTON
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=9cm;  uy:=0.8cm;
  xmin := 0 ; xmax := 1.1;
  ymin := -.1 ; ymax := 4.7;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numeric w; %shift de l'axe vertical
w:=.04*ux;

  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))shifted (w,0); % axe des y
   label.lrt(btex $d$ etex,(xmax*ux,0)); % label de l'axe des x
   label.lft(btex $f$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;
  
beginfig(15);
numeric a; % abscisses 

vardef f(expr x) =1/(sqrt x) enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;

a:=.3;
path z; %zone rouge


z:= (0,f(a)*uy)--(xmax*ux,f(a)*uy)--(xmax*ux,ymax*uy)--(0,ymax*uy)--cycle;
fill z withcolor bleu_ciel;


axes;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La courbe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  
  draw trace(g,.05,1,.01) withcolor bleu_f withpen pencircle scaled 1.5bp;

%label.urt(btex $y=\frac{1}{\sqrt x}$ etex,(.5*ux,f(.5)*uy)shifted (.07*ux,.55*uy));
label.llft(btex $0$ etex,(-.05*ux,-.1*uy)shifted(w,0));

%%%%%%%%%%%%%%%%%%%%%%%%%
% Le point M
%%%%%%%%%%%%%%%%%%%%%%%%%

draw(ux,uy) withpen pencircle scaled 3bp;
%label.urt(btex M etex, (ux,uy));

%%%%%%%%%%%%%%%%%%%%%%%%%
% Tirets
%%%%%%%%%%%%%%%%%%%%%%%%%



%draw ((-.03*ux,uy)--(.03*ux,uy))shifted (w,0);
%label.lft(btex $1$ etex,(-.05*ux,uy)shifted(w,0));

%draw (ux,-.1*uy)--(ux,.1*uy);
%label.bot(btex $1$ etex,(ux,-.1*uy));

%%%%%%%%%%%%%%%%%%%%%%%%
% Flèches
%%%%%%%%%%%%%%%%%%%%%%%%

path p,q,r,s;

p:=(-.02*ux,-.1*uy)--(0,0)--(.02*ux,-.1*uy);
q:=p rotated 15;
r:=p rotated 60;
s:=p rotated 5;
draw q shifted (.15*ux,f(.15)*uy) withcolor bleu_f;
draw r shifted (.5*ux,f(.5)*uy) withcolor bleu_f;
draw s shifted (.07*ux,f(.07)*uy) withcolor bleu_f;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Les points N et NA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numeric b; % abscisses 



b:=.06;

draw (b*ux,f(b)*uy) withpen pencircle scaled 3bp;
%label.urt(btex $N$ etex,(b*ux,f(b)*uy));

draw (a*ux,f(a)*uy) withpen pencircle scaled 3bp;
%label.urt(btex $F_{A}$ etex,(a*ux,f(a)*uy)) withcolor red;
draw (a*ux,-.1*uy)--(a*ux,.1*uy);
label.bot(btex $\displaystyle  \sqrt{\ofr{Gmm'}{A}}$ etex,(a*ux,-.1*uy)shifted(.02*ux,0));

draw ((-.03*ux,f(a)*uy)--(.03*ux,f(a)*uy))shifted(w,0) withcolor bleu_m dashed withdots withpen pencircle scaled 1.5bp;
label.lft(btex $A$ etex,(-.05*ux,f(a)*uy)shifted(w,0)) withcolor bleu_m;



draw (w,f(a)*uy)--(a*ux,f(a)*uy)--(a*ux,0) dashed withdots withcolor bleu_m withpen pencircle scaled 1.5bp;
endfig;














%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Limite finie en l'infini : HUILE MOTEUR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=.5cm;  uy:=2.5cm;
  xmin := -.5 ; xmax := 12;
  ymin := -.1 ; ymax := 1.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $t$ etex,(xmax*ux,0)); % label de l'axe des x
   label.rt(btex $\othertheta$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

vardef f(expr x) =x/(x+1) enddef;

vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  

  
beginfig(16);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La courbe
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






label.llft(btex $0$ etex,(-.05*ux,-.1*uy));
%label.rt(btex $y=\displaystyle \mathbf{1-\frac{1}{x}}$ etex,(1.8*ux,.5*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% L'asymptote et les horizontales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

path z;
numeric e;
e:=.15;

z:= (0,(1+e)*uy)--(11.5*ux,(1+e)*uy)--(11.5*ux,(1-e)*uy)--(0,(1-e)*uy)--cycle;
fill z withcolor bleu_ciel;


draw(0,(1+e)*uy)--(11.5*ux,(1+e)*uy) withcolor bleu_m;
%label.rt(btex $y=1+\varepsilon$ etex,(11.5*ux,(1+e)*uy));
label.lft(btex $\tau+\varepsilon$ etex,(-.1*ux,(1+e)*uy));

draw(0,(1-e)*uy)--(11.5*ux,(1-e)*uy)withcolor bleu_m;
%label.rt(btex $y=1-\varepsilon$ etex,(11.5*ux,(1-e)*uy));
label.lft(btex $\tau-\varepsilon$ etex,(-.1*ux,(1-e)*uy));

draw (-.1*ux,uy)--(.1*ux,uy)withcolor bleu_m;
draw (.1*ux,uy)--(11.5*ux,uy) dashed evenly withcolor bleu_m;
label.lft(btex $1$ etex,(-.1*ux,uy));

label.bot(btex seuil etex,((1/e-1)*ux,0)) ;
draw ((1/e-1)*ux,0)--((1/e-1)*ux,(1-e)*uy) dashed evenly;


draw tracee(f,0,11.5,.008) withpen pencircle scaled 1.5bp withcolor bleu_f;


draw ((1/e-1)*ux,(1-e)*uy) withpen pencircle scaled 3bp;

axes;
endfig;

























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =1/(sqrt x) enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lim infinie en infini : Energie cinétique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numeric xmin, xmax, ymin, ymax;

ux:=1cm; uy:=0.9cm; xmin := -0.5; xmax := 8;
ymin := xmin; ymax := xmax-4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $v$ etex,(xmax*ux,0)); % label de l'axe des x
   label.lft(btex $\ER_c$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(17)

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Axe
%%%%%%%%%%%%%%%%%%%%%%%%%%

label.llft(btex $0$ etex,(0,0));

%%%%%%%%%%%%%%%%%%%%%%%
%Fonction, graphe
%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =.2*x*x enddef;

vardef tracee (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;


%label.rt(btex $y=2\sqrt{x}$ etex,(xmax*ux,(f(xmax))*uy));

%%%%%%%%%%%%%%%%%%%%%%%%
%Points sur le graphe
%%%%%%%%%%%%%%%%%%%%%%%
pair A[],M[],O[];
path z;
u:=.7;%facteur d'échelle
%a:=2;b:=5;c:=9;%numeros des points particuliers
aa:=2;bb:=5;cc:=9;%numeros des points particuliers

for i=1 upto 12: A[i]:=(i*u*ux,0);% A comme abscisse
                 M[i]:=(i*u*ux,f(i*u)*uy); %M comme courbe !!
                 O[i]:=(0,f(i*u)*uy); %O comme ordonnée
endfor ;

z:=O[bb]--O[bb]shifted (xmax*ux,0)--O[bb]shifted (xmax*ux,0)shifted(0,(ymax-f(5*u))*uy)--O[bb]shifted(0,(ymax-f(5*u))*uy)--cycle;
fill z withcolor bleu_ciel;
axes;
%dotlabel.lrt(btex Buzz etex, M[cc]);

%for i=1 upto 10:
 %   draw M[i] withpen pencircle scaled 6bp ;
%endfor ;

%for i=aa,bb,cc:
    draw A[bb]--M[bb]--O[bb] dashed evenly withcolor bleu_m;
%endfor;

%label.bot(btex premier essai etex,A[aa]);
label.bot(btex $v_0$ etex,A[bb]);
%label.bot(btex 3ème essai etex,A[cc]);

%label.lft(btex trop court etex,O[aa] shifted (0,.1*uy));
%label.lft(btex c'est juste etex,O[bb]  shifted (0,.1*uy));
%label.lft(btex vers l'infini et au-delà etex,O[cc]  shifted (0,.2*uy));

%%%%%%%%%%%%%%%%%%%
%Tracé des droites
%%%%%%%%%%%%%%%%%%
pair C,D;

C=O[bb]; %Point seuil
D=1/3(O[cc]+2O[cc-1]); %Point seuil

pickup pencircle scaled 2bp;

draw C--C  shifted (xmax*ux,0) withcolor bleu_m;
%draw D--D shifted (xmax*ux,0);

label.lft(btex $\ER_{\text{seuil}}$ etex,C shifted (0,-.1*uy));
%label.lft(btex $A_2$ etex,D shifted (0,-.1*uy));


draw tracee(g,0,4.472,.1)withcolor bleu_f;

endfig;








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  ARBRE ASYMPTOTIQUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Metapost TeX macro
% Title: Diagramme1.dia
% Creator: Dia v0.93
% CreationDate: Thu Sep  8 18:03:17 2005
% For: moi


beginfig(18);

  % picture(2.800000,-31.722785)(34.168750,-15.731250)
  x = 0.4500000cm; y = -0.6500000cm;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (5.150000x,20.100000y)--(12.710566x,16.496103y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (13.049076x,16.334745y)--(12.705301x,16.775562y)--(12.710566x,16.496103y)--(12.490158x,16.324216y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (13.049076x,16.334745y)--(12.705301x,16.775562y)--(12.710566x,16.496103y)--(12.490158x,16.324216y)--cycle
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (5.000000x,20.086638y)--(12.764874x,23.981728y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (13.100065x,24.149870y)--(12.541049x,24.149141y)--(12.764874x,23.981728y)--(12.765238x,23.702220y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (13.100065x,24.149870y)--(12.541049x,24.149141y)--(12.764874x,23.981728y)--(12.765238x,23.702220y)--cycle
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (15.450000x,24.000000y)--(19.530353x,20.503401y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (19.815104x,20.259388y)--(19.598112x,20.774572y)--(19.530353x,20.503401y)--(19.272761x,20.394905y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (19.815104x,20.259388y)--(19.598112x,20.774572y)--(19.530353x,20.503401y)--(19.272761x,20.394905y)--cycle
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (15.400000x,24.050000y)--(19.833137x,27.916654y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (20.115743x,28.163148y)--(19.574607x,28.022894y)--(19.833137x,27.916654y)--(19.903264x,27.646086y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (20.115743x,28.163148y)--(19.574607x,28.022894y)--(19.833137x,27.916654y)--(19.903264x,27.646086y)--cycle
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (23.600000x,28.100000y)--(31.690877x,25.248451y)
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (32.044554x,25.123801y)--(31.656085x,25.525786y)--(31.690877x,25.248451y)--(31.489885x,25.054216y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (32.044554x,25.123801y)--(31.656085x,25.525786y)--(31.690877x,25.248451y)--(31.489885x,25.054216y)--cycle
    withpen pencircle scaled 0.1000x;
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (23.800000x,28.100000y)--(31.793624x,31.067231y)
    withpen pencircle scaled 0.1000x;

  drawarrow (23.800000x,28.100000y)--(31.793624x,((31.067231+25.24845)/2)*y)
    withpen pencircle scaled 0.2x;

% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (32.145185x,31.197730y)--(31.589438x,31.258105y)--(31.793624x,31.067231y)--(31.763437x,30.789358y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (32.145185x,31.197730y)--(31.589438x,31.258105y)--(31.793624x,31.067231y)--(31.763437x,30.789358y)--cycle
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex $\infty$ ou pas de limite : pas d'asymptote ($x\mapsto x^2$) etex scaled 1.6,(13.450000x,16.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex $a$ etex scaled 1.6,(13.950000x,24.250000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  $a=0$ : direction asymptotique horizontale ($x\mapsto \ln x$) etex scaled 1.6,(20.500000x,20.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex $a\neq 0$ etex scaled 1.6,(20.550000x,28.186638y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex $\displaystyle\lim_{x\to+\infty}\big(f(x)-ax)=\infty$  ($x\mapsto x+\sqrt{x}$) etex scaled 1.6,(32.700000x,25.336638y));
  label.urt(btex  branche parabolique dans la direction  $y=ax$ etex scaled 1.6,(32.700000x,26.336638y));


% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex $\displaystyle\lim_{x\to+\infty}\big(f(x)-ax)=b$  ($x\mapsto x+\ofr{1}{x}$) etex scaled 1.67988,(32.800000x,31.286638y));
 label.urt(btex   asymptote d'équation $y=ax+b$ etex scaled 1.6,(32.800000x,32.286638y));
label.urt(btex   $\big(f(x)-ax\big)$ n'admet pas de limite ($x\mapsto x+\sin x$) etex scaled 1.6,(32.3x,((31.067231+25.24845)/2-0.25)*y));
label.urt(btex   direction asymptotique d'équation $y=ax$ etex scaled 1.6,(32.3x,((31.067231+25.24845)/2+0.75)*y));


% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  $\displaystyle\lim_{x\to+\infty}\frac{f(x)}{x}$ etex scaled 1.6,(0.1x,21y));
endfig;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%   TVI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







beginfig(19);

repere(10cm,4cm,1cm,1cm,1cm,0.4cm);
%trace.grille(0.5,0.5pt,0.88white);
%trace.grille(1,0.7pt,0.8white);
%marque.unites(1mm);
rtrace.axes(0.5pt);


draw rpoint(2,1) withpen pencircle scaled 5pt;

draw rpoint(6,4) withpen pencircle scaled 5pt;

draw rpoint(2,1)..rpoint(5,3)..rpoint(6,4)withpen pencircle scaled 1.5pt withcolor bleu_m;

draw rpoint(0,1)--rpoint(2,1)--rpoint(2,0)dashed evenly;
draw rpoint(0,4)--rpoint(6,4)--rpoint(6,0)dashed evenly;
draw rpoint(5,3)--rpoint(5,0) dashed evenly withcolor bleu;
draw rpoint(0,3)--rpoint(10,3) withcolor bleu;

label.lft(btex $f(b)$ etex,rpoint(0,4));
label.lft(btex $f(a)$ etex,rpoint(0,1));
label.bot(btex $a$ etex,rpoint(2,0));
label.bot(btex $b$ etex,rpoint(6,0));
label.llft(btex $0$ etex, rpoint(0,0));
label.lft(btex $k$ etex, rpoint(0,3));
label.bot(btex $c$ etex, rpoint(5,0));

decoupe.repere;
etiquette.axes;
%etiquette.unites;


endfig;










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%   TVI multiple
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





beginfig(20);

repere(11cm,4cm,1cm,1cm,1cm,0.4cm);
%trace.grille(0.5,0.5pt,0.88white);
%trace.grille(1,0.7pt,0.8white);
%marque.unites(1mm);
rtrace.axes(0.5pt);


draw rpoint(2,0.5) withpen pencircle scaled 5pt;

%draw rpoint(4,1.7) withpen pencircle scaled 5pt;

draw rpoint(3,2) withpen pencircle scaled 5pt;
draw rpoint(6,2) withpen pencircle scaled 5pt;
draw rpoint(8,2) withpen pencircle scaled 5pt;


draw rpoint(9,4) withpen pencircle scaled 5pt;

draw rpoint(2,0.5)..rpoint(3,2)..rpoint(4,3.7)..rpoint(6,2)..rpoint(7,1.5)..rpoint(8,2)..rpoint(9,4)withpen pencircle scaled 1.5pt withcolor bleu_m;

draw rpoint(0,0.5)--rpoint(2,0.5)--rpoint(2,0)dashed evenly;
draw rpoint(0,4)--rpoint(9,4)--rpoint(9,0)dashed evenly;
draw rpoint(3,2)--rpoint(3,0) dashed evenly withcolor bleu;
draw rpoint(6,2)--rpoint(6,0) dashed evenly withcolor bleu;
draw rpoint(8,2)--rpoint(8,0) dashed evenly withcolor bleu;

draw rpoint(0,2)--rpoint(10,2) withcolor bleu;
%draw rpoint(4,0)--rpoint(4,1.7) dashed evenly;




label.lft(btex $f(b)$ etex,rpoint(0,4));
label.lft(btex $f(a)$ etex,rpoint(0,0.5));
label.bot(btex $a$ etex,rpoint(2,0));
label.bot(btex $b$ etex,rpoint(9,0));
label.llft(btex $0$ etex, rpoint(0,0));
label.lft(btex $k$ etex, rpoint(0,2));
label.bot(btex $c_1$ etex, rpoint(3,0));
label.bot(btex $c_2$ etex, rpoint(6,0));
label.bot(btex $c_3$ etex, rpoint(8,0));

%label.bot(btex $m$ etex, rpoint(4,0));




decoupe.repere;
etiquette.axes;
%etiquette.unites;


endfig;







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TANGENTE qui tourne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=1.3cm;
  uy:=1.3cm;
  xmin := -.5; xmax := 4.5;
  ymin := -.5; ymax := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(21);

axes; label.llft(btex $0$ etex,(-.1*ux,-.1*uy));

%%%%%%%%%%%%%%%
% Courbes
%%%%%%%%%%%%%%%
path p,q;

p:=(0,0){dir10}..(3.5*ux,3*uy); q:=(.2*ux,.5*uy)--(4.5*ux,1.5*uy);

draw p withpen pencircle scaled 1.2bp withcolor bleu_m ; draw q withcolor green;

label.rt(btex $\Gamma$ etex,(3.5*ux,3.2*uy));
%label.rt(btex D etex,(4.5*ux,2.1*uy));

%%%%%%%%%%%%%%%%%%%%%%%%%
% Point d'intersection
%%%%%%%%%%%%%%%%%%%%%%%%
pair A;

A:=(p intersectionpoint q);

draw A withpen pencircle scaled 3.5bp;

label.ulft(btex A etex,A shifted (.1*ux,.1*uy)) ;

%%%%%%%%%%%%%%%%%%%%%%%%%
% Verticale
%%%%%%%%%%%%%%%%%%%%%%%%%
pair B;

B:=A yscaled0;

draw A--B dashed evenly ;

draw (B shifted (0,.1*uy))--(B shifted (0,-.1*uy)); label.bot(btex $a$ etex,B shifted (0,-.1*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Droites tournées
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

draw q rotatedaround(A,9)withcolor green; draw q rotatedaround(A,18)withcolor green; draw q rotatedaround(A,27) withpen pencircle scaled 1.5bp withcolor vert_e;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La flèche
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair C; % point de départ de la flèche
pair D; % point d'arrivée de la flèche

C=(4.7*ux,1.7*uy); D=C rotatedaround(A,20);

drawarrow C{dir(80+angle (C))}..{dir(100+angle (D))}D dashed evenly withpen pencircle scaled 1.5bp withcolor green;

%label.urt(btex \mg$n\!\to\!\infty$ etex,C rotated 20) withpen pencircle scaled 1.5bp;

endfig;










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LEIBNIZ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=1.3cm;
  uy:=1.3cm;
  xmin := -.5; xmax := 4.5;
  ymin := -.5; ymax := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax) ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(22);

axes; label.llft(btex $0$ etex,(-.1*ux,-.15*uy));

%%%%%%%%%%%%%%%
% Courbes
%%%%%%%%%%%%%%%
path p,q;

p:=(0,0){dir10}..(3.5*ux,3*uy); q:=(.2*ux,.5*uy)--(4.5*ux,1.5*uy);

draw p withpen pencircle scaled 1.2bp withcolor bleu_m;


label.rt(btex $\Gamma$ etex,(3.5*ux,3.2*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%
% Point d'intersection
%%%%%%%%%%%%%%%%%%%%%%%%
pair A;

A:=(p intersectionpoint q);

draw A withpen pencircle scaled 3.5bp;

label.ulft(btex A etex,A shifted (.1*ux,.1*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tangente
%%%%%%%%%%%%%%%%%%%%%%%%%%

draw q rotatedaround(A,27) withpen pencircle scaled 1.5bp withcolor bleu;

%%%%%%%%%%%%%%%%%%%%%%%%%
% Verticale
%%%%%%%%%%%%%%%%%%%%%%%%%
pair B, BB;

B:=A yscaled0; BB:=A xscaled 0;

draw A--B dashed evenly;

draw A--BB dashed evenly;


draw (B shifted (0,.1*uy))--(B shifted (0,-.1*uy)); label.bot(btex $a$ etex,B shifted (0,-.17*uy));
draw (BB shifted (.1*ux,0))--(BB shifted (-.1*ux,0)); label.lft(btex $f(a)$ etex,BB shifted (-.17*ux,0));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Droite tournée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path r;

r:=q rotatedaround(A,38);

draw r withcolor bleu_f;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mh et sa verticale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair C;

C:=(3.25*ux,2.4*uy);

draw C withpen pencircle scaled 3.5bp;

label.ulft(btex $M_{h}$ etex,C shifted (-.1*ux,.1*uy));


pair D,DD;

D:=C yscaled0;
DD:=C xscaled0;

draw C--D dashed evenly;
draw C--DD dashed evenly;


draw (D shifted (0,.1*uy))--(D shifted (0,-.1*uy)); label.bot(btex $a+h$ etex,D shifted (0,-.1*uy));
draw (DD shifted (.1*ux,0))--(DD shifted (-.1*ux,0)); label.lft(btex $f(a+h)$ etex,DD shifted (-.1*ux,0));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La flèche
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair E; % point de départ de la flèche
pair F; % point d'arrivée de la flèche

E=(3.5*ux,2.7*uy); F=E rotatedaround(A,-10);

drawarrow E{dir(-60+angle (E))}..{dir(-110+angle (F))}F dashed evenly withpen pencircle scaled 1.5bp withcolor bleu_f;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% triangle caractéristique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path pp,qq; pair G,AA;
AA:=A shifted(10*ux,0);
pp:=BB--AA;  qq:=C--D;
G:=(pp intersectionpoint qq);

drawdblarrow G shifted(0.2*ux,0)--C shifted(0.2*ux,0) withcolor 0.6white;
drawdblarrow G shifted(0,-0.2*uy)--A shifted(0,-0.2*uy) withcolor 0.6white;
label.rt(btex $\Delta y$ etex,((C+G)/2)shifted(0.3*ux,0)) withcolor 0.6white;
label.bot(btex $\Delta x$ etex,((A+G)/2)shifted(0,-0.3*uy))withcolor 0.6white;

draw A--G dashed evenly;

endfig;

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Figure mouette
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%beginfig(23)


%repere(12cm,4cm,4cm,3.5cm,4cm,0.5cm);
%trace.grille(0.5,0.5pt,0.88white);
%trace.grille(1,0.7pt,0.8white);
%marque.unites(1mm);
%rtrace.axes(0.5pt);


%vardef fx(expr t)=t enddef;
%vardef fy(expr t)=t*(t-2) enddef;
%rtrace.courbe(-1,0,500,1.5pt,bleu_m);
%draw rpoint(0,-5)--rpoint(100,420) dashed evenly;
%vardef fy(expr t)=t*(2-t) enddef;
%rtrace.courbe(0,1.8,500,1.5pt,bleu_m);


%dotlabel.urt(btex $y=|x(x-2)|$ etex, rpoint(1.8,0.36));


%decoupe.repere;
%etiquette.axes;
%etiquette.unites;
beginfig(23)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=2.7cm;
  uy:=1.75cm;
  xmin := -0.8; xmax := 1.4;
  ymin := -.5; ymax := 1.5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax) ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =abs(x*(x-2)) enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;


axes; label.llft(btex $0$ etex,(-.05*ux,-.15*uy));

%%%%%%%%%%%%%%%
% Courbe
%%%%%%%%%%%%%%%

draw trace(f,-.5,1.3,.01)withpen pencircle scaled 1.3bp withcolor bleu_m;

%%%%%%%%%%%%%%%%%
% Labels
%%%%%%%%%%%%%%%%%

pair h,b,g,d;

h:=(0,.1*uy); b:=(0,-.1*uy); g:=(-.1*ux,0); d:=(.1*ux,0);

draw ((ux,0) shifted h)--((ux,0) shifted b); %draw ((-ux,0) shifted h)--((-ux,0) shifted b);

label.bot(btex $1$ etex,(ux,0) shifted b); %label.bot(btex $-1$ etex,(-ux,0) shifted b);

label.ulft(btex $1$ etex,(0,uy) shifted h+.5g);

label.urt(btex $y=\vert x(x-2)\vert$ etex,(1.3*ux,1*uy)); 



drawarrow (0,0)--(0.5*ux,1*uy) dashed evenly withcolor bleu_f;
drawarrow (0,0)--(-0.5*ux,1*uy) dashed evenly withcolor bleu_f;


endfig;


beginfig(241)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=2.5cm;
  uy:=1.8cm;
  xmin := -0.2; xmax := 3.1;
  ymin := -.25; ymax := 1.8;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax) ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =sqrt(x-0.5) enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;


axes; label.llft(btex $0$ etex,(-.05*ux,-.15*uy));

%%%%%%%%%%%%%%%
% Courbe
%%%%%%%%%%%%%%%

draw trace(f,.5,3,.01)withpen pencircle scaled 1.3bp withcolor bleu_m;

%%%%%%%%%%%%%%%%%
% Labels
%%%%%%%%%%%%%%%%%

pair h,b,g,d;

h:=(0,.1*uy); b:=(0,-.1*uy); g:=(-.1*ux,0); d:=(.1*ux,0);

draw ((ux,0) shifted h)--((ux,0) shifted b); %draw ((-ux,0) shifted h)--((-ux,0) shifted b);

label.bot(btex $1$ etex,(ux,0) shifted b); %label.bot(btex $-1$ etex,(-ux,0) shifted b);

label.ulft(btex $1$ etex,(0,uy) shifted h+.5g);

label.urt(btex $\displaystyle y=\sqrt{x-\frac{1}{2}}$ etex,(3*ux,1.8*uy)); 



drawarrow (0.5*ux,0)--(0.5*ux,1*uy) dashed evenly withcolor bleu_f;
%drawarrow (0,0)--(-0.5*ux,1*uy) dashed evenly withcolor red;


endfig;













%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% approximation affine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=1cm;
  uy:=0.9cm;
  xmin := 1.1; xmax := 7;
  ymin := -.3; ymax := 4;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax)) shifted (1.4*ux,0) ; % axe des y
   %label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   %label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(24);

axes; label.llft(btex $0$ etex,(1.3*ux,-.1*uy));

pair h,b; % shift des tirets

b:=(0,-.1*uy); h:=(0,.1*uy);

%%%%%%%%%%%%%%%
% Courbe
%%%%%%%%%%%%%%%
path p;

p:=(1.6ux,1.2*uy)..(2.5*ux,uy)..(5.5*ux,4*uy);



draw p withpen pencircle scaled 1.3bp withcolor bleu_m; label.rt(btex $\mathcal{C}_f$ etex,(5.5*ux,4*uy)shifted 2h);

%%%%%%%%%%%%%%%%%%
% Tangente
%%%%%%%%%%%%%%%%%%
numeric e; %paramètre du point A

pair M,A;

e:=1.3;

A:=point e of p; M:=direction e of p;

path T; T:=(A shifted -1.5M)--(A shifted 1.5M); draw T withcolor bleu; label.rt(btex $\mathcal{T}$ etex,A shifted M+(.7*ux,0)+4h) withcolor bleu;

%%%%%%%%%%%%%%%%%%%%%
% Verticales
%%%%%%%%%%%%%%%%%%%%%

draw A withpen pencircle scaled 3bp withcolor bleu_m; label.top(btex $A$ etex, A shifted h)withcolor bleu_m;

pair B; B:= A yscaled 0;

draw A--B dashed evenly withcolor 0.6white; label.bot(btex $a$ etex,B shifted b) withcolor 0.6white;

draw (B shifted b)--(B shifted h) withcolor 0.6white;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Le deuxième point et l'écart
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pair D,E,F; D:=point 1.7 of p;
%draw D withpen pencircle scaled 3bp;

E:=D yscaled 0;

path r;

r:=D--E;

F:=(T intersectionpoint r);

drawarrow D--F withpen pencircle scaled 1.5bp withcolor 0.6white; drawarrow F--D withpen pencircle scaled 1.5bp withcolor 0.6white; label.rt(btex $e(x)$ etex,(4*ux,3.4*uy)) withcolor 0.6white;
draw F--E dashed evenly withcolor 0.6white;

label.bot(btex $x$ etex,E shifted b)withcolor 0.6white; draw (E shifted h)--(E shifted b) withcolor bleu_f;


%%%%%%%%%%%%%%%%%%%%%%%%%
% La flèche
%%%%%%%%%%%%%%%%%%%%%%%%%

pair G; % point de départ de la flèche
pair H; % point d'arrivée de la flèche

G=(4.7*ux,3.1*uy); H=G rotated -10;

drawarrow G{dir(250+angle (G))}..{dir(-20-angle (H))}H withcolor 0.6white;


endfig;












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%fonction décroissante et pentes  (25)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, W;
  
  ux:=1cm;  uy:=0.8cm;
  xmin := -.5 ; xmax := 5.5;
  ymin := -.5 ; ymax := 4 ;


  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;
  
  
beginfig(25);

axes;

%%%%%%%%%%%%%%%%%%%%
% Shifts
%%%%%%%%%%%%%%%%%%%%
pair h,g;
h:=(0,.1*uy);
g:=(-.1*ux,0);

%%%%%%%%%%%%%%%%%%%%
% Courbe
%%%%%%%%%%%%%%%%%%%%

path N;

N:=(.5*ux,3.5*uy){dir-70}..(5*ux,.5*uy){dir-10};

draw N withpen pencircle scaled 1.3bp withcolor bleu_f;
label.urt(btex $y=f(x)$ etex,(5*ux,.5*uy)) withcolor bleu_f;

pair A,B;
A:=point 0.2 of N ;
B:=point 0.7 of N ;
draw A withpen pencircle scaled 3bp withcolor 0.6white;
draw B withpen pencircle scaled 3bp withcolor 0.6white;

pair M,P;
M:=direction 0.2 of N;
P:=direction 0.7 of N;

drawarrow (A--(A shifted .6M)) withpen pencircle scaled 1.3bp withcolor 0.6white;
drawarrow (A--(A shifted -.6M))withpen pencircle scaled 1.3bp withcolor 0.6white;
drawarrow (B--(B shifted .6P))withpen pencircle scaled 1.3bp withcolor 0.6white;
drawarrow (B--(B shifted -.6P))withpen pencircle scaled 1.3bp withcolor 0.6white;
endfig;












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Figure 26
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=.005cm;  uy:=.004cm;
  xmin := -280 ; xmax :=900;
  ymin := -350; ymax :=900;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 numeric p,q; % shift des axes
 p:=200;
 q:=120;
  vardef axes =
   drawarrow ((ux*xmin,0) -- (ux*xmax,0))shifted (0,p*uy) ; % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))shifted (q*ux,0); % axe des y
   label(btex $x$ etex,(950*ux,200*uy)); % label de l'axe des x
   label(btex $y$ etex,(120*ux,950*uy)); % label de l'axe des y
  enddef;

 beginfig(26);  
%%%%%%%%%%%%%%%%%%%%%%%%
%Courbe
%%%%%%%%%%%%%%%%%%%%%%%%

axes;

vardef f(expr x) =x-50*cosd(x) enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,g(i)*uy) ..
    endfor (b*ux,g(b)*uy)
  enddef;
  
  path P;
  P:=trace(f,-280,830,10) ;
  draw P withcolor bleu_m;
  
  label.rt(btex $y=x-\cos x$ etex,(830*ux,f(830)*uy)) withcolor bleu_m;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tangentes horizontales
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair A,B,C,D,a,b,c,d;
pair T;


A:=(-110*ux,0) ;
B:=(250*ux,0);
C:=(610*ux,0);
a:=(-110*ux,f(-110)*uy);
b:=(250*ux,f(250)*uy);
c:=(610*ux,f(610)*uy);

T:=(80*ux,0);
drawarrow (a--(a shifted T))withcolor bleu_f;
drawarrow (a--(a shifted -T))withcolor bleu_f;

drawarrow (b--(b shifted T))withcolor bleu_f;
drawarrow (b--(b shifted -T))withcolor bleu_f;

drawarrow (c--(c shifted T))withcolor bleu_f;
drawarrow (c--(c shifted -T))withcolor bleu_f;

pair d,e,f;
d:=(a yscaled 0)shifted(0,p*uy);
draw (a--d) dashed evenly withcolor bleu_f;
e:=(b yscaled 0)shifted(0,p*uy);
draw (b--e) dashed evenly withcolor bleu_f;
f:=(c yscaled 0)shifted(0,p*uy);
draw (c--f) dashed evenly withcolor bleu_f;

draw (d shifted (0,20*uy))--(d shifted (0,-20*uy)) withcolor bleu_f;
label.top(btex \small{$\displaystyle\frac{-3\pi}{2}$} etex,d shifted (0,20*uy)) withcolor bleu_f;
draw (e shifted (0,20*uy))--(e shifted (0,-20*uy)) withcolor bleu_f;
label.bot(btex \small{$\displaystyle\frac{\pi}{2}$} etex,e shifted (0,-20*uy)) withcolor bleu_f;
draw (f shifted (0,20*uy))--(f shifted (0,-20*uy)) withcolor bleu_f;
label.bot(btex \small{$\displaystyle\frac{5\pi}{2}$} etex,f shifted (0,-20*uy)) withcolor bleu_f;
label.ulft(btex \small{$0$} etex,((q-20)*ux,(p+20)*uy));
endfig;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% les dents de la mer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(27);
drawdblarrow (0,0)--(0,3cm) dashed evenly withcolor bleu_f ;
drawdblarrow (0,3cm)--(7cm,3cm) dashed evenly withcolor bleu_f;
draw (0,0)--(2cm,3cm);
mark_rt_angle((0,0),(0,3cm),(7cm,3cm));
label.llft(btex $A$ etex,(0,0));
label.ulft(btex $H$ etex,(0,3cm));
dotlabel.lrt(btex $M(x)$ etex,(2cm,3cm));
label.top(btex $B$ etex,(7cm,3cm));
label.lft(btex $18$m etex,(0,1.5cm)) withcolor bleu_f;
label.top(btex $30$m etex,(3.5cm,3cm)) withcolor bleu_f;

endfig;





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% La baleine
%%%%%%%%%%%%%%%%%%%%%%%%


beginfig(28)

repere(9cm,3.5cm,0.5cm,0.5cm,0.75cm,0.777cm);

draw rpoint(0,0){dir0}..rpoint(4,1)..rpoint(5.5,3.1754){dir30}..tension1.3..rpoint(11,0) withpen pencircle scaled 1.5bp; draw
rpoint(0,0)--rpoint(8,4.6188) withpen pencircle scaled 0.5bp; draw rpoint(5.5,0)--rpoint(5.5,3.1754) dashed withdots scaled 0.5;

label.bot(btex $x_0$ etex, rpoint(5.5,0)); label.lrt(btex $0$ etex, rpoint(0,0)); label.bot(btex $1$ etex, rpoint(11,0)); label.ulft(btex
$M_0$ etex, rpoint(5.5,3.1754)); label.urt(btex $y=f(x)$ etex, rpoint(9,3));



rtrace.axes(0.5pt);





decoupe.repere; etiquette.axes;


endfig; 




















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Différentielle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=1.3cm;
  uy:=1.3cm;
  xmin := -.5; xmax := 4.5;
  ymin := -.5; ymax := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax) ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(29);

axes; label.llft(btex $0$ etex,(-.1*ux,-.15*uy));

%%%%%%%%%%%%%%%
% Courbes
%%%%%%%%%%%%%%%
path p,q;

p:=(0,0){dir10}..(3.5*ux,3*uy); q:=(.2*ux,.5*uy)--(4.5*ux,1.5*uy);

draw p withpen pencircle scaled 1.2bp withcolor bleu_m;


label.rt(btex $\Gamma$ etex,(3.5*ux,3.2*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%
% Point d'intersection
%%%%%%%%%%%%%%%%%%%%%%%%
pair A;

A:=(p intersectionpoint q);

draw A withpen pencircle scaled 3.5bp;

label.ulft(btex A etex,A shifted (.1*ux,.1*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tangente
%%%%%%%%%%%%%%%%%%%%%%%%%%
path qqq;
qqq:=q rotatedaround(A,27);
draw q rotatedaround(A,27) withpen pencircle scaled 1.5bp withcolor vert_e;

%%%%%%%%%%%%%%%%%%%%%%%%%
% Verticale
%%%%%%%%%%%%%%%%%%%%%%%%%
pair B, BB;

B:=A yscaled0; BB:=A xscaled 0;

draw A--B dashed evenly;

draw A--BB dashed evenly;


draw (B shifted (0,.1*uy))--(B shifted (0,-.1*uy)); label.bot(btex $a$ etex,B shifted (0,-.17*uy));
draw (BB shifted (.1*ux,0))--(BB shifted (-.1*ux,0)); label.lft(btex $f(a)$ etex,BB shifted (-.17*ux,0));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Droite tournée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path r;

r:=q rotatedaround(A,38);

%draw r withcolor green;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mh et sa verticale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair C;

C:=(3.25*ux,2.4*uy);

draw C withpen pencircle scaled 3.5bp;

label.ulft(btex $M'$ etex,C shifted (-.1*ux,.1*uy));


pair D,DD;

D:=C yscaled0;
DD:=C xscaled0;

draw C--D dashed evenly;
draw C--DD dashed evenly;


draw (D shifted (0,.1*uy))--(D shifted (0,-.1*uy)); label.bot(btex $a+$d$x$ etex,D shifted (0,-.1*uy));
draw (DD shifted (.1*ux,0))--(DD shifted (-.1*ux,0)); label.lft(btex $f(a+$d$x)$ etex,DD shifted (-.1*ux,0));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La flèche
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair E; % point de départ de la flèche
pair F; % point d'arrivée de la flèche

E=(3.5*ux,2.7*uy); F=E rotatedaround(A,-10);

%drawarrow E{dir(-60+angle (E))}..{dir(-110+angle (F))}F dashed evenly withpen pencircle scaled 1.5bp withcolor green;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% triangle caractéristique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path pp,qq; pair G,AA,H,HH;
AA:=A shifted(10*ux,0); 
pp:=BB--AA;  qq:=C--D;
G:=(pp intersectionpoint qq);
H:=(qqq intersectionpoint qq);
HH:=H shifted(10*ux,0);
draw H withpen pencircle scaled 3.5bp;
draw G withpen pencircle scaled 3.5bp;

drawarrow G shifted(0.5*ux,0)--H shifted(0.5*ux,0) withcolor 0.6white;
drawarrow A shifted(0,-0.2*uy)--G shifted(0,-0.2*uy) withcolor 0.6white;
label.rt(btex d$f$ etex,((H+G)/2)shifted(0.5*ux,0)) withcolor 0.6white;
label.bot(btex d$x$ etex,((A+G)/2)shifted(0,-0.3*uy))withcolor 0.6white;
label.lrt(btex $T$ etex, (H shifted(0.1*ux,0))) withcolor 0.6white;
label.lrt(btex $G$ etex, (G shifted(0.1*ux,0))) withcolor 0.6white;
draw A--G shifted(0.95*ux,0) dashed evenly;
draw H--H shifted(0.5*ux,0) dashed evenly;
draw C--C shifted(0.95*ux,0) dashed evenly;
drawarrow G shifted(0.95*ux,0)--C shifted(0.95*ux,0) withcolor 0.6white;
label.rt(btex $\Delta f$ etex,((C+G)/2)shifted(0.95*ux,0)) withcolor 0.6white;

endfig;

















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   ROLLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef droite(expr a,b,t) = 
 (t[a,b])--(t[b,a]) 
enddef; 

path c,cartouche; 
c=(2.8cm,2.7cm)..(3.5cm,3.2cm)..(7.5cm,3.2cm)..(7.8cm,2.6cm); 
cartouche = (4cm,2mm)--(9cm,2mm)--(9cm,8mm)--(4cm,8mm)--cycle; 

pair A,M; 
A = point 1 of c; 
M = point 2 of c; 


vardef tangente(expr t,x) = 
 pair X,Y; 
 X := point (t-.05) of c; 
 Y := point (t+.05) of c; 
 droite(X,Y,x) 
enddef;

beginfig(30);
   % grille(1cm,0,10cm,0,7cm); 
    repere(10cm,5cm,2cm,2cm,1cm,1cm); 
    rtrace.axes(0.5pt); 
    %marque.unites(0.1); 
 
    %% lectures sur la grille 
    numeric xa,ya,xm,ym,xc,yc; 
    xa = 1.5; ya = 1.2 ; xm = 5.5 ; ym = 1.2; 
    xc = 3.8 ; yc =1.95; 
    pair AA,MM,CC; 
    AA = (xa,ya) ; MM = (xm,ym) ; CC = (xc,yc); 
    projection.axes(AA,0.5,1.7); 
    projection.axes(MM,0.5,1.7); 
    draw (CC--(xc,0)) en_place 
	dashed evenly scaled 1.7 
	withpen pencircle scaled 0.5; 
 
    label(btex $a$ etex,rpoint(xa,-0.2)); 
    label(btex $b$ etex,rpoint(xm,-0.2)); 
    label(btex $c$ etex,rpoint(xc,-0.2)); 
    label.lft(btex $f(b) = f(a)$ etex, rpoint(0,ym)); 
    %% fin des lectures 
 
    draw c withpen pencircle scaled 1.5pt withcolor bleu_f; 
 
    draw droite(A,M,1.2); 
 
    draw tangente(1.53325,6) withpen pencircle scaled 1.5pt withcolor 0.6white; 
 
    dotlabel.lrt(btex $A$ etex ,A); 
 
    dotlabel.llft(btex $B$ etex ,M); 
 
    label.lrt(btex $\CR_f$ etex ,point 3 of c); 
 
 
    %% Cartouche 
    %fill cartouche withcolor .8white; 
    %draw cartouche; 
    %label.rt(btex \textbf{Th. de Rolle} etex xscaled 1.15,(4cm,5mm)); 
    %% fin du cartouche 
 
    decoupe.repere; 
    etiquette.axes; 
endfig;
















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    TAF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pair A,M; path c,cartouche; 

c=(2.3cm,1cm)..(4.5cm,4cm)..(9cm,3cm); 
cartouche = (4cm,2mm)--(9cm,2mm)--(9cm,8mm)--(4cm,8mm)--cycle; 

A = point 0.6 of c; 
M = point 1.5 of c; 
 

beginfig(31);
    %grille(1cm,0,10cm,0,7cm); 
    repere(10cm,5cm,2cm,2cm,1cm,1cm); 
    rtrace.axes(0.5pt); 
    %marque.unites(0.1); 
 
    %% lectures sur la grille 
    numeric xa,ya,xm,ym,xc,yc; 
    xa = 1.25; ya = 1.1 ; xm = 4.9 ; ym = 2.25; 
    xc = 2.9 ; yc =2.2; 
    pair AA,MM,CC; 
    AA = (xa,ya) ; MM = (xm,ym) ; CC = (xc,yc); 
   % projection.axes(AA,0.5,1.7); 
    %projection.axes(MM,0.5,1.7); 
path ff,ab;
ff:=rpoint(xc,yc)--rpoint(xc,0);
ab:=(AA--MM) en_place;
    
pair P,m;
m:=(ff intersectionpoint c);
P:=(ff intersectionpoint ab);
draw (CC--(xc,0)) en_place dashed evenly scaled 1.7 withpen pencircle scaled 0.5; 
 
draw rpoint(xa,ya)--rpoint(xa,-0.2) dashed evenly;
draw rpoint(xm,ym)--rpoint(xm,-0.2) dashed evenly;

    label(btex $a$ etex,rpoint(xa,-0.2)); 
    label(btex $b$ etex,rpoint(xm,-0.2)); 
dotlabel.ulft(btex $M$ etex, m);
dotlabel.lrt(btex $P$ etex, P);
 
   label(btex $x$ etex,rpoint(xc,-0.2)); 
    %label.lft(btex $f(a)$ etex, rpoint(0,ya)); 
    %label.lft(btex $f(b)$ etex, rpoint(0,ym)); 
    %% fin des lectures 
 
    draw c withpen pencircle scaled 1.5pt withcolor bleu_f; 
 
    draw droite(A,M,1.2); 
 
    draw tangente(1.09,6) withpen pencircle scaled 1.5pt withcolor 0.6white; 
 
    dotlabel.lrt(btex $A$ etex ,A); 
 
    % dotlabel.lrt(btex $B$ etex scaled 1.5,M); 
    dotlabel.lrt(btex etex,M); 
    label.bot(btex $B$ etex ,rpoint(5.15,2.2)); 
 
    label.bot(btex $\CR_f$ etex ,point 2 of c); 
 
 
    %% Cartouche 
    %fill cartouche withcolor .8white; 
    %draw cartouche; 
    %label.rt(btex \textbf{Th. des accroissements finis} etex 
	%xscaled 0.95,(4cm,5mm)); 
    %% fin du cartouche 
 
    decoupe.repere; 
    etiquette.axes; 
endfig;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
%%%%%%%%     COMPLEXES                       COMPLEXES                                   COMPLEXES                                    %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%    AXE DES REELS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


beginfig(32);

drawarrow (-5cm,0)--(5cm,0) withcolor bleu_m withpen pencircle scaled 1.5bp;
draw (-3cm,-0.2cm)--(-3cm,0.2cm);
draw (-1.414cm,-0.2cm)--(-1.414cm,0.2cm);
draw (0cm,-0.2cm)--(0cm,0.2cm);
draw (0.66666666cm,-0.2cm)--(0.66666666cm,0.2cm);
draw (3.14cm,-0.2cm)--(3.14cm,0.2cm);

label.bot(btex $3$ etex,(-3cm,-0.2cm));
label.bot(btex $-\sqrt{2}$ etex,(-1.414cm,-0.2cm));
label.bot(btex $0$ etex,(0cm,-0.2cm));
label.bot(btex $\frac{2}{3}$ etex,(0.66666666cm,-0.2cm));
label.bot(btex $\pi$ etex,(3.14cm,-0.2cm));
label.bot(btex $\mathbb{R}$ etex,(5cm,-0.2cm))withcolor bleu_m withpen pencircle scaled 1.5bp;

endfig;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  FAUX ELEMENT NEUTRE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(33);

drawarrow (-5cm,0)--(5cm,0) withcolor bleu_m withpen pencircle scaled 1.5bp;
drawarrow (0,-1.5cm)--(0,2.5cm) dashed evenly withcolor 0.6white withpen pencircle scaled 1.5bp ;

label.urt(btex $(1,1)$ etex, (1cm,1cm))withcolor 0.6white dashed evenly;
dotlabel.urt(btex $ $ etex, (1cm,1cm));


%draw (-3cm,-0.2cm)--(-3cm,0.2cm);
draw (1cm,-0.2cm)--(1cm,0.2cm);
draw (-0.2cm,1cm)--(0.2cm,1cm) withcolor 0.6white;

draw (0cm,-0.2cm)--(0cm,0.2cm);
%draw (0.66666666cm,-0.2cm)--(0.66666666cm,0.2cm);
%draw (3.14cm,-0.2cm)--(3.14cm,0.2cm);
draw (0,1cm)--(1cm,1cm)--(1cm,0) withcolor 0.6white dashed withdots withpen pencircle scaled 1.5bp;


%label.bot(btex $3$ etex,(-3cm,-0.2cm));
label.bot(btex $1$ etex,(1cm,-0.2cm))withcolor bleu_m;
label.lft(btex $1$ etex,(-0.2cm,1cm)) withcolor 0.6white dashed evenly;
label.llft(btex $0$ etex,(-0.2cm,-0.2cm))withcolor bleu_m;
%label.bot(btex $\frac{2}{3}$ etex,(0.66666666cm,-0.2cm));
%label.bot(btex $\pi$ etex,(3.14cm,-0.2cm));
label.bot(btex $\mathbb{R}$ etex,(5cm,-0.2cm))withcolor bleu_m withpen pencircle scaled 1.5bp;
label.urt(btex $(1,0)$ etex,(1cm,0.1cm)) withcolor 0.6white;

endfig;







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%     REPRESENTATION COMPLEXE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(34);

drawarrow (-5cm,0)--(5cm,0) withcolor bleu_m withpen pencircle scaled 1.5bp;
drawarrow (0,-1.5cm)--(0,2.5cm)  withcolor bleu_f withpen pencircle scaled 1.5bp ;

label.urt(btex \boldmath $M(a,b)$\unboldmath etex, (3cm,1.5cm))withcolor 0.6white dashed evenly;
draw (3cm,-0.2cm)--(3cm,0.2cm)withcolor 0.6white;
draw (-0.2cm,1.5cm)--(0.2cm,1.5cm) withcolor 0.6white;
dotlabel.urt(btex $ $ etex, (3cm,1.5cm));




%draw (0cm,-0.2cm)--(0cm,0.2cm);
draw (0,1.5cm)--(3cm,1.5cm)--(3cm,0) withcolor 0.6white dashed withdots withpen pencircle scaled 1.5bp;

drawarrow (0,0)--(1cm,0) withcolor bleu_m withpen pencircle scaled 3bp;
drawarrow (0,0)--(0,1cm) withcolor bleu_f withpen pencircle scaled 3bp;
label.bot(btex $\overrightarrow{e_1}$ etex,(0.5cm,-0.2cm))withcolor bleu_m;
label.lft(btex $\overrightarrow{e_2}$ etex,(-0.2cm,0.5cm)) withcolor bleu_f dashed evenly;
drawarrow (0,0)--(3cm,1.5cm) withcolor 0.6white withpen pencircle scaled 1.5bp;
label.bot(btex $a$ etex,(3cm,-0.2cm))withcolor bleu_m;
label.lft(btex $b$ etex,(-0.2cm,1.5cm)) withcolor bleu_f dashed evenly;
label.llft(btex $0$ etex,(-0.2cm,-0.2cm));
label.bot(btex \textbf{axe réel} etex,(5cm,-0.2cm))withcolor bleu_m withpen pencircle scaled 1.5bp;
label.lft(btex \textbf{axe imaginaire} etex,(0cm,2.5cm))withcolor bleu_f withpen pencircle scaled 1.5bp;
label.ulft(btex \boldmath$\overrightarrow{u}$\unboldmath etex, (1.5cm,0.75cm))withcolor 0.6white;

endfig;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% CONJUGUE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


beginfig(35);

drawarrow (-5cm,0)--(5cm,0) withcolor bleu_m withpen pencircle scaled 1.5bp;
drawarrow (0,-1.5cm)--(0,2.5cm)  withcolor bleu_f withpen pencircle scaled 1.5bp ;

label.urt(btex \boldmath $M(z)$\unboldmath etex, (3cm,1.5cm))withcolor 0.6white dashed evenly;
dotlabel.urt(btex $ $ etex, (3cm,1.5cm));
label.urt(btex \boldmath $M(\overline{z})$\unboldmath etex, (3cm,-1.5cm))withcolor 0.6white dashed evenly;
dotlabel.urt(btex $ $ etex, (3cm,-1.5cm));

draw(3cm,1.5cm)--(3cm,-1.5cm) withcolor 0.6white dashed evenly;

%draw (3cm,-0.2cm)--(3cm,0.2cm)withcolor rose;
%draw (-0.2cm,1.5cm)--(0.2cm,1.5cm) withcolor rose;

%draw (0cm,-0.2cm)--(0cm,0.2cm);
%draw (0,1.5cm)--(3cm,1.5cm)--(3cm,0) withcolor rose dashed withdots withpen pencircle scaled 1.5bp;

drawarrow (0,0)--(1cm,0) withcolor bleu_m withpen pencircle scaled 3bp;
drawarrow (0,0)--(0,1cm) withcolor bleu_f withpen pencircle scaled 3bp;
label.bot(btex $\overrightarrow{e_1}$ etex,(0.5cm,-0.2cm))withcolor bleu_m;
label.lft(btex $\overrightarrow{e_2}$ etex,(-0.2cm,0.5cm)) withcolor bleu_f dashed evenly;
drawarrow (0,0)--(3cm,1.5cm) withcolor 0.6white withpen pencircle scaled 1.5bp;
drawarrow (0,0)--(3cm,-1.5cm) withcolor 0.6white withpen pencircle scaled 1.5bp;

%label.bot(btex $a$ etex,(3cm,-0.2cm))withcolor bleu_m;
%label.lft(btex $b$ etex,(-0.2cm,1.5cm)) withcolor vert_fonce dashed evenly;
label.llft(btex $0$ etex,(-0.2cm,-0.2cm));
label.bot(btex \textbf{axe réel} etex,(5cm,-0.2cm))withcolor bleu_m withpen pencircle scaled 1.5bp;
%label.lft(btex \textbf{axe imaginaire} etex,(0cm,2.5cm))withcolor vert_fonce withpen pencircle scaled 1.5bp;
%label.ulft(btex \boldmath$\overrightarrow{u}$\unboldmath etex, (1.5cm,0.75cm))withcolor rose;

endfig;







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%  MODULE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(36);

drawarrow (-2cm,0)--(7cm,0) withcolor bleu_m withpen pencircle scaled 1.5bp;
drawarrow (0,-1.5cm)--(0,2.5cm)  withcolor bleu_f withpen pencircle scaled 1.5bp ;

label.urt(btex \boldmath $M(a+ib)$\unboldmath etex, (4cm,2cm))withcolor 0.6white dashed evenly;
dotlabel.urt(btex $ $ etex, (4cm,2cm));


draw (4cm,-0.2cm)--(4cm,0.2cm)withcolor 0.6white;
draw (-0.2cm,2cm)--(0.2cm,2cm) withcolor 0.6white;

%draw (0cm,-0.2cm)--(0cm,0.2cm);
draw (0,2cm)--(4cm,2cm)--(4cm,0) withcolor 0.6white dashed withdots withpen pencircle scaled 1.5bp;

drawarrow (0,0)--(1cm,0) withcolor bleu_m withpen pencircle scaled 3bp;
drawarrow (0,0)--(0,1cm) withcolor bleu_f withpen pencircle scaled 3bp;
label.bot(btex $\overrightarrow{e_1}$ etex,(0.5cm,-0.2cm))withcolor bleu_m;
label.lft(btex $\overrightarrow{e_2}$ etex,(-0.2cm,0.5cm)) withcolor bleu_f dashed evenly;
drawarrow (0,0)--(4cm,2cm) withcolor 0.6white withpen pencircle scaled 1.5bp;
label.bot(btex $a$ etex,(4cm,-0.2cm))withcolor bleu_m;
label.lft(btex $b$ etex,(-0.2cm,2cm)) withcolor bleu_f dashed evenly;
label.llft(btex $0$ etex,(-0.2cm,-0.2cm));
label.bot(btex \textbf{axe réel} etex,(5cm,-0.2cm))withcolor bleu_m withpen pencircle scaled 1.5bp;
label.lft(btex \textbf{axe imaginaire} etex,(0cm,2.5cm))withcolor bleu_f withpen pencircle scaled 1.5bp;
label.ulft(btex \boldmath$\sqrt{a^2+b^2}$\unboldmath etex, (2cm,0.85cm))withcolor 0.6white;

endfig;





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% COORDONNEES POLAIRES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(37);

pair b,bb;
b:=(4cm,0);
bb:=b rotated 30;

drawarrow (-2cm,0)--(7cm,0) withcolor bleu_m withpen pencircle scaled 1.5bp;
drawarrow (0,-1.5cm)--(0,2.5cm)  withcolor bleu_f withpen pencircle scaled 1.5bp ;

label.urt(btex \boldmath $M(z)$\unboldmath etex, bb)withcolor 0.6white dashed evenly;
dotlabel.urt(btex $ $ etex, bb);

pair bx,by; %projetés

bx:= bb yscaled 0;
by:= bb xscaled 0;

draw by--bb--bx withcolor 0.6white dashed withdots withpen pencircle scaled 1.5bp;

drawarrow (0,0)--(1cm,0) withcolor bleu_m withpen pencircle scaled 3bp;
drawarrow (0,0)--(0,1cm) withcolor bleu_f withpen pencircle scaled 3bp;
label.bot(btex $\overrightarrow{e_1}$ etex,(0.5cm,-0.2cm))withcolor bleu_m;
label.lft(btex $\overrightarrow{e_2}$ etex,(-0.2cm,0.5cm)) withcolor bleu_f dashed evenly;
drawarrow (0,0)--bb withcolor 0.6white withpen pencircle scaled 1.5bp;
label.bot(btex $r\,\cos\theta$ etex,bx)withcolor bleu_m;
label.lft(btex $r\,\sin\theta$ etex,by) withcolor bleu_f dashed evenly;
label.llft(btex $0$ etex,(-0.2cm,-0.2cm));
%label.bot(btex \textbf{axe réel} etex,(5cm,-0.2cm))withcolor bleu_m withpen pencircle scaled 1.5bp;
%label.lft(btex \textbf{axe imaginaire} etex,(0cm,2.5cm))withcolor vert_fonce withpen pencircle scaled 1.5bp;
label.ulft(btex \boldmath$r$\unboldmath etex, 0.5*bb)withcolor 0.6white;





%%%%%%%%%%%%%%%%%%%%%%%
%Tracé de la flèche arrondie
%%%%%%%%%%%%%%%%%%%%%%
%pair b; %axe des x
pair C; % point de départ de la flèche
pair D; % point d'arrivée de la flèche


C=1/3(origin+b);
D=C rotated 30;

drawarrow C{dir(90+angle (C))}..{dir(90+angle (D))}D;

label.rt(btex $\theta$ etex,C rotated 15);








endfig;





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    QUADRILATERES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%@AUTEUR: Claudy Diguet
numeric u;
u = 1cm;



beginfig(38);

draw (1.5,0)*u--(2,0)*u withpen pencircle scaled 1.5pt;

draw (2,7)*u--(2,-7)*u withpen pencircle scaled 1.5pt;

drawarrow (2,7)*u--(16.3,7)*u withpen pencircle scaled 1.5pt;

drawarrow (2,5)*u--(6.5,5)*u withpen pencircle scaled 1.5pt;
drawarrow (2,3)*u--(6.5,3)*u withpen pencircle scaled 1.5pt;
drawarrow (2,1)*u--(6.5,1)*u withpen pencircle scaled 1.5pt;
drawarrow (2,-5)*u--(6.5,-5)*u withpen pencircle scaled 1.5pt;
drawarrow (2,-3)*u--(6.5,-3)*u withpen pencircle scaled 1.5pt;
drawarrow (2,-1)*u--(6.5,-1)*u withpen pencircle scaled 1.5pt;

drawarrow (2,-7)*u--(16.3,-7)*u withpen pencircle scaled 1.5pt;

draw (6.5,5)*u--(6.5,-5)*u withpen pencircle scaled 1.5pt;

draw (6.5,0)*u--(7,0)*u withpen pencircle scaled 1.5pt;

draw (11,0)*u--(11.5,0)*u withpen pencircle scaled 1.5pt;

draw (11.5,5)*u--(11.5,-5)*u withpen pencircle scaled 1.5pt;

drawarrow (11.5,5)*u--(16.3,5)*u withpen pencircle scaled 1.5pt;
drawarrow (11.5,3)*u--(16.3,3)*u withpen pencircle scaled 1.5pt;

draw (16.3,7)*u--(16.3,3)*u withpen pencircle scaled 1.5pt;

draw (16.3,5)*u--(16.8,5)*u withpen pencircle scaled 1.5pt;

draw (19.2,5)*u--(20,5)*u withpen pencircle scaled 1.5pt;

draw (20,5)*u--(20,1)*u withpen pencircle scaled 1.5pt;

drawarrow (20,3)*u--(24.5,3)*u withpen pencircle scaled 1.5pt;
drawarrow (20,1)*u--(24.5,1)*u withpen pencircle scaled 1.5pt;



drawarrow (11.5,-5)*u--(16.3,-5)*u withpen pencircle scaled 1.5pt;
drawarrow (11.5,-3)*u--(16.3,-3)*u withpen pencircle scaled 1.5pt;

draw (16.3,-7)*u--(16.3,-3)*u withpen pencircle scaled 1.5pt;

draw (16.3,-5)*u--(16.8,-5)*u withpen pencircle scaled 1.5pt;

draw (19.2,-5)*u--(20,-5)*u withpen pencircle scaled 1.5pt;

draw (20,-5)*u--(20,-1)*u withpen pencircle scaled 1.5pt;

drawarrow (20,-3)*u--(24.5,-3)*u withpen pencircle scaled 1.5pt;
drawarrow (20,-1)*u--(24.5,-1)*u withpen pencircle scaled 1.5pt;


draw (24.5,3)*u--(24.5,-3)*u withpen pencircle scaled 1.5pt;

draw (24.5,0)*u--(25,0)*u withpen pencircle scaled 1.5pt;










label.top(btex $ qui~a~ses~diagonales~qui $ etex,(4.25,5)*u);
label.bot(btex $ se~coupent~en~leur~milieu $ etex,(4.25,5)*u);

label.top(btex $ qui~a~tous~ses~c\hat{o}t\acute{e}s~oppos\acute{e}s $ etex,(4.25,3)*u);
label.bot(btex $ parall\grave{e}les $ etex,(4.25,3)*u);

label.top(btex $ qui~a~tous~ses~c\hat{o}t\acute{e}s~oppos\acute{e}s $ etex,(4.25,1)*u);
label.bot(btex $ de~m\hat{e}me~longueur $ etex,(4.25,1)*u);

label.top(btex $ qui~a~\underline{deux}~c\hat{o}t\acute{e}s~parall\grave{e}les $ etex,(4.25,-1)*u);
label.bot(btex $ et~de~m\hat{e}me~longueur $ etex,(4.25,-1)*u);

label.top(btex $ qui~a~tous~ses~angles $ etex,(4.25,-3)*u);
label.bot(btex $ oppos\acute{e}s~de~m\hat{e}me~mesure $ etex,(4.25,-3)*u);

label.top(btex $ qui~a~ses~angles $ etex,(4.25,-5)*u);
label.bot(btex $ cons\acute{e}cutifs~suppl\acute{e}mentaires $ etex,(4.3,-5)*u);




label.top(btex $ qui~a~3~angles~droits $ etex,(9,7)*u);

label.top(btex $ qui~a~un~angle $ etex,(13.9,5)*u);
label.bot(btex $ droit $ etex,(13.9,5)*u);

label.top(btex $ qui~a~ses~diagonales $ etex,(13.9,3)*u);
label.bot(btex $ de~m\hat{e}me~longueur $ etex,(13.9,3)*u);




label.top(btex $ qui~a~4~c\hat{o}t\acute{e}s~de~m\hat{e}me~longueur $ etex,(9,-7)*u);


label.top(btex $ qui~a~deux~c\hat{o}t\acute{e}s~cons\acute{e}cutifs $ etex,(13.9,-3)*u);
label.bot(btex $ de~m\hat{e}me~longueur $ etex,(13.9,-3)*u);

label.top(btex $ qui~a~ses~diagonales $ etex,(13.9,-5)*u);
label.bot(btex $ perpendiculaires $ etex,(13.9,-5)*u);





label.top(btex $ qui~a~deux~c\hat{o}t\acute{e}s~cons\acute{e}cutifs $ etex,(22.25,3)*u);
label.bot(btex $ de~m\hat{e}me~longueur $ etex,(22.25,3)*u);

label.top(btex $ qui~a~ses~diagonales $ etex,(22.25,1)*u);
label.bot(btex $ perpendiculaires $ etex,(22.25,1)*u);


label.top(btex $ qui~a~un~angle $ etex,(22.25,-3)*u);
label.bot(btex $ droit $ etex,(22.25,-3)*u);

label.top(btex $ qui~a~ses~diagonales $ etex,(22.25,-1)*u);
label.bot(btex $ de~m\hat{e}me~longueur $ etex,(22.25,-1)*u);



label(btex $ Quadrilat\grave{e}re $ etex,(0,0)*u);
draw (1.5,-1)*u--(1.5,1)*u withpen pencircle scaled 1.5pt;
draw (-1.5,1.5)*u--(1.5,1)*u withpen pencircle scaled 1.5pt;
draw (-1.5,1.5)*u--(-2,-2)*u withpen pencircle scaled 1.5pt;
draw (-2,-2)*u--(1.5,-1)*u withpen pencircle scaled 1.5pt;




label(btex $ Parall\acute{e}logramme $ etex,(9,0)*u);
draw (7.25,0.7)*u--(11.25,0.7)*u withpen pencircle scaled 1.5pt;
draw (6.75,-0.7)*u--(10.75,-0.7)*u withpen pencircle scaled 1.5pt;
draw (6.75,-0.7)*u--(7.25,0.7)*u withpen pencircle scaled 1.5pt;
draw (11.25,0.7)*u--(10.75,-0.7)*u withpen pencircle scaled 1.5pt;




label(btex $ Rectangle $ etex,(18,5)*u);
draw (16.8,5.7)*u--(19.2,5.7)*u--(19.2,4.3)*u--(16.8,4.3)*u--cycle withpen pencircle scaled 1.5pt;



label(btex $ Losange $ etex,(18,-5)*u);
draw (16.8,-5)*u--(18,-6)*u--(19.2,-5)*u--(18,-4)*u--cycle withpen pencircle scaled 1.5pt;



label(btex $ Carr\acute{e} $ etex,(26.5,0)*u);
draw (25,1.5)*u--(28,1.5)*u--(28,-1.5)*u--(25,-1.5)*u--cycle withpen pencircle scaled 1.5pt;






endfig;






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% MULTIPLICATION PAR i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


beginfig(39);

drawarrow (-5cm,0)--(5cm,0);
drawarrow(0,-4cm)--(0,4cm);
drawarrow(0,0)--(3cm,2cm) withpen pencircle scaled 2bp;
drawarrow(0,0)--(0,1cm);
drawarrow(0,0)--(1cm,0);
drawarrow(0,0)--(-3cm,-2cm) withpen pencircle scaled 2bp dashed evenly  withcolor bleu_m;
drawarrow(0,0)--(-2cm,3cm) withpen pencircle scaled 2bp dashed withdots scaled 0.5 withcolor red;

%
%
%label.rt(btex Imaginaires etex,(0,4cm));
%label.top(btex Réels etex,(5cm,0cm));
label.llft(btex 0 etex,(0,-0.2cm));
label.urt(btex $M(3\ ,\ 2)$ etex,(3cm,2cm));
label.bot(btex $\overrightarrow{e_1}$ etex,(0.5cm,0));
label.ulft(btex $\overrightarrow{e_2}$ etex,(0,0.7cm));
label.llft(btex $M'(-3\ ,\ -2)$ etex,(-3cm,-2cm));
label.top(btex $M''(-2\ ,\ 3)$ etex,(-2cm,3cm));
draw fullcircle scaled 7.212cm dashed withdots;
mark_rt_angle((3,2),(0,0),(-2,3))



endfig;









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ROTATIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(40)

pair b,bb,bbb;
b=(7cm,0);bb=b rotated 15;bbb=bb rotated 30; 

drawarrow(0,0)--(4cm,0)withpen pencircle scaled 1.3bp;
drawarrow(0,0)--bb;
drawarrow(0,0)--bbb withcolor bleu_m;

label.rt(btex $M$ etex,bb);
label.ulft(btex $M'$ etex, bbb) withcolor bleu_m;
label.ulft(btex $C$ etex, origin);
label.bot(btex $\overrightarrow{u}$ etex, (2cm,0));


%%%%%%%%%%%%%%%%%%%%%%%
%Tracé arc de cercle
%%%%%%%%%%%%%%%%%%%%%%25
%pair bb; % point de départ 
%pair bbb; % point d'arrivée 


draw bb{dir(90+angle (bb))}..{dir(90+angle (bbb))}bbb dashed evenly withcolor bleu_m ;


%%%%%%%%%%%%%%%%%%%%%%%
%Tracé de la flèche arrondie
%%%%%%%%%%%%%%%%%%%%%%
pair C; % point de départ de la flèche
pair D; % point d'arrivée de la flèche

C=1/3(origin+bb);
D=C rotated 30;

drawarrow C{dir(90+angle (C))}..{dir(90+angle (D))}D withcolor bleu_m;

label.urt(btex $\alpha$ etex,C rotated 15) withcolor bleu_m;


pair CC; % point de départ de la flèche
pair DD; % point d'arrivée de la flèche

CC=1/4(origin+b);
DD=CC rotated 15;

drawarrow CC{dir(90+angle (CC))}..{dir(90+angle (DD))}DD;

label.urt(btex $\theta$ etex,CC rotated 7);


endfig;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        T V I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=4cm;
  uy:=4cm;
  xmin := -.5; xmax := 1.15;
  ymin := -.15; ymax := 1.15;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax) ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(41);

axes; label.llft(btex $0$ etex,(-.02*ux,-.02*uy));


draw(0,0)--(1.2*ux,1.2*uy) withcolor 0.55*white;

draw(0,uy)--(ux,uy)--(ux,0) withcolor 0.45*white;

draw(0,0.4*uy)..(0.3*ux,0.5*uy)..(0.6*ux,0.1*uy)..(ux,0.3*uy) withpen pencircle scaled 1.5bp withcolor bleu_m;

draw(0,0.4*uy) withpen pencircle scaled 6bp;
draw(ux,0.3*uy) withpen pencircle scaled 6bp;


label.bot(btex $1$ etex,(ux,0) shifted b); %label.bot(btex $-1$ etex,(-ux,0) shifted b);

label.ulft(btex $1$ etex,(0,uy) shifted h+.5g);

label.ulft(btex $y=x$ etex,(1.15*ux,1.15*uy)) withcolor 0.55*white; 



endfig;

















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%  P A T A T E S 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




beginfig(42);


  x = 0.5000000cm; y = -.5000000cm;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
  path p;
  p = (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle;
  fill p withcolor bleu_ciel;%(1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
  path p;
  p = (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle;
  fill p withcolor bleu_ciel;%(1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 14.200876% center->y = 25.647498% width = 33.300684% height = 33.300684% angle1 = 51.668255% angle2 = 97.769316% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.527647x,12.586423y)..(18.589187x,9.585848y)..(11.950000x,9.150000y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.814482x,12.827981y)--(24.270996x,12.697127y)--(24.527647x,12.586423y)--(24.593074x,12.314680y)--cycle;
  fill p withcolor bleu
    withpen pencircle scaled 0.1000x;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.814482x,12.827981y)--(24.270996x,12.697127y)--(24.527647x,12.586423y)--(24.593074x,12.314680y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 26.953504% center->y = -7.413825% width = 47.582265% height = 47.582265% angle1 = 230.903064% angle2 = 263.027989% set_line_color 0.000000, 0.000000, 0.000000
  draw (11.950000x,11.050000y)..(17.644393x,14.480430y)..(24.065630x,16.201385y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 24.653780% center->y = -2.780425% width = 43.473579% height = 43.473579% angle1 = 234.883850% angle2 = 268.443102% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,15.000000y)..(17.815438x,17.852682y)..(24.063199x,18.948341y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 10.241431% center->y = -5.396278% width = 46.947990% height = 46.947990% angle1 = 274.663619% angle2 = 306.997863% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,18.000000y)..(18.588983x,16.543340y)..(24.367735x,13.351415y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{X} etex ,(25.050000x,13.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{X} etex ,(25.050000x,16.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{X} etex ,(25.100000x,19.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.000000x,9.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,11.150000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.150000x,15.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,18.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{D\'EPART} etex   scaled 2 ,(9.750000x,21.250000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{ARRIV\'EE} etex    scaled 2,(23.850000x,21.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(24.850000x,9.400000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(24.950000x,7.650000y));
endfig;





beginfig(43)


  x = .5000000cm; y = -.5000000cm;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
  path p;
  p = (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle;
  fill p withcolor bleu_ciel;% (1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
  path p;
  p = (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle;
  fill p withcolor bleu_ciel;%(1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 14.200876% center->y = 25.647498% width = 33.300684% height = 33.300684% angle1 = 51.668255% angle2 = 97.769316% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.527647x,12.586423y)..(18.589187x,9.585848y)..(11.950000x,9.150000y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.814482x,12.827981y)--(24.270996x,12.697127y)--(24.527647x,12.586423y)--(24.593074x,12.314680y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.814482x,12.827981y)--(24.270996x,12.697127y)--(24.527647x,12.586423y)--(24.593074x,12.314680y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 26.953504% center->y = -7.413825% width = 47.582265% height = 47.582265% angle1 = 230.903064% angle2 = 263.027989% set_line_color 0.000000, 0.000000, 0.000000
  draw (11.950000x,11.050000y)..(17.644393x,14.480430y)..(24.065630x,16.201385y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 24.653780% center->y = -2.780425% width = 43.473579% height = 43.473579% angle1 = 234.883850% angle2 = 268.443102% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,15.000000y)..(17.815438x,17.852682y)..(24.063199x,18.948341y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 10.241431% center->y = -5.396278% width = 46.947990% height = 46.947990% angle1 = 274.663619% angle2 = 306.997863% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,18.000000y)..(18.588983x,16.543340y)..(24.367735x,13.351415y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{X}etex ,(25.050000x,13.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.050000x,16.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.100000x,19.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.000000x,9.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,11.150000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.150000x,15.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,18.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{ D\'EPART} etex    scaled 2 ,(9.750000x,21.250000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{ ARRIV\'EE} etex    scaled 2,(23.850000x,21.350000y));
endfig;












beginfig(44);

  x = .5000000cm; y = -.5000000cm;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
  path p;
  p = (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle;
  fill p withcolor bleu_ciel;%(1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
  path p;
  p = (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle;
  fill p withcolor bleu_ciel;%(1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 17.864070% center->y = 22.677709% width = 29.527961% height = 29.527961% angle1 = 64.726803% angle2 = 113.614082% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.167329x,9.326901y)..(18.077823x,7.915275y)..(11.950000x,9.150000y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.500629x,9.498761y)--(23.941655x,9.491815y)--(24.167329x,9.326901y)--(24.170802x,9.047414y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.500629x,9.498761y)--(23.941655x,9.491815y)--(24.167329x,9.326901y)--(24.170802x,9.047414y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 26.953504% center->y = -7.413825% width = 47.582265% height = 47.582265% angle1 = 230.903064% angle2 = 263.027989% set_line_color 0.000000, 0.000000, 0.000000
  draw (11.950000x,11.050000y)..(17.644393x,14.480430y)..(24.065630x,16.201385y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 24.653780% center->y = -2.780425% width = 43.473579% height = 43.473579% angle1 = 234.883850% angle2 = 268.443102% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,15.000000y)..(17.815438x,17.852682y)..(24.063199x,18.948341y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 10.241431% center->y = -5.396278% width = 46.947990% height = 46.947990% angle1 = 274.663619% angle2 = 306.997863% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,18.000000y)..(18.588983x,16.543340y)..(24.367735x,13.351415y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.050000x,13.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.050000x,16.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.100000x,19.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.000000x,9.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,11.150000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.150000x,15.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,18.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{ D\'EPART} etex    scaled 2 ,(9.750000x,21.250000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{ ARRIV\'EE} etex   scaled 2,(23.850000x,21.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(24.850000x,9.400000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(24.950000x,7.750000y));
endfig;











beginfig(45);

  x = .5000000cm; y = -.5000000cm;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
  path p;
  p = (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle;
  fill p withcolor bleu_ciel;%(1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (14.350000x,13.050000y)..(11.100000x,20.000000y)..(7.850000x,13.050000y)..(11.100000x,6.100000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
  path p;
  p = (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle;
  fill p withcolor bleu_ciel;%(1.000000,1.000000,1.000000);
% set_linewidth 0.100000
% set_line_color 0.000000, 0.000000, 0.000000
  draw (28.350000x,13.050000y)..(25.100000x,20.100000y)..(21.850000x,13.050000y)..(25.100000x,6.000000y)..cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 17.864070% center->y = 22.677709% width = 29.527961% height = 29.527961% angle1 = 64.726803% angle2 = 113.614082% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.167329x,9.326901y)..(18.077823x,7.915275y)..(11.950000x,9.150000y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.500629x,9.498761y)--(23.941655x,9.491815y)--(24.167329x,9.326901y)--(24.170802x,9.047414y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.500629x,9.498761y)--(23.941655x,9.491815y)--(24.167329x,9.326901y)--(24.170802x,9.047414y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 26.953504% center->y = -7.413825% width = 47.582265% height = 47.582265% angle1 = 230.903064% angle2 = 263.027989% set_line_color 0.000000, 0.000000, 0.000000
  draw (11.950000x,11.050000y)..(17.644393x,14.480430y)..(24.065630x,16.201385y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438756x,16.238835y)--(23.916289x,16.437652y)--(24.065630x,16.201385y)--(23.966221x,15.940152y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 24.653780% center->y = -2.780425% width = 43.473579% height = 43.473579% angle1 = 234.883850% angle2 = 268.443102% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,15.000000y)..(17.815438x,17.852682y)..(24.063199x,18.948341y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.438197x,18.949619y)--(23.937348x,19.197913y)--(24.063199x,18.948341y)--(23.939052x,18.697916y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 10.241431% center->y = -5.396278% width = 46.947990% height = 46.947990% angle1 = 274.663619% angle2 = 306.997863% set_line_color 0.000000, 0.000000, 0.000000
  draw (12.150000x,18.000000y)..(18.588983x,16.543340y)..(24.367735x,13.351415y)
    withpen pencircle scaled 0.2000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.662206x,13.119226y)--(24.424371x,13.625126y)--(24.367735x,13.351415y)--(24.114785x,13.232498y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.050000x,13.000000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.050000x,16.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(25.100000x,19.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.000000x,9.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,11.150000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.150000x,15.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(11.050000x,18.200000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{ D\'EPART} etex   scaled 2 ,(9.750000x,21.250000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{ ARRIV\'EE} etex   scaled 2 ,(23.850000x,21.350000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  \textbf{X} etex ,(24.850000x,9.400000y));
endfig;





beginfig(46);


 x = .5000000cm; y = -.5000000cm;

% set_line_color 0.000000, 0.000000, 0.000000
% set_line_color 1.000000, 1.000000, 1.000000
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{\textit{x}} etex scaled 2.67988,(8.550000x,15.100000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{\textit{y}} etex scaled 2.67988,(25.400000x,15.100000y));
% set_linewidth 0.100000
%metapost_arc
% center->x = 17.577207% center->y = 23.947740% width = 24.097172% height = 24.097172% angle1 = 53.638661% angle2 = 128.359080% set_line_color 0.000000, 0.000000, 0.000000
  draw (24.720520x,14.245086y)..(17.367168x,11.900985y)..(10.100000x,14.500000y)
    withpen pencircle scaled 0.3000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (25.012845x,14.479971y)--(24.466488x,14.361675y)--(24.720520x,14.245086y)--(24.779668x,13.971908y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (25.012845x,14.479971y)--(24.466488x,14.361675y)--(24.720520x,14.245086y)--(24.779668x,13.971908y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu;
% set_linewidth 0.100000
%metapost_arc
% center->x = 17.591311% center->y = 5.673607% width = 24.752792% height = 24.752792% angle1 = 235.258220% angle2 = 307.060239% set_line_color 0.000000, 0.000000, 0.000000
  draw (10.538264x,15.843647y)..(17.841698x,18.047470y)..(25.050000x,15.550000y)
    withpen pencircle scaled 0.3000x withcolor bleu_f;
% set_line_color 0.000000, 0.000000, 0.000000
% fill_polygon
  path p;
  p = (10.239172x,15.617441y)--(10.788765x,15.719654y)--(10.538264x,15.843647y)--(10.487158x,16.118443y)--cycle;
  fill p 
    withpen pencircle scaled 0.1000x withcolor bleu_f;
% set_line_color 0.000000, 0.000000, 0.000000
  draw (10.239172x,15.617441y)--(10.788765x,15.719654y)--(10.538264x,15.843647y)--(10.487158x,16.118443y)--cycle
    withpen pencircle scaled 0.1000x withcolor bleu_f;
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex \textbf{\textit{f}} etex scaled 2.67988,(17.050000x,11.050000y));
% set_line_color 0.000000, 0.000000, 0.000000
  label.urt(btex  $f^{-1}$ etex scaled 2.67988,(17.000000x,21.050000y));
endfig;
















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%    R E C I P R O Q U E 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


beginfig(47);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  G R A P H I  Q U E   f-1   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))  ; % axe des y
   %label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   %label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=0.8cm; uy:=ux;
  xmin:=-3.5; xmax:=4.5;
  ymin:=xmin; ymax:=xmax;
  coefficient:=1; % coefficient d'échelle

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions de la fonction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef f(expr x) :=-2.5/x enddef;

  vardef trace (suffix F)(expr a,b,inc) :=
    save i; numeric i;
    for i:=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tracé des différentes courbes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  numeric pas, seuil, seuilbis, abscisse;
  pas:=0.009;
  seuil:=3.75;
  seuilbis:=1.25;
  abscisse:=seuil-0.5;

  xA:=abscisse;
  yA:=f(abscisse);
  xB:=f(abscisse);
  yB:=abscisse;
  xD:=xmin/2;
  yD:=xD;
  xE:=0.75*seuil;
  yE:=xE;

  pair A, B, C, D, E, Ax, Ay, Bx, By;
  A:=(xA*ux,yA*uy);
  B:=(xB*ux,yB*uy);
  D:=(xD*ux,yD*uy);
  E:=(xE*ux,yE*uy);
  Ax:=A yscaled 0;
  Ay:=A xscaled 0;
  Bx:=B yscaled 0;
  By:=B xscaled 0;

  C=whatever[A,B]=whatever[D,E];

  draw trace(F,f(seuilbis),f(seuil),pas); % tracé de la courbe de f
  draw trace(F,seuilbis,seuil,pas); % tracé de la courbe de f

%  segment((seuilbis*ux,0), -90, (seuil*ux,0), 90, (0,0), 1.4bp, 0.2);
%  segment((0,f(seuilbis)*uy), 0, (0,f(seuil)*uy), 180, (0,0), 1bp, 0.2);
% label.top(btex $D$ etex, 2/3[(seuilbis*ux,0),(seuil*ux,0)]);
%  label.lft(btex $D'$ etex, 1/2[(0,f(seuilbis)*uy),(0,f(seuil)*uy)]);

%  segment((f(seuilbis)*ux,0), -90, (f(seuil)*ux,0), 90, (0,0), 1.4bp, 0.2);
%  segment((0,seuilbis*uy), 0, (0,seuil*uy), 180, (0,0), 1bp, 0.2);
%  label.bot(btex $D'$ etex, 1/2[(f(seuilbis)*ux,0),(f(seuil)*ux,0)]);
%  label.rt(btex $D$ etex, 2/3[(0,seuilbis*uy),(0,seuil*uy)]);

%  draw ((seuilbis*ux,f(seuilbis)*uy)--(seuilbis*ux,0)) dashed evenly;
%  draw ((seuil*ux,f(seuil)*uy)--(seuil*ux,0)) dashed evenly;
%  draw ((seuilbis*ux,f(seuilbis)*uy)--(0,f(seuilbis)*uy)) dashed evenly;
%  draw ((seuil*ux,f(seuil)*uy)--(0,f(seuil)*uy)) dashed evenly;

%  draw ((f(seuilbis)*ux,seuilbis*uy)--(f(seuilbis)*ux,0)) dashed evenly;
%  draw ((f(seuil)*ux,seuil*uy)--(f(seuil)*ux,0)) dashed evenly;
%  draw ((f(seuilbis)*ux,seuilbis*uy)--(0,seuilbis*uy)) dashed evenly;
%  draw ((f(seuil)*ux,seuil*uy)--(0,seuil*uy)) dashed evenly;

   draw  (A--Ax) dashed evenly withcolor bleu;
   draw ((0,0)--Ax) withpen pencircle scaled 2bp withcolor bleu;
   draw (A--Ay) dashed evenly withcolor bleu_f;
   draw ((0,0)--Ay) withpen pencircle scaled 2bp withcolor bleu_f;

   draw  (B--Bx) dashed evenly withcolor bleu_f;
   draw ((0,0)--Bx) withpen pencircle scaled 2bp withcolor bleu_f;
   draw (B--By) dashed evenly withcolor bleu;
   draw ((0,0)--By) withpen pencircle scaled 2bp withcolor bleu;


  draw (D--E) withcolor 0.55white dashed withdots withpen pencircle scaled 2.5bp;
  draw (A--B) withpen pencircle scaled 1bp;
  label(btex $\Vert$ etex, 2/3[A,C]);
  label(btex $\Vert$ etex, 2/3[B,C]);
  label.lrt(btex $\Gamma_f$ etex, (seuilbis*ux,f(seuilbis)*uy));
  label.ulft(btex $\Gamma_{f^{-1}}$ etex, (f(seuilbis)*ux,seuilbis*uy));
  draw (((1,0)--(1,1)--(0,1)) zscaled (5*unitvector(E-D)) shifted C);
  dotlabel.lrt(btex $(x,y)$ etex, A);
  dotlabel.ulft(btex $(y,x)$ etex, B);
label.top(btex $x$ etex, Ax);
label.llft(btex $y$ etex, Ay);
label.urt(btex $x$ etex, By);
label.ulft(btex $y$ etex, Bx);

  label.urt(btex $y=x$ etex, E) withcolor 0.55white;

endfig;





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  pas monotone
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(48);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=0.45cm; uy:=ux;
  xmin:=-1; xmax:=9;
  ymin:=xmin; ymax:=9;
  coefficient:=1; % coefficient d'échelle

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
  axes;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions de la fonction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  numeric h, debut, fin;
  h:=1.5;

  xA:=1*h; yA:=2*h;
  xE:=2.875*h; yE:=5*h;
  xD:=4.125*h; yD:=yE;
  xB:=3.5*h; yB:=5.25*h;
  xC:=4.5*h; yC:=4.75*h;

  pair A, D, E, B, C;
  A:=(xA*ux,yA*uy);
  D:=(xD*ux,yD*uy);
  E:=(xE*ux,yE*uy);
  B:=(xB*ux,yB*uy);
  C:=(xC*ux,yC*uy);
  
  draw (A .. E .. B .. D .. C) withpen pencircle scaled 1.3bp withcolor bleu_f;

  draw D withpen pencircle scaled 3bp withcolor 0.6white;
  draw E withpen pencircle scaled 3bp withcolor 0.6white;
  draw ((xD*ux,0)--D--(0,yD*uy)) dashed evenly withcolor 0.6white;
  draw (E--(xE*ux,0)) dashed evenly withcolor 0.6white;

  %dotlabel.llft(btex $A$ etex,A);
  label.bot(btex $x_2$ etex,(xD*ux,0));
  label.bot(btex $x_1$ etex,(xE*ux,0));
  label.lft(btex $y_0$ etex,(0,yE*uy));
  label.rt(btex $y=f(x)$ etex,C) withcolor bleu_f;

endfig;












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  R E C I      D es   T A N G E N T E S 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


beginfig(49);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=0.8cm; uy:=0.9ux;
  xmin:=-3.5; xmax:=4.5;
  ymin:=xmin; ymax:=xmax;
  coefficient:=1; % coefficient d'échelle
  % k:=-2.5; % intervient dans la fonction homothétique de x--> 1/x

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;

label(btex $y=x$ etex,(3.3*ux,3.3*uy));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions de la fonction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef f(expr x) :=(-2.5)/x enddef;

  vardef trace (suffix F)(expr a,b,inc) :=
    save i; numeric i;
    for i:=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tracé des différentes courbes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  numeric pas, seuil, seuilbis, abscisse;
  pas:=0.009;
  seuil:=3.75;
  seuilbis:=0.75;
  abscisse:=seuilbis+1.5;

  xA:=abscisse;
  yA:=f(abscisse);
  xB:=f(abscisse);
  yB:=abscisse;
  xD:=xmin/2;
  yD:=xD;
  xE:=0.75*seuil;
  yE:=xE;
  xG:=seuilbis-0.25;
  yG:=2.5*(xG-xA)/(xA*xA)+yA;
  xH:=seuil-0.25;
  yH:=2.5*(xH-xA)/(xA*xA)+yA;
  xG':=yG;
  yG':=xG;
  xH':=yH;
  yH':=xH;
  
  pair A, B, C, D, E, G, H, G', H';
  A:=(xA*ux,yA*uy);
  B:=(xB*ux,yB*uy);
  D:=(xD*ux,yD*uy);
  E:=(xE*ux,yE*uy);
  G:=(xG*ux,yG*uy);
  H:=(xH*ux,yH*uy);
  G':=(xG'*ux,yG'*uy);
  H':=(xH'*ux,yH'*uy);

  C=whatever[A,B]=whatever[D,E];

  draw trace(F,f(seuilbis),f(seuil),pas) withpen pencircle scaled 1.3bp withcolor 0.55white; % tracé de la courbe de f
  draw trace(F,seuilbis,seuil,pas) withpen pencircle scaled 1.3bp withcolor bleu_m; % tracé de la courbe de f

  draw ((0,yA*uy)--A--(xA*ux,0)) dashed evenly withcolor bleu_f;
  draw ((0,yB*uy)--B--(xB*ux,0)) dashed evenly withcolor bleu_f;
  
  draw D--E  withcolor bleu_f dashed withdots withpen pencircle scaled 2.5bp;
  draw G--H withcolor bleu_m;
  draw G'--H' withcolor 0.55white;
  draw A--B withpen pencircle scaled 1bp;
  label(btex $\Vert$ etex, 1/2[A,C]) withcolor bleu_f;
  label(btex $\Vert$ etex, 1/2[B,C]) withcolor bleu_f;
  label.lrt(btex $\Gamma_f$ etex, (seuil*ux,f(seuil)*uy));
  label.llft(btex $\Gamma_{f^{-1}}$ etex, (f(seuil)*ux,seuil*uy));
  label.urt(btex $\mathcal{T}$ etex, H);
  label.urt(btex $\mathcal{T'}$ etex, H');
  draw (((1,0)--(1,1)--(0,1)) zscaled (5*unitvector(D-E)) shifted C);
  dotlabel.top(btex $x_0$ etex, (xA*ux,0));
  dotlabel.lft(btex $y_0$ etex, (0,yA*uy));
  dotlabel.bot(btex $y_0$ etex, (xB*ux,0));
  dotlabel.rt(btex $x_0$ etex, (0,yB*uy));

endfig;










%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%  F o n c t i o n      p u i s s a n c e     p a i r e
%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(50);

 vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))  ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



 label.llft(btex $0$ etex,(-.1*ux,-.15*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=1cm; uy:=0.5*ux;
  xmin:=-4.5; xmax:=4.5;
  ymin:=-0.5; ymax:=8;
  coefficient:=1; % coefficient d'échelle

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;

vardef f(expr x) =0.3*x*x enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  
  draw (trace(g,-4.5,0,.10)) dashed evenly withcolor bleu_m;
draw (trace(g,0,4.5,.10))  withcolor bleu_m;

endfig;





beginfig(51);

 vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))  ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



 label.llft(btex $0$ etex,(-.1*ux,-.15*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=1cm; uy:=0.5ux;
  xmin:=-.5; xmax:=9;
  ymin:=-0.5; ymax:=9;
  coefficient:=1; % coefficient d'échelle

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;

vardef f(expr x) =0.3*x*x enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  
%  draw (trace(g,-4.5,0,.10)) dashed evenly withcolor bleu_m;
draw (trace(g,0,5,.10))  withcolor bleu_m withpen pencircle scaled 2bp;



vardef f(expr x) =sqrt(x/0.3)enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  
  %draw (trace(g,-4.5,0,.10)) dashed evenly withcolor bleu_m;
draw (trace(g,0,8,.10))  withcolor vert_e withpen pencircle scaled 2bp;

draw ((0,0)--(8*ux,8*uy)) dashed evenly withcolor 0.5*bleu withpen pencircle scaled 2bp;

label.urt(btex $y=x^{2n}$ etex scaled 1.5, (5*ux,0.3*25*uy)) withcolor bleu_m;
label.urt(btex $y=\sqrt[2n]{x}$ etex scaled 1.5, (8*ux,f(8)*uy)) withcolor vert_e;


endfig;













%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Puissances IMPAIRES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




beginfig(52);

 vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))  ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



 label.llft(btex $0$ etex,(-.1*ux,-.15*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=1cm; uy:=0.5ux;
  xmin:=-4.5; xmax:=4.5;
  ymin:=-9; ymax:=9;
  coefficient:=1; % coefficient d'échelle

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;

vardef f(expr x) =0.3*x*x*x enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  
%  draw (trace(g,-4.5,0,.10)) dashed evenly withcolor bleu_m;
draw (trace(g,-3,3,.10))  withcolor bleu_m withpen pencircle scaled 2bp;


vardef f(expr x) =(x/0.3)**0.333 enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;
  
  %draw (trace(g,-4.5,0,.10)) dashed evenly withcolor bleu_m;
draw (trace(g,0.01,4.5,.10))  withcolor vert_e withpen pencircle scaled 2bp;
draw( (trace(g,0.01,4.5,.10))scaled -1)  withcolor vert_e withpen pencircle scaled 2bp;

draw ((-4*ux,-4*uy)--(4*ux,4*uy)) dashed evenly withcolor 0.5*bleu withpen pencircle scaled 2bp;

label.urt(btex $y=x^{2n+1}$ etex scaled 1.5, (3*ux,0.3*27*uy)) withcolor bleu_m;
label.urt(btex $y=\sqrt[2n+1]{x}$ etex scaled 1.5, (4.5*ux,f(4.5)*uy)) withcolor vert_e;


endfig;









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%%          A R C S I N                   A R C C O S                                               A R C T A N 
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


















vardef sin(expr x) =
        sind(x/Pi*180)
enddef;

vardef cos(expr x) =
        cosd(x/Pi*180)
enddef;

vardef tan(expr x) =
        sin(x)/cos(x)
enddef;

beginfig(53); 

pair O,A[],B[],P,Q,M[],T[],X[],Y[]; 
path p[], axex,axey, droite;
 picture figure;
 numeric u,rayon,pi; 
u=3cm;
rayon=1.5u;
pi=3.1419;
 O=(0,0); A1 = (-1.1*pi*u/2,0); A2 =(1.1*pi*u/2,0); 
axex = A1--A2; 
drawarrow axex withpen pencircle scaled 1.2bp; 
label.urt(btex $x$ etex, A2);
 B1 = (0,-2u); B2 =(0,2u);
 axey = B1--B2; 
drawarrow axey withpen pencircle scaled 1.2bp;
 label.ulft(btex $y$ etex, B2);
p6 = (-pi*u/2,u*sind(-90))%{dir(cosd(i))}
for i=-89 upto 90: ..(i*pi*u/180,u*sind(i)){dir(cosd(i))} endfor;
draw p6  withpen pencircle scaled 2bp withcolor vert_e; 
droite=(-pi*u/2,-pi*u/2)--(pi*u/2,pi*u/2);
 draw droite withcolor red dashed withdots withpen pencircle scaled 2bp; 
p7 = p6reflectedabout ((-pi*u/2,-pi*u/2),(pi*u/2,pi*u/2));
 draw p7 withcolor bleu_m   withpen pencircle scaled 3bp;

%graduation de l'axe y
dotlabel.ulft(btex  $0$ etex ,(0,0));
 dotlabel.lft(btex $1$ etex,(0,1u));
 dotlabel.ulft(btex $\dfrac{\pi}{2}$ etex ,(0,pi*u/2));
dotlabel.lft(btex $-1$ etex ,(0,-1u)); 
dotlabel.llft(btex$-\dfrac{\pi}{2}$ etex ,(0,-pi*u/2));

%graduation de l'axe x

dotlabel.bot(btex  $0$ etex ,(0,0));
 dotlabel.lrt(btex $1$ etex,(1u,0)); 
dotlabel.bot(btex $\dfrac{\pi}{2}$ etex ,(pi*u/2,0));
dotlabel.llft(btex $-1$ etex ,(-1u,0));
 dotlabel.bot(btex $-\dfrac{\pi}{2}$ etex ,(-pi*u/2,0));

P = ((2.5*pi/6)*u, sind((2.5*180)/6)*u); 
label.bot(btex $\sin x$etex, P); 
Q = P reflectedabout ((0,0),(pi*u,pi*u)); 
label.lft(btex$\arcsin x$ etex, Q);
 

draw (-u, -pi*u/2)--(u,-pi*u/2)--(u,pi*u/2)--(-u,pi*u/2)--cycle withcolor bleu;

endfig;






beginfig(54); pair O,A[],B[],P,Q,M[],T[],X[],Y[]; path p[], axex,
axey, droite; picture figure; numeric u,rayon,pi; u=3cm;
rayon=1.5u;pi=3.1419; O=(0,0); label.llft(btex $O$ etex, O); A1 =
(-1.1u,0); A2 = (1.1*pi*u,0); axex = A1--A2; drawarrow axex withpen
pencircle scaled 1.2bp; label.urt(btex $x$ etex, A2); B1 =
(0,-1.2u); B2 = (0,1.1*pi*u); axey = B1--B2; drawarrow axey withpen
pencircle scaled 1.2bp; label.ulft(btex $y$ etex, B2); p6 =
(0*u,cosd(0)*u){dir(-sind(0))} for i=1 upto 180:
..(i*(pi/180)*u,u*cosd(i)){dir(-sind(i))} endfor; 

draw p6  withpen pencircle scaled 2bp withcolor vert_e; 
droite =(0,0)--(pi*u,pi*u);
 draw droite withcolor red dashed withdots withpen pencircle scaled 2bp;
 p7= p6 reflectedabout ((0,0),(pi*u,pi*u)); 
draw p7 withcolor bleu_m   withpen pencircle scaled 3bp ;


%Graduation axe y
dotlabel.lft(btex $-1$ etex ,(0,-1u)); dotlabel.lft(btex $-0,5$ etex
,(0,-.5u)); dotlabel.ulft(btex  $0$ etex ,(0,0)); dotlabel.lft(btex
$0,5$ etex ,(0,0.5u)); dotlabel.lft(btex $1$ etex ,(0,1u));
dotlabel.urt(btex $\dfrac{\pi}{2}$ etex ,(0,pi*u/2));
dotlabel.ulft(btex $\pi$ etex ,(0,pi*u));

%Graduation axe x
dotlabel.bot(btex  $-1$ etex, (-1u,0)); dotlabel.bot(btex  $1$
etex, (1u,0)); dotlabel.bot(btex $\dfrac{\pi}{2}$ etex, (pi*u/2,0));
dotlabel.bot(btex $\pi$ etex, (pi*u,0));


P = ((2.5*pi/6)*u, cosd((2.5*180)/6)*u); label.urt(btex $\cos x$
etex, P); Q = P reflectedabout ((0,0),(pi*u,pi*u)); label.urt(btex
$\arccos x$ etex, Q);

draw (-u, 0)--(-u,pi*u)--(u,pi*u)--(u,0) withcolor bleu;

endfig;










beginfig(55); pair O,A[],B[],P,Q,M[],T[],X[],Y[]; path p[], axex,
axey, droite; picture figure; numeric u,rayon,pi; u=2cm;
rayon=1.5u;pi=3.1419; O=(0,0); label.llft(btex $O$ etex, O); A1 =
(-1.1*pi*u,0); A2 = (1.1*pi*u,0); axex = A1--A2; drawarrow axex
withpen pencircle scaled 1.2bp; draw axex shifted (0,pi*u/2)withcolor bleu; draw
axex shifted (0,-pi*u/2)withcolor bleu; label.urt(btex $x$ etex, A2); B1 =
(0,-1.1*pi*u); B2 = (0,1.1*pi*u); axey = B1--B2; drawarrow axey
withpen pencircle scaled 1.2bp; draw axey shifted (pi*u/2,0) withcolor bleu; draw
axey shifted (-pi*u/2,0)withcolor bleu;

label.ulft(btex $y$ etex, B2);
p6 = (-75*(pi/180)*u,(sind(-75)/cosd(-75))*u)%{dir(-sind(-89))}
for i=-74 upto 75:
..(i*(pi/180)*u,(sind(i)/cosd(i))*u)%{dir(-sind(i))}
endfor; 

draw p6  withpen pencircle scaled 2bp withcolor vert_e; 
droite=(-pi*u,-pi*u)--(pi*u,pi*u); 
draw droite withcolor red dashed withdots withpen pencircle scaled 2bp;
 p7= p6 reflectedabout((-pi*u,-pi*u),(pi*u,pi*u));  
draw p7 withcolor bleu_m   withpen pencircle scaled 3bp ;


%Graduation axe y
dotlabel.llft(btex $-\pi$ etex ,(0,-pi*u)); dotlabel.lft(btex $-3$
etex ,(0,-3u)); dotlabel.llft(btex $-2$ etex ,(0,-2u));
dotlabel.lft(btex $-1$ etex ,(0,-1u)); dotlabel.llft(btex
$-\dfrac{\pi}{2}$ etex ,(0,-pi*u/2)); dotlabel.lft(btex $-0,5$ etex
,(0,-.5u)); dotlabel.ulft(btex  $0$ etex ,(0,0)); dotlabel.lft(btex
$1$ etex ,(0,1u)); dotlabel.ulft(btex $\dfrac{\pi}{2}$ etex
,(0,pi*u/2)); dotlabel.ulft(btex $2$ etex ,(0,2u));
dotlabel.lft(btex $3$ etex ,(0,3u)); dotlabel.ulft(btex $\pi$ etex
,(0,pi*u));

%Graduation axe x
dotlabel.llft(btex $-\pi$ etex, (-pi*u,0)); dotlabel.bot(btex  $-3$
etex, (-3u,0)); dotlabel.llft(btex  $-2$ etex, (-2u,0));
dotlabel.llft(btex $-\dfrac{\pi}{2}$ etex, (-pi*u/2,0));
dotlabel.bot(btex  $-1$ etex, (-1u,0)); dotlabel.bot(btex  $1$
etex, (1u,0)); dotlabel.llft(btex $\dfrac{\pi}{2}$ etex,
(pi*u/2,0)); dotlabel.bot(btex  $2$  etex, (2u,0));
dotlabel.bot(btex  $3$  etex, (3u,0)); dotlabel.lrt(btex $\pi$ etex,
(pi*u,0));


P = ((pi/4)*u, (sind(180/4)/cosd(180/4))*u); label.ulft(btex $\tan
x$ etex, P); Q = P reflectedabout ((0,0),(pi*u,pi*u));
label.lrt(btex  $\arctan x$ etex, Q);

endfig;































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%
%%
%%   C E R C L E         C O N G R U E N C E 
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




beginfig(56);


draw fullcircle scaled 4cm;

path p[]; pair A[];numeric n[];

 p0:= (1.75cm,0)--(2.25cm,0); draw p0 withpen pencircle scaled 3bp; A0:=(2.25cm,0);

for  i=1 upto 4 : p[i]:=( p[i-1] )rotated 72;  draw p[i] withpen pencircle scaled 3bp ;  A[i]:=(A[i-1])rotated 72;  endfor;

label.rt(btex $0\ 5\ 10\ \cdots$ etex, A0) withcolor bleu_m;
label.rt(btex $1\ 6\ 11\ \cdots$ etex,A[1]) withcolor bleu;
label.lft(btex $\cdots\ 12\ 7\ 2$ etex,A[2]) withcolor 0.7white;
label.lft(btex $\cdots\ 13\ 8\ 3$ etex,A[3]) withcolor bleu_f;
label.rt(btex $4\ 9\ 14\ \cdots$ etex,A[4]) withcolor 0.5white;



endfig;












%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%          Q C M       C O M p L E X e s 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(57);

numeric u;

u:=1cm;

pair o,a,b,c,d;

o:=origin;
a:=(sqrt(3)*u,-u);
b:=a rotated 120;
c:=b rotated 120;
d:=a scaled -0.5;

drawarrow  o--a withcolor bleu_f withpen pencircle scaled 1.5bp;
drawarrow o--b withcolor bleu_f withpen pencircle scaled 1.5bp;
drawarrow o--c withcolor bleu_f withpen pencircle scaled 1.5bp;
drawarrow o--d withcolor bleu_f withpen pencircle scaled 1.5bp;
drawarrow d--b dashed evenly withcolor bleu_f withpen pencircle scaled 1.5bp;
drawarrow d--a dashed evenly withcolor bleu_f withpen pencircle scaled 1.5bp ;




label.bot(btex $\Omega$ etex,o shifted(0,-0.1*u));
label.rt(btex $A$ etex,a);
label.top(btex $B$ etex,b);
label.lft(btex $C$ etex,c);
label.lft(btex $D$ etex, d);
label.bot(btex $\overrightarrow{u}$ etex, o shifted (1.5*u,-2.2*u));
label.rt(btex $\overrightarrow{v}$ etex, o shifted (u,-1.5*u));


 vardef axes =
   drawarrow (ux*xmin,0)shifted (u,-2*u) -- (ux*xmax,0)shifted (u,-2*u); % axe des x
   drawarrow (0,uy*ymin)shifted (u,-2*u) -- (0,uy*ymax)shifted (u,-2*u)  ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)shifted (u,-2*u)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)shifted (u,-2*u)); % label de l'axe des y
  enddef;



 label.llft(btex $0$ etex,(-.1*ux,-.15*uy)shifted (u,-2*u));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=1cm; uy:=ux;
  xmin:=-4.5; xmax:=4.5;
  ymin:=-.5; ymax:=4.5;
  coefficient:=1; % coefficient d'échelle

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;
drawarrow o shifted (u,-2*u)--o shifted(2*u,-2*u) withpen pencircle scaled 1.5bp withcolor 0.2white;
drawarrow o shifted (u,-2*u)--o shifted(u,-u) withpen pencircle scaled 1.5bp withcolor 0.2white;


endfig;























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%    L I M I T E            S U I T E                   I N F N I E
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=1cm; uy:=0.8*ux;
  xmin:=-.5; xmax:=7.5;
  ymin:=-.5; ymax:=6.5;
  coefficient:=1; % coefficient d'échelle




 vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0); % axe des x
   drawarrow ((0,uy*ymin) -- (0,uy*ymax))  ; % axe des y
   label.lrt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;



 label.llft(btex $0$ etex,(-.1*ux,-.15*uy));



beginfig (59);
numeric aa,bb,cc;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Axe
%%%%%%%%%%%%%%%%%%%%%%%%%%
axes;
label.llft(btex $0$ etex,(0,0));

%%%%%%%%%%%%%%%%%%%%%%%
%Fonction, graphe
%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =2.3*sqrt(x) enddef;

vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;


draw trace(g,0,xmax,.1) withcolor 0.6white;
%label.rt(btex $y=2\sqrt{x}$ etex,(xmax*ux,(f(xmax))*uy));

%%%%%%%%%%%%%%%%%%%%%%%%
%Points sur le graphe
%%%%%%%%%%%%%%%%%%%%%%%
pair A[],M[],O[];

u:=.7;%facteur d'échelle
%a:=2;b:=5;c:=9;%numeros des points particuliers
aa:=2;bb:=5;cc:=9;%numeros des points particuliers

for i=1 upto 12: A[i]:=(i*u*ux,0);% A comme abscisse
                 M[i]:=(i*u*ux,f(i*u)*uy); %M comme courbe !!
                 O[i]:=(0,f(i*u)*uy); %O comme ordonnée
endfor ;

for i=1 upto 10:
    draw M[i] withpen pencircle scaled 4bp withcolor 0.3white;
endfor ;

for i=aa,bb,cc:
    draw A[i]--M[i]--O[i] dashed evenly;
endfor;

label.bot(btex $n$ etex,A[aa]);
label.bot(btex $N_1$ etex,A[bb]);
label.bot(btex $N_2$ etex,A[cc]);

label.lft(btex $u_n$ etex,O[aa] shifted (0,.1*uy));
label.lft(btex $u_{N_1}$ etex,O[bb]  shifted (0,.1*uy));
label.lft(btex $u_{N_2}$ etex,O[cc]  shifted (0,.2*uy));

%%%%%%%%%%%%%%%%%%%
%Tracé des droites
%%%%%%%%%%%%%%%%%%
pair C,D;

C=1/3(O[bb]+2O[bb-1]); %Point seuil
D=1/3(O[cc]+2O[cc-1]); %Point seuil

pickup pencircle scaled 2bp;

draw C--C  shifted (xmax*ux,0) withcolor bleu_m;
draw D--D shifted (xmax*ux,0) withcolor bleu_m;

label.lft(btex $A_1$ etex,C shifted (0,-.1*uy));
label.lft(btex $A_2$ etex,D shifted (0,-.1*uy));

endfig;





























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%         S U I T E S               C O N V E R G E N T E S 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

ux:=1.25cm; uy:=1cm;
 xmin := -0.5; xmax := 8;
ymin := xmin; ymax := xmax-1;





beginfig(60);

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Axe
%%%%%%%%%%%%%%%%%%%%%%%%%%
drawarrow (ux*xmin,0) -- ((1.3*xmax)*ux,0) ;% axe des x
label.rt(btex \large{$\bbr$} etex,(1.3*xmax*ux,0));

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Points v(n)
%%%%%%%%%%%%%%%%%%%%%%%%%%
pair v[];
pair b; %shift vers le bas pour les labels

for i=3 upto 26: v[i]=((i/(i+1)-3/4)*6*(xmax-.5)*ux,0); endfor
b=(0,-.3*uy);

for i=3 upto 24: draw v[i]  withpen pencircle scaled 4bp; endfor
for i=18 upto 23: draw v[i]shifted (v[17]-v[21])  withpen pencircle scaled 4bp; endfor


label.bot(btex $u_0$ etex, v[3] shifted b);
label.bot(btex $u_1$ etex, v[4] shifted b);
%label.bot(btex $u_{N_1}$ etex, v[12] shifted b);
%label.bot(btex $u_{N_2}$ etex, v[19] shifted b);
%label.bot(btex $\cdots$ etex, 1/2(v[10]+v[16]) shifted b);
%label.bot(btex $\cdots$ etex, 1/2(v[16]+v[19]) shifted b);
%label.bot(btex $\cdots$ etex, v[20] shifted b+(.2*ux,0));

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Points seuils
%%%%%%%%%%%%%%%%%%%%%%%%%%
pair y[]; %points seuils
pair h,hh; %shift vers le haut pour les labels
path r,rr; %tiret vertical

y[1]=(2v[8]+v[9])/3;
y[2]=(v[15]+v[16])/2;
y[3]=v[20]+(0.1*ux,0) ;
y[4]=v[26]+(0.1*ux,0) ;
h=(0,.3*uy);hh=(0,uy);
r=(0,0.15*uy)--(0,-0.15*uy);
rr=(0,0.85*uy)--(0,-0.85*uy);


draw r shifted y[1] withpen pencircle scaled 1.5bp withcolor bleu_m;
draw r shifted y[2] withpen pencircle scaled 1.5bp withcolor bleu_m;
draw r shifted y[4] withpen pencircle scaled 1.5bp withcolor bleu_m;
draw rr shifted y[3] withpen pencircle scaled 4bp withcolor bleu_m;

label.top(btex $\ell-1$ etex, y[1] shifted h) withcolor bleu_m;
label.top(btex $\ell-0,1$ etex, y[2] shifted h) withcolor bleu_m;
label.top(btex $\ell+0,1$ etex, y[4] shifted h) withcolor bleu_m;
label.top(btex \LARGE{\boldmath$\ell$\unboldmath} etex, y[3] shifted hh) withcolor bleu;

endfig;











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%
%           S U I T E S        R E C         C o N V             E S C A L I E R 
%
%%
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=2cm;  uy:=2cm;
  xmin :=-1.3 ; xmax :=2.3;
  ymin := -.2; ymax :=2;


  pair d,h;
  d:=(.1*ux,0);
  h:=(0,.05*uy);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.rt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

beginfig(61);


axes;

vardef f(expr x) = sqrt(1+x) enddef;


vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,g(i)*uy) ..
    endfor (b*ux,g(b)*uy)
  enddef;


  path P,Q;
  P:=trace(f,-1,2,.01) ;
  Q:=(-.2*ux,-.2*uy)--(2*ux,2*uy);
  draw P withpen pencircle scaled 1.3bp;
  draw Q withcolor bleu;

label.rt(btex $\displaystyle y=\sqrt{1+x}$ etex,(2*ux,f(2)*uy)); label.rt(btex $y=x$ etex,(2*ux,2*uy));

draw
(-.5*ux,0)--(-.5*ux,f(-.5)*uy)--(f(-.5)*ux,f(-.5)*uy)--(f(-.5)*ux,f(f(-.5))*uy)--(f(f(-.5))*ux,f(f(-.5))*uy)--(f(f(-.5))*ux,f(f(f(-.5)))*uy)withcolor bleu_m;

%(-.5*ux,0)--(-.5*ux,f(-.5)*uy)
drawarrow (-.5*ux,0)--1/2[(-.5*ux,0),(-.5*ux,f(-.5)*uy)]withcolor bleu_m; draw 1/2[(-.5*ux,0),(-.5*ux,f(-.5)*uy)]--(-.5*ux,f(-.5)*uy)withcolor bleu_m;

%(-.5*ux,f(-.5)*uy)--(f(-.5)*ux,f(-.5)*uy)
drawarrow (-.5*ux,f(-.5)*uy)--1/2[(-.5*ux,f(-.5)*uy),(f(-.5)*ux,f(-.5)*uy)]withcolor bleu_m; draw
1/2[(-.5*ux,f(-.5)*uy),(f(-.5)*ux,f(-.5)*uy)]--(f(-.5)*ux,f(-.5)*uy)withcolor bleu_m;

%(f(-.5)*ux,f(-.5)*uy)--(f(-.5)*ux,f(f(-.5))*uy)
drawarrow (f(-.5)*ux,f(-.5)*uy)--1/2[(f(-.5)*ux,f(-.5)*uy),(f(-.5)*ux,f(f(-.5))*uy)]withcolor bleu_m; draw
1/2[(f(-.5)*ux,f(-.5)*uy),(f(-.5)*ux,f(f(-.5))*uy)]--(f(-.5)*ux,f(f(-.5))*uy)withcolor bleu_m;

%(f(-.5)*ux,f(f(-.5))*uy)--(f(f(-.5))*ux,f(f(-.5))*uy)
drawarrow (f(-.5)*ux,f(f(-.5))*uy)--1/2[(f(-.5)*ux,f(f(-.5))*uy),(f(f(-.5))*ux,f(f(-.5))*uy)]withcolor bleu_m; draw
1/2[(f(-.5)*ux,f(f(-.5))*uy),(f(f(-.5))*ux,f(f(-.5))*uy)]--(f(f(-.5))*ux,f(f(-.5))*uy)withcolor bleu_m;

%(f(f(-.5))*ux,f(f(-.5))*uy)--(f(f(-.5))*ux,f(f(f(-.5)))*uy)
drawarrow (f(f(-.5))*ux,f(f(-.5))*uy)--2/3[(f(f(-.5))*ux,f(f(-.5))*uy),(f(f(-.5))*ux,f(f(f(-.5)))*uy)]withcolor bleu_m; draw
2/3[(f(f(-.5))*ux,f(f(-.5))*uy),(f(f(-.5))*ux,f(f(f(-.5)))*uy)]--(f(f(-.5))*ux,f(f(f(-.5)))*uy)withcolor bleu_m;

draw((f(f(-.5))*ux,f(f(f(-.5)))*uy)--(1.5*ux,f(f(f(-.5)))*uy))dashed evenly withpen pencircle scaled 1.3bp withcolor bleu_m;

draw ((-ux,0) shifted h)--((-ux,0) shifted -h); label.bot(btex $-1$ etex,(-ux,0) shifted -h); draw ((ux,0) shifted h)--((ux,0) shifted
-h); label.bot(btex $1$ etex,(ux,0) shifted -h); draw ((2*ux,0) shifted h)--((2*ux,0) shifted -h); label.bot(btex $2$ etex,(2*ux,0)
shifted -h);

numeric n; n:=(1+ sqrt(5))/2; draw ((n*ux,0)--(n*ux,n*uy)) dashed evenly withcolor bleu_f; draw ((n*ux,0) shifted h)--((n*ux,0) shifted -h)withcolor bleu_f;
label.bot(btex \large{$\f$} etex,(n*ux,0) shifted -h)withcolor bleu_f;

label.ulft(btex $0$ etex,(0,0)); label.ulft(btex $1$ etex,(0,uy)); endfig;






























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%                                                                E S C A R G O T 
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=2cm;  uy:=2cm;
  xmin :=-.5 ; xmax :=2.3;
  ymin := -.3; ymax :=2.5;


  pair d,h;
  d:=(.05*ux,0);
  h:=(0,.05*uy);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.rt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

beginfig(62);


axes;

vardef f(expr x) = 2/(x+1) enddef;


vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,g(i)*uy) ..
    endfor (b*ux,g(b)*uy)
  enddef;


  path P,Q;
  P:=trace(f,-.2,2,.01) ;
  Q:=(-.2*ux,-.2*uy)--(2*ux,2*uy);
  draw P withpen pencircle scaled 1.3bp;
  draw Q withcolor bleu;

label.rt(btex $\displaystyle y=f(x)$ etex,(2*ux,f(2)*uy)); label.rt(btex $y=x$ etex,(2*ux,2*uy))withcolor bleu;

draw
(.2*ux,0)--(.2*ux,f(.2)*uy)--(f(.2)*ux,f(.2)*uy)--(f(.2)*ux,f(f(.2))*uy)--(f(f(.2))*ux,f(f(.2))*uy)--(f(f(.2))*ux,f(f(f(.2)))*uy)--(f(f(f(.2)))*ux,f(f(f(.2)))*uy)withcolor bleu_m;

%(.2*ux,0)--(.2*ux,f(.2)*uy)
drawarrow (.2*ux,0)--1/2[(.2*ux,0),(.2*ux,f(.2)*uy)]; draw 1/2[(.2*ux,0),(.2*ux,f(.2)*uy)]--(.2*ux,f(.2)*uy)withcolor bleu_m;

%(.2*ux,f(.2)*uy)--(f(.2)*ux,f(.2)*uy)
drawarrow (.2*ux,f(.2)*uy)--1/2[(.2*ux,f(.2)*uy),(f(.2)*ux,f(.2)*uy)]withcolor bleu_m; draw
1/2[(.2*ux,f(.2)*uy),(f(.2)*ux,f(.2)*uy)]--(f(.2)*ux,f(.2)*uy)withcolor bleu_m;

%(f(.2)*ux,f(.2)*uy)--(f(.2)*ux,f(f(.2))*uy)
drawarrow (f(.2)*ux,f(.2)*uy)--1/2[(f(.2)*ux,f(.2)*uy),(f(.2)*ux,f(f(.2))*uy)]withcolor bleu_m; draw
1/2[(f(.2)*ux,f(.2)*uy),(f(.2)*ux,f(f(.2))*uy)]--(f(.2)*ux,f(f(.2))*uy)withcolor bleu_m;

%(f(.2)*ux,f(f(.2))*uy)--(f(f(.2))*ux,f(f(.2))*uy)
drawarrow (f(.2)*ux,f(f(.2))*uy)--1/2[(f(.2)*ux,f(f(.2))*uy),(f(f(.2))*ux,f(f(.2))*uy)]withcolor bleu_m; draw
1/2[(f(.2)*ux,f(f(.2))*uy),(f(f(.2))*ux,f(f(.2))*uy)]--(f(f(.2))*ux,f(f(.2))*uy)withcolor bleu_m;

%(f(f(.2))*ux,f(f(.2))*uy)--2/3[(f(f(.2))*ux,f(f(.2))*uy),(f(f(.2))*ux,f(f(f(.2)))*uy)]
drawarrow (f(f(.2))*ux,f(f(.2))*uy)--2/3[(f(f(.2))*ux,f(f(.2))*uy),(f(f(.2))*ux,f(f(f(.2)))*uy)]withcolor bleu_m; draw
2/3[(f(f(.2))*ux,f(f(.2))*uy),(f(f(.2))*ux,f(f(f(.2)))*uy)]--2/3[(f(f(.2))*ux,f(f(.2))*uy),(f(f(.2))*ux,f(f(f(.2)))*uy)]withcolor bleu_m;

draw ((f(f(f(.2)))*ux,f(f(f(.2)))*uy)--(f(f(f(.2)))*ux,uy))dashed withdots withpen pencircle scaled 1.3bp withcolor bleu_m;

draw ((.2*ux,0) shifted h)--((.2*ux,0) shifted -h); label.bot(btex $u_0$ etex,(.2*ux,0) shifted -h)withcolor bleu_m;

draw ((f(.2)*ux,0) shifted h)--((f(.2)*ux,0) shifted -h); draw ((f(.2)*ux,0) --(f(.2)*ux,f(f(.2))*uy)) dashed evenly withcolor bleu_f ; label.bot(btex
$u_1$ etex,(f(.2)*ux,0) shifted -h)withcolor bleu_f;

draw ((f(f(.2))*ux,0) shifted h)--((f(f(.2))*ux,0) shifted -h)withcolor bleu_f; draw ((f(f(.2))*ux,0) --(f(f(.2))*ux,f(f(f(.2)))*uy)) dashed evenly withcolor bleu_f;
label.bot(btex $u_2$ etex,(f(f(.2))*ux,0) shifted -h)withcolor bleu_f;

draw ((f(f(f(.2)))*ux,0) shifted h)--((f(f(f(.2)))*ux,0) shifted -h)withcolor bleu_f; draw ((f(f(f(.2)))*ux,0) --(f(f(f(.2)))*ux,f(f(f(f(.2))))*uy))withcolor bleu_f
dashed evenly; label.bot(btex $u_3$ etex,(f(f(f(.2)))*ux,0) shifted -h+d/2)withcolor bleu_f;




draw((f(f(f(.2)))*ux,f(f(f(.2)))*uy)--(f(f(f(.2)))*ux,f(f(f(f(.2))))*uy))dashed evenly withpen pencircle scaled 1.3bp withcolor bleu_f;

draw ((ux,0)--(ux,uy)) dashed evenly withcolor bleu_f; draw ((ux,0) shifted h)--((ux,0) shifted -h)withcolor bleu_f; label.bot(btex $\large{\ell}$ etex,(ux,0) shifted -h-d/2)withcolor bleu_f;

label.ulft(btex $0$ etex,(0,0));

endfig;



























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%%               A R C T A N G E N T E      TRIANGLE
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(63);

u:=1cm;
pair a,b,c,d,e;
 pair f,g,h,i,j,k; 
 pair l,m,n,o,p,q;
  pair r,s,t,z;
   pair v,w,x,aa;

a:=(0,0);
b=(2u,0); c=(u,u);d=(3u,3u); e=(12u,0);
x=(4u,4u);
f=(5u,3u);g=(6u,2u);h=(7u,3u);
i=(8u,2u);j=(9u,u);k=(10u,2u);l=(11u,u);m=(11u,-u);n=(10u,-2u);o=(9u,-u);p=(8u,0);
q=(7u,-u);r=(6u,0);s=(5u,-u);t=(4u,0);z=(3u,-u);v=(2u,-2u);w=(u,-u);aa=(2u,2u);

fill a--b--c--cycle withcolor 0.6white;
fill c--b--d--cycle withcolor bleu;
fill b--e--d--cycle withcolor bleu_ciel;

pickup pencircle scaled 2pt;
draw a--b--c--cycle;
draw c--b--d--cycle;
draw b--d--e--cycle;

pickup pencircle scaled 0.8pt;

%for i=1 upto 5 : draw (((a shifted (i*u,0)) )--((b shifted (i*u,0)) )--((c shifted (i*u,0)) )); endfor

draw a--x; draw w--f;draw v--h;draw s--i;draw q--k;draw o--l;draw n--e;
draw a--v;draw c--z;draw aa--s;draw d--q;draw x--n; draw h--m;draw k--e;

draw halfcircle scaled 2u shifted(2*u,0);



endfig;






















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%
%
%                                                                A R C H I M E D E 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Un peu de couleurs
color couleurtrace; 
couleurtrace := (0.3,0.4,1); 

%% Procédure d'affectation 
def affecte(suffix p)(expr coords,nom) = 
   pair p.c; string p.n; 
   p.c := coords; 
   p.n := nom; 
enddef; 

%% Lecture des coordonnées 
vardef getcoordonnees suffix p = p.c enddef; 

%% Lecture du nom 
vardef getnom suffix p = p.n enddef; 

%% La « procédure » 
vardef placePolygone(text t) = 
   pair g,c__[] ; string n__[]; path P;
   n_:=0; 
   forsuffixes pp = t: 
     c__[incr n_] = getcoordonnees pp; 
     n__[n_] = getnom pp; 
   endfor 
   g := (0,0); 
   for i=1 upto n_: 
     g := g + c__[i]; 
   endfor 
   g := (1/n_)*g; 
   draw c__[1]--for i=2 upto n_:c__[i]--endfor cycle withcolor couleurtrace withpen pencircle scaled 2bp; 
P:=c__[1]--for i=2 upto n_:c__[i]--endfor cycle;   
for i=1 upto n_: 
     draw c__[i] withpen pencircle scaled 2bp withcolor couleurtrace; 
     %label(n__[i],c__[i]+2*labeloffset*unitvector(c__[i]-g));    
endfor; 
enddef;


%Conversion de polygone.1 au format PNG

beginfig(64);

% Affectation des points 
pair A,B,C,D,E,F; 
A := (2cm,0); 
B := A rotated 60; 
C := A rotated 120; 
D := A rotated 180; 
E:= A rotated 240;
F:= A rotated 300; 


affecte(a,A,"A"); 
affecte(b,B,"B"); 
affecte(c,C,"C"); 
affecte(d,D,"D");
affecte(e,E,"E");
affecte(f,F,"F");
% Construction du triangle ABC avec sommets nommés 
couleurtrace := bleu_f;
placePolygone(a,b,c,d,e,f); 
fill P withcolor bleu_ciel;
transform T;
T := identity zscaled (1,0.5773502);

pair AA,BB,CC,DD,EE,FF; 

AA := A transformed T; 
BB := B transformed T; 
CC := C transformed T; 
DD := D transformed T; 
EE := E transformed T; 
FF := F transformed T; 
 
affecte(aa,AA,"A' "); 
affecte(bb,BB,"B' "); 
affecte(cc,CC,"C' "); 
affecte(dd,DD,"D' "); 
affecte(ee,EE,"E' "); 
affecte(ff,FF,"F' "); 
 
% Construction du quadrilatère ABCD avec sommets nommés 
couleurtrace := bleu_m; 
placePolygone(aa,bb,cc,dd,ee,ff);

draw fullcircle scaled 4cm;

endfig;


























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
%
%
%
%                                                                  R E S E R V O i R     E p
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ùùù

beginfig(65);


pair A[],B[],C[],D[]; path p,pp;

A[0]:=(0,0);
A[1]:=(10cm,0);
A[2]:=(13cm,4cm);
A[3]:=(3cm,4cm);

for i=0 upto 3: B[i]:=A[i] shifted (0,2cm); endfor
for i=0 upto 3: C[i]:=A[i] shifted (0,2.5cm); endfor
for i=0 upto 3: D[i]:=A[i] shifted (0,3.5cm); endfor


p:=C[0]--C[1]--C[2]--C[3]--cycle;
pp:=B[0]--B[1]--B[2]--C[2]--C[1]--C[0]--cycle;

fill p withcolor bleu_ciel;
fill pp withcolor bleu_ciel;

draw A[0]--A[1]--A[2];
draw B[0]--B[1]--B[2] withcolor bleu_m withpen pencircle scaled 2bp;
draw C[0]--C[1]--C[2] withcolor bleu_m withpen pencircle scaled 2bp;
draw D[0]--D[1]--D[2]--D[3]--cycle;

draw A[2]--A[3]--A[0] dashed evenly;
draw B[2]--B[3]--B[0] withcolor bleu_m dashed evenly withpen pencircle scaled 2bp;
draw C[2]--C[3]--C[0] withcolor bleu_m dashed evenly withpen pencircle scaled 2bp;

draw A[0]--D[0];
draw A[1]--D[1];
draw A[2]--D[2];
draw A[3]--D[3] dashed evenly;

label.lft(btex $h_i$ etex scaled 1.5, B[0]);
label.lft(btex $h_{i+1}$ etex scaled 1.5, C[0]);
label.lft(btex $h_0=0$ etex scaled 1.5, A[0]);
label.lft(btex $h_n=100$ etex scaled 1.5, D[0]);
endfig;





























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
%
%    S U B D I V S I on  P L U s    F I N E 
%
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



beginfig(66);





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  ux:=2.3cm; uy:=0.8cm;
  xmin:=-.5; xmax:=7;
  ymin:=xmin; ymax:=6;
  coefficient:=1; % coefficient d'échelle
  % k:=-2.5; % intervient dans la fonction homothétique de x--> 1/x

%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tracé des axes
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;


pair a,b,c,d,e,f,bb,cc,dd,ee,xa,xc,xf,cu,cd,ct,gu,gd,gt,gq;

a:=(ux,2.5*uy);
b:=(2*ux,4*uy);
c:=(3*ux,2*uy);
d:=(3.4*ux,1.2*uy);
e:=(4.5*ux,5*uy);
f:=(5*ux,3.5*uy);
bb:=b xscaled 0;
cc:=c xscaled 0;
dd:=d xscaled 0;
ee:=e xscaled 0;
xa:=a yscaled 0;
xc:=c yscaled 0;
xf:=f yscaled 0;
cu:=(ux,2*uy);
cd:=(ux,4*uy);
ct:=(3*ux,4*uy);
gu:=(ux,1.2*uy);
gd:=(5*ux,1.2*uy);
gt:=(5*ux,5*uy);
gq:=(ux,5*uy);


path p,pp,ppp; 

pp:=a..tension1.3..{dir 0}b{dir 0}..c..{dir 0}d{dir 0}..tension1.5..{dir 0}e{dir 0}..tension1.3..{dir300}f;
p:=c--cu--cd--ct--cycle;
ppp:=gu--gd--gt--gq--cycle;


fill ppp withcolor bleu_ciel;
fill p withcolor bleu_m;
draw pp withpen pencircle scaled 1.5bp;

dotlabel.top(btex $ $ etex,b);
dotlabel.bot(btex $ $ etex,d);
dotlabel.top(btex $ $ etex,e);
dotlabel.urt(btex $ $ etex,c);

label.lft(btex $M_i$ etex, ee);
label.lft(btex $M'_i$ etex, bb);
label.lft(btex $m'_i$ etex, cc);
label.lft(btex $m_i$ etex, dd);

label.bot(btex $a_i$ etex,xa);
label.bot(btex $a'_i$ etex,xc);
label.bot(btex $a_{i+1}$ etex,xf);

draw ee--e dashed withdots withpen pencircle scaled 1.5bp;
draw dd--d dashed withdots withpen pencircle scaled 1.5bp;
draw f--xf dashed withdots withpen pencircle scaled 1.5bp;
draw a--xa dashed withdots withpen pencircle scaled 1.5bp;
draw bb--b dashed evenly withcolor bleu_m withpen pencircle scaled 1.3bp;
draw cc--c--xc dashed evenly withcolor bleu_m withpen pencircle scaled 1.3bp;

endfig;




























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
%
%   I N T E G    F O N C T I O N     D e     L A       B O R N E                       S U P
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=1cm;  uy:=1cm;
  xmin := -.5 ; xmax := 9;
  ymin := -1.5 ; ymax := 3;


  pair d,h;
  d:=(.1*ux,0);
  h:=(0,.1*uy);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (xmin*ux,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,ymin*uy) -- (0,uy*ymax); % axe des y
   label.rt(btex $x$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

 beginfig(67);

pair A,B; A:=(-0.5*ux,-uy); B:=(7*ux,3*uy);

path C; C:=A{dir10}..B{dir10};

pair     a,b; a:=A yscaled 0; b:=B yscaled 0;


pair M,m; M:= point .8 of C; m:=M yscaled 0;

path U; U:=(0,0)--(5*ux,0);

pair X; X:= C intersectionpoint U;


path V,K,W; V:=M--m; K:=m--X; W:=buildcycle(C,V,K);

path Y,Z; Y:=A--a--X; Z:=buildcycle(C,reverse Y);

fill W withcolor bleu; fill Z withcolor bleu;
%%%%%%%%%%%%%%%%%%%%
% tracés
%%%%%%%%%%%%%%%%%%%%

axes;
pickup  pencircle scaled 1.3bp;
draw C withcolor bleu_f; label.rt(btex $y=f(x)$ etex,B shifted d)withcolor 0.3white;

draw (A--a)  withcolor 0.3white; draw (B--b)  withcolor 0.3white;

draw a--(a shifted h); label.top(btex $a$ etex,a shifted h); draw (b shifted h)--(b shifted -h); label.bot(btex $b$ etex,b shifted -h);

draw (M--m)  withcolor 0.3white;

 draw (m shifted h)--(m shifted -h); label.bot(btex $t$ etex,m shifted -h);

label.rt(btex $\displaystyle\int_a^tf(u)du$ etex, (X+m)/2 shifted (-0.31ux,0.75*uy));


endfig;









































%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
%
%     C E N T R E     D ' I N E R T I E  
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 beginfig(72);

pair A,B; A:=(1*ux,0); B:=(7*ux,3*uy);

path C; C:=A{dir10}..B{dir10};

pair     a,b; a:=A yscaled 0; b:=B yscaled 0;


pair M,m; M:= point .7 of C; m:=M yscaled 0;
pair N,n; N:= point .78 of C; n:=N yscaled 0;



path U; U:=N--n; path V; V:=M--(M shifted (6*ux,0));

pair X; X:= V intersectionpoint U;


path W; W:=M--X--n--m--cycle;

%path i,j; i:=(M shifted (-0.3*ux,0))--(m shifted (-0.3*ux,0)); j:=(N shifted (0.3*ux,0.3*uy))--(n shifted (0.3*ux,0)); path t,r; t:=C cutafter i cutbefore j; 
path r; r:=N--X--M;
path Z; Z:=buildcycle(C,r);

 fill Z withcolor .2white;

fill W withcolor bleu;

path UU; UU:=(0,0)--(8*ux,0);

pair XX; XX:= C intersectionpoint UU;

path VV,K,WW; VV:=M--m; K:=m--XX; WW:=buildcycle(C,VV,K);
path Y,ZZ; Y:=A--a--XX; ZZ:=buildcycle(C,reverse Y);
path ZZZ,ZZZZ; ZZZ:=B--b--n--N; ZZZZ:=buildcycle(C,ZZZ);
fill ZZZZ withcolor bleu_ciel;
fill WW withcolor bleu_ciel; fill ZZ withcolor bleu_ciel;
%%%%%%%%%%%%%%%%%%%%
% tracés
%%%%%%%%%%%%%%%%%%%%

axes;
pickup  pencircle scaled 1.3bp;
draw C withcolor bleu_f; label.rt(btex $y=f(x)$ etex,B shifted d)withcolor 0.3white;

draw (A--a)  withcolor 0.3white; draw (B--b)  withcolor 0.3white;

draw a--(a shifted h); label.top(btex $a$ etex,a shifted h); draw (b shifted h)--(b shifted -h); label.bot(btex $b$ etex,b shifted -h);

draw (M--m)  withcolor 0.3white;

 draw (m shifted h)--(m shifted -h); label.bot(btex $x$ etex,m shifted -2h);

%label.rt(btex $\displaystyle\int_a^tf(u)du$ etex, (X+m)/2 shifted (-0.31ux,0.75*uy));

draw (N--n) ; draw (n shifted h)--(n shifted -h); label.bot(btex {$x\!+\!\d x$} etex,n shifted -h +(0.3*ux,0));
draw (X--(X xscaled 0)) withpen pencircle scaled 1bp; draw ((X xscaled 0)shifted d)--((X xscaled 0)shifted -d); label.lft(btex $f(x)$ etex,(X xscaled
0)shifted -d);

dotlabel.top(btex $\mathbf{G_x}$ etex, ((M+N)/2) yscaled 0.5); 

endfig;













%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%%             S E R I E                         I N T E G R A L E
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
%OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
 
beginfig(69);

  ux:=0.5cm; uy:=ux;
  xmin:=-0.5; xmax:=8;
  ymin:=-0.5; ymax:=6;
%%%%%%%%%%%%%%%%%%%%%%%%%%
%Axe
%%%%%%%%%%%%%%%%%%%%%%%%%%  
axes;

%%%%%%%%%%%%%%%%%%%%%%%
%Fonction, graphe 
%%%%%%%%%%%%%%%%%%%%%%%
vardef f(expr x) =7*((0.8)**x) enddef;
vardef fx(expr x) =x enddef;
%vardef fy(expr x) =7*((0.8)**x) enddef;
vardef trace (suffix g)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b:
     (i*ux,f(i)*uy) ..
    endfor (b*ux,f(b)*uy)
  enddef;




%%%%%%%%%%%%%%%%%%%%%%%%
%Rectangles
%%%%%%%%%%%%%%%%%%%%%%%


% une macro non parfaite pour obtenir le min de f sur un intervalle, 
% cela suppose qu'elle soit bien reguliere......
vardef minf(suffix fx,fy)(expr a,b) =
    save m,i; numeric m,i;
    m:=fy(a);
    for i=a step (b-a)/100 until b:
      if m>fy(i): m:=fy(i); fi;
    endfor;
    m
enddef;


%rectangle en dessous de la courbe colorié en bleu, utilise la macro precedente
  vardef trace_rectangles_min (suffix fx,fy)(expr a,b,inc) =
    save i; numeric i;
    for i=a step inc until b-inc:
      path p; numeric m;
      m:=minf(fx,fy,i,i+inc);
      p = (i*ux,0)--((i+inc)*ux,0)--((i+inc)*ux,m*uy)--(i*ux,m*uy)--cycle;
      %p := p scaled 1cm;
      
      fill p withcolor bleu_ciel;
      draw p;
    endfor;

enddef;

trace_rectangles_min(fx,f,1,xmax-1,0.75);  


draw trace(g,1,7.8,.1);
label.rt(btex $y=f(x)$ etex,((xmax-.2)*ux,(f(xmax-.2))*uy));

%label.bot(btex $2$ etex, (1*ux,0));

%abel.bot(btex $3$ etex, (2*ux,0));
%label.bot(btex $4$ etex, (3*ux,0));
%label.bot(btex $\cdots$ etex, (4.5*ux,0));
%label.bot(btex $N\!-\!1$ etex, (6*ux,0));
%label.bot(btex $N$ etex, (7*ux,0));


%label.lft(btex $f(3)$ etex, (0,f(2)*uy));
%label.lft(btex $f(4)$ etex, (0,f(3)*uy));
%label.lft(btex $f(N-1)$ etex, (0,f(6)*uy));
%label.lft(btex $f(N)$ etex, (0,f(7)*uy));

%for i=2,3,6,7:draw (0,f(i)*uy)--(i*ux,f(i)*uy) dashed evenly;endfor


endfig;

















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%

%
%      C U B E S          R E C U R R E N C E
%
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(70);

numeric u;
u:=0.5cm;

pair a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,v,x,y,z;

a:=(0,0); b:=a shifted (u,0); c:=b  shifted (u,0);d:=c  shifted (u,0); e:=d  shifted (u,0); f:= e  shifted (u,0);
g:=(0,4*u); v:=g  shifted (u,0); h:=v  shifted (u,0); i:=h  shifted (u,0); j:= i  shifted (u,0); k:= j  shifted (u,0);
l:= a shifted (0,u); m:=l shifted (0,u); n:=m shifted (0,u); o:=f shifted (0,u); p:=o shifted (0,u); q:=p shifted (0,u);
t:=f shifted (-u,u); s:=t shifted (-u,u);r:=s shifted (-u,u);x:=(u,3*u); y:=(2*u,2*u); z:=(3*u,u);
path w;
w:=a--g--v--x--r--y--s--z--t--e--cycle;
fill w withcolor bleu_ciel;

pickup pencircle scaled 1.3bp;

draw l--t--e--a--g--v--b withcolor bleu_m;
draw n--r--c withcolor bleu_m; 
draw m--s--d withcolor bleu_m;
draw v--k--f--e dashed evenly;
draw r--q  dashed evenly;
draw s--p dashed evenly;
draw j--t dashed evenly;
draw i--s dashed evenly;
draw h--r dashed evenly;
draw t--o dashed evenly;
label.lft(btex $1$ etex, (g+n)/2);
label.lft(btex $2$ etex, (m+n)/2);
label.lft(btex $3$ etex, (m+l)/2);
label.lft(btex $4$ etex, (l+a)/2);
label.bot(btex $1$ etex, (a+b)/2);
label.bot(btex $2$ etex, (c+b)/2);
label.bot(btex $3$ etex, (c+d)/2);
label.bot(btex $4$ etex, (d+e)/2);
label.bot(btex $5$ etex, (e+f)/2);





endfig;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A D J A C E N T E S
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;
  
  ux:=1cm;  uy:=1cm;
  xmin := 0 ; xmax := 9;
  ymin := -.2; ymax :=3;
  
   
  pair d,h;
  d:=(.1*ux,0);
  h:=(0,.1*uy);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   % drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.rt(btex $\mathbb{R}$ etex,(xmax*ux,0) shifted d); % label de l'axe des x
   % label.urt(btex $y$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

 beginfig(71);  

 
axes;
 
 path t; % tirets
 
 t:=((0,0) shifted h)--((0,0) shifted -h);
 
 draw t shifted (ux,0);
 label.bot(btex $a_n$ etex,(ux,0) shifted -1.7h);
 
 draw t shifted (2.5*ux,0);
 label.bot(btex $a_{n+1}$ etex,(2.5*ux,0) shifted -1.7h);
 
 draw t shifted (3.75*ux,0);
 label.bot(btex $a$ etex,(3.75*ux,0) shifted -1.7h);
 
% draw t shifted (4*ux,0);
 label.bot(btex $b$ etex,(3.75*ux,0) shifted 6h);
 
 draw t shifted (5*ux,0);
 label.bot(btex $b_{n+1}$ etex,(5*ux,0) shifted 6h);
 
 draw t shifted (6.5*ux,0);
 label.bot(btex $b_n$ etex,(6.5*ux,0) shifted 6h);
 
 label.top( btex $\cdots$ etex,(3.1*ux,0)shifted (0,-.6*uy));
 label.top( btex $\cdots$ etex,(4.4*ux,0)shifted (0,.6*uy));
 
endfig;


















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
%
%
%        M E T H O D E        D e S       T R A P E Z E S 
%%
%
%
% Trapèze
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Déclarations des constantes %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  numeric xmin, xmax, ymin, ymax, N;

  ux:=1cm;  uy:=1cm;
  xmin := -.5 ; xmax := 8;
  ymin := -.5; ymax := 4;


  pair d,h;
  d:=(.1*ux,0);
  h:=(0,.1*uy);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Définitions des axes et labels associés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef axes =
   drawarrow (ux*xmin,0) -- (ux*xmax,0) ; % axe des x
   drawarrow (0,uy*ymin) -- (0,uy*ymax); % axe des y
   label.rt(btex $t$ etex,(xmax*ux,0)); % label de l'axe des x
   label.urt(btex $x$ etex,(0,ymax*uy)); % label de l'axe des y
  enddef;

 beginfig(73);

path t; % tirets
t:=((0,0)shifted h)--((0,0)shifted -h);

pair A,B,C,a,b; A:=(ux,1.5*uy); C:=(2.5*ux,2.5*uy); B:=(7*ux,uy); a:=A yscaled 0; b:=B yscaled 0;

pair M,N,m,n; path P,Q,QQ,R,S;

P:=A{dir-10}..C..{dir-10}B;

M:=point .7 of P; N:=point 1.2 of P; m:=M yscaled 0; n:=N yscaled 0;

S:=subpath(.7,1.2) of P; 
QQ:=M--N;
Q:=N--n--m--M--cycle; 
R:=buildcycle(S,QQ);

fill R withcolor bleu_f;%(0.829997,0.099994,0.119999);

fill Q withcolor bleu;% (0.529405,0.807794,0.921598);

axes; draw P; draw (A--a) dashed evenly; draw (B--b) dashed evenly; draw (M--m) dashed evenly; draw (N--n) dashed evenly;

draw t shifted a; draw t shifted b; draw t shifted m; draw t shifted n;

%label.bot(btex $a$ etex,a shifted -1.9h); label.bot(btex $b$ etex,b shifted -h); 
label.bot(btex $kT_e$ etex,m shifted -1.9h-d);
label.bot(btex $(k+1)T_e$ etex,n shifted -h+4d);

pair T; T:=M xscaled 0; draw (T--M) dashed evenly;
pair TT; TT:=N xscaled 0; draw (TT--N) dashed evenly;


path U,V; pair t; U:=N--n; V:=T--(T shifted (6*ux,0)); t:=U intersectionpoint V;
%draw (M--t);

draw (T shifted d)--(T shifted -d); label.lft(btex $x(kT_e)=x_k$ etex,T shifted -d);
draw (TT shifted d)--(TT shifted -d); label.lft(btex $x((k+1)T_e)=x_{k+1}$ etex,TT shifted -d);


%label.rt(btex $\mathcal{A}(x,x\!+\!dx)$ etex,(3.4*ux,1.5*uy)); drawarrow (3.4*ux,1.5*uy)--(2.3*ux,1.5*uy);

endfig;
















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  P R O B a s    patates




beginfig(74);
path a,b,aa,ab;
a=fullcircle scaled 2cm;
b=a shifted (0,1cm);
aa=halfcircle scaled 2cm;
ab=buildcycle(aa,b);
picture pa,pb,px;
pa=thelabel(btex $B\setminus A$ etex, (0,-.5cm));
pb=thelabel(btex $A\cap B$ etex, (0,0.5cm));
px=thelabel(btex $A\setminus B$ etex, (0,1.5cm));

fill a withcolor .8white;
fill b withcolor bleu_m;
fill ab withcolor bleu_ciel;
unfill bbox pa;
draw pa;
unfill bbox pb;
draw pb;
unfill bbox px;
draw px;
endfig;




end











