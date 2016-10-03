
%prologues:=2;
%verbatimtex %\input Modele%
% \documentclass{article}
%  \usepackage[latin1]{inputenc}
%  \usepackage[frenchb]{babel}
%  \usepackage{amsmath}
%  \begin{document}
%etex
%input constantes;
%input papiers;
input latexmp;

setupLaTeXMP(
  inputencoding="latin1",
  fontencoding="T1",
  packages="calc,ifthen,mflogo",
  %preamble=(OrdMacro & OoosMacro & otherDefs) ,
  textextlabel=enable );


% color vert_e, turquoise, orange, vert_fonce, rose, vert_mer, bleu_ciel, or, rouge_v,bleu_m,bleu,bleu_f;
% vert_e:=(0,0.790002,0.340007);
% turquoise:=(0.250999,0.878399,0.815699);
% orange:=(0.589999,0.269997,0.080004);
% vert_fonce:=(0,1.4*0.392193,0);
% rose:=(1.0, 0.752907, 0.796106);
% bleu_ciel:=(1.2*0.529405,1.2*0.807794,1);%.2*0.921598);
% or:=(1,0.843104,0);
% rouge_v:=(0.829997,0.099994,0.119999);
% bleu_m:=(0.7*0.529405,0.7*0.807794,0.7);%*0.921598);
% bleu_f:=(0.211762,0.3231176,0.3686392);
% bleu:=(0.529405,0.807794,1);



  u := 1cm; v=u;   % Unité
  pi:=3.14159265859;
  
  beginfig(0)
    for i=1 upto 5:
  label(textext("$i=" & (decimal i) & "$"), (0,10*i)) ;
endfor;

  endfig;  %  label.llft(btex $O$ etex, (0,0));       
%%%
%end
  % 
    def axes(expr xmin,xmax,ymin,ymax) =
    pickup pencircle scaled 0.5pt;
    draw ( (xmin,0) -- (xmax,0) ) scaled u ; 
    draw ( (0,ymin) -- (0,ymax) ) scaled v;
  enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  def grad(expr xscl,yscl,xmin,xmax,ymin,ymax)=
    pickup pencircle scaled 0.5pt;
%% grad sur Ox
    for i=0 step xscl until xmax:
      draw (i*u,1/15cm)--(i*u,-1/15cm);
  endfor;
   for i=0 step -xscl until xmin:
      draw (i*u,1/15cm)--(i*u,-1/15cm);
  endfor;
%% grad sur Oy
  for i=0 step yscl until ymax:
    draw (1/15cm,i*v)--(-1/15cm,i*v);
  endfor;
   for i=0 step -yscl until ymin:
     draw (1/15cm,i*v)--(-1/15cm,i*v);
  endfor;
enddef;
%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  def vecunit =
    pickup pencircle scaled 1pt;
    ahangle:=30;            %angle au sommet de la flèche
    ahlength:=0.9*ahlength; %longueur de la pointe de flèche
    drawarrow  (( 0,0) -- (1,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,1) ) scaled v ;  % vecteurj
    label.llft(textext(" $O$ "), (0,0));         % Place la lettre O en bas à gauche de (0,0)
    %label.bot(textext(" $\vec{\imath}$ "), (0.35,0)*u);  
    %label.lft(textext(" $\overrightarrow{j}$ "), (-0.15,0.5)*v);
    label.bot(textext(" $i$ "), (0.35,0)*u);
    label.lft(textext(" $j$ "), (-0.15,0.5)*v);
    %On colle ensuite dans le .tex:
    %\psfrag{O}{$O$} \psfrag{i}{$\vi$}   \psfrag{j}{$\vj$}
    

    
  enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  def vecunitaire = %pareil mais sans les psfrag
    pickup pencircle scaled 0.7pt;
    ahangle:=30;            %angle au sommet de la flèche
    ahlength:=0.8*ahlength; %longueur de la pointe de flèche
    drawarrow  (( 0,0) -- (1,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,1) ) scaled v ;  % vecteurj
    label.llft(textext(" $O$ "), (0,0));         % Place la lettre O en bas à gauche de (0,0)
    label.bot(textext(" $\vec{\imath}$ "), (0.35,0)*u);  
    label.lft(textext(" $\vec{\jmath}$ "), (-0.15,0.5)*v);
    
  enddef;
  %%%%%%%%%%%%%
  def courbe(suffix f)(expr xmin, xmax, M) =
    draw ( ( xmin*u, (f(xmin))*v )
        for i=1 upto M:
    ..( (xmin + (i/M)*(xmax - xmin))*u, (f( xmin + (i/M)*(xmax - xmin) ))*v)
  endfor ) ;
enddef;


%beginfig(1)
%vardef est nécéssaire pour pouvoir passer f en argument
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % vardef f(expr x) = mexp(-256*x)-1 enddef;        % Ici on définit f(x)
 % vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)


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
   label.lrt(textext(" $x$ "),(xmax*ux,0)); % label de l'axe des x
   label.urt(textext(" $y$ "),(0,ymax*uy)); % label de l'axe des y
  enddef;



beginfig(1);

axes; label.llft(textext(" $0$ "),(-.1*ux,-.15*uy));

%%%%%%%%%%%%%%%
% Courbes
%%%%%%%%%%%%%%%
path p,q;

p:=(0,0){dir10}..(3.5*ux,3*uy); q:=(.2*ux,.5*uy)--(4.5*ux,1.5*uy);

draw p withpen pencircle scaled 0.8bp;% withcolor bleu_m;


label.rt(textext(" $\mathscr{C}_f$ "),(3.5*ux,3.2*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%
% Point d'intersection
%%%%%%%%%%%%%%%%%%%%%%%%
pair A;

A:=(p intersectionpoint q);

draw A withpen pencircle scaled 3bp;

label.ulft(textext(" A "),A shifted (.1*ux,.1*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tangente
%%%%%%%%%%%%%%%%%%%%%%%%%%

draw q rotatedaround(A,27) withpen pencircle scaled 1bp withcolor 0.2white;

%%%%%%%%%%%%%%%%%%%%%%%%%
% Verticale
%%%%%%%%%%%%%%%%%%%%%%%%%
pair B, BB;

B:=A yscaled0; BB:=A xscaled 0;

draw A--B dashed evenly;

draw A--BB dashed evenly;


draw (B shifted (0,.1*uy))--(B shifted (0,-.1*uy)); label.bot(textext(" $a$ "),B shifted (0,-.17*uy));
draw (BB shifted (.1*ux,0))--(BB shifted (-.1*ux,0)); label.lft(textext(" $f(a)$ "),BB shifted (-.17*ux,0));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Droite tournée
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path r;

r:=q rotatedaround(A,38);

draw r withcolor 0.2white;%bleu_f;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mh et sa verticale
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair C;

C:=(3.25*ux,2.4*uy);

draw C withpen pencircle scaled 3bp;

label.ulft(textext(" $M_{h}$ "),C shifted (-.1*ux,.1*uy));


pair D,DD;

D:=C yscaled0;
DD:=C xscaled0;

draw C--D dashed evenly;
draw C--DD dashed evenly;


draw (D shifted (0,.1*uy))--(D shifted (0,-.1*uy)); label.bot(textext(" $a+h$ "),D shifted (0,-.1*uy));
draw (DD shifted (.1*ux,0))--(DD shifted (-.1*ux,0)); label.lft(textext(" $f(a+h)$ "),DD shifted (-.1*ux,0));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% La flèche
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

pair E; % point de départ de la flèche
pair F; % point d'arrivée de la flèche

E=(3.5*ux,2.7*uy); F=E rotatedaround(A,-10);

drawarrow E{dir(-60+angle (E))}..{dir(-110+angle (F))}F dashed evenly withpen pencircle scaled 0.6bp withcolor 0.2white;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% triangle caractéristique
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path pp,qq; pair G,AA;
AA:=A shifted(10*ux,0);
pp:=BB--AA;  qq:=C--D;
G:=(pp intersectionpoint qq);

drawdblarrow G shifted(0.2*ux,0)--C shifted(0.2*ux,0) withcolor 0.3white;
drawdblarrow G shifted(0,-0.2*uy)--A shifted(0,-0.2*uy) withcolor 0.3white;
label.rt(textext(" $\Delta y$ "),((C+G)/2)shifted(0.3*ux,0)) withcolor 0.3white;
label.bot(textext(" $\Delta x$ "),((A+G)/2)shifted(0,-0.3*uy))withcolor 0.3white;

draw A--G dashed evenly;
draw A withpen pencircle scaled 3bp;
endfig;

end