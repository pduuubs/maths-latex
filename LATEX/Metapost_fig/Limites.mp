
prologues:=2;
verbatimtex %\input Modele%
% \documentclass{article}
%  \usepackage[latin1]{inputenc}
%  \usepackage[frenchb]{babel}
%  \usepackage{amsmath}
%  \begin{document}
etex
%input constantes;
%input papiers;

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



  u := 1cm; v=u;   % Unit�
  pi:=3.14159265859;
  % 
    def axes(expr xmin,xmax,ymin,ymax) =
    pickup pencircle scaled 0.5pt;
    draw ( (xmin,0) -- (xmax,0) ) scaled u ; 
    draw ( (0,ymin) -- (0,ymax) ) scaled v;
  enddef;
  def axesfleches(expr xmin,xmax,ymin,ymax) =
    pickup pencircle scaled 0.5pt;
    drawarrow ( (xmin,0) -- (xmax,0) ) scaled u ; 
    drawarrow ( (0,ymin) -- (0,ymax) ) scaled v;
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
    ahangle:=30;            %angle au sommet de la fl�che
    ahlength:=0.9*ahlength; %longueur de la pointe de fl�che
    drawarrow  (( 0,0) -- (1,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,1) ) scaled v ;  % vecteurj
    label.llft(btex $O$ etex, (0,0));         % Place la lettre O en bas � gauche de (0,0)
    %label.bot(btex $\vec{\imath}$ etex, (0.35,0)*u);  
    %label.lft(btex $\overrightarrow{j}$ etex, (-0.15,0.5)*v);
    label.bot(btex $i$ etex, (0.35,0)*u);
    label.lft(btex $j$ etex, (-0.15,0.5)*v);
    %On colle ensuite dans le .tex:
    %\psfrag{O}{$O$} \psfrag{i}{$\vi$}   \psfrag{j}{$\vj$}
    

    
  enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  def vecunitaire = %pareil mais sans les psfrag
    pickup pencircle scaled 0.7pt;
    ahangle:=30;            %angle au sommet de la fl�che
    ahlength:=0.8*ahlength; %longueur de la pointe de fl�che
    drawarrow  (( 0,0) -- (1,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,1) ) scaled v ;  % vecteurj
    label.llft(btex $O$ etex, (0,0));         % Place la lettre O en bas � gauche de (0,0)
    label.bot(btex $\vec{\imath}$ etex, (0.35,0)*u);  
    label.lft(btex $\vec{\jmath}$ etex, (-0.15,0.5)*v);
    
  enddef;
  %%%%%%%%%%%%%
  def courbe(suffix f)(expr xmin, xmax, M) =
    draw ( ( xmin*u, (f(xmin))*v )
        for i=1 upto M:
    ..( (xmin + (i/M)*(xmax - xmin))*u, (f( xmin + (i/M)*(xmax - xmin) ))*v)
  endfor ) ;
enddef;
%%%%

%%%
  def relie_pts(suffix f)(expr xmin, xscl, N) =
  draw ( ( xmin*u, (f(xmin))*v )%
    for i=1 upto N:%
      --( (xmin + i*xscl)*u, (f( xmin + i*xscl) )*v)
    endfor ) dashed evenly ;
  
 for i=0 upto N:%
       dotlabel(btex $$ etex ,((xmin + i*xscl)*u, (f( xmin + i*xscl) )*v));

%(xmin + i*xscl)*u, (f( xmin + i*xscl) ))*v);
    endfor;
  
enddef;


%%
%%###########################################################
%%



beginfig(1)
%vardef est n�c�ssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = mexp(-256*x)-1 enddef;        % Ici on d�finit f(x)
  vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on d�finit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%                                          %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degr�s  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degr�s             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On r�gle la fen�tre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
i=1;
  xmin=-2;      % 
  xmax=6.3;       % 
  xscl=1;         %
  ymin=-1;        % 
  ymax=7;         % 
  yscl=1;         %
  Nb_de_pts=50;  %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  courbe(f,xmin,xmax,Nb_de_pts );
  courbe(g,xmin,xmax,Nb_de_pts);
  vecunit;
endfig;


beginfig(1)
 % Illustre la convergence d'une suite vers l avec un tube l+/-epsilon

%vardef est n�c�ssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %vardef g(expr x) = mexp(-256*x)-1 enddef;        % Ici on d�finit f(x)
  vardef f(expr x) := 1.5*sind(x/pi*700)/x+0.7 enddef;        % Ici on d�finit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%                                          %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degr�s  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degr�s             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On r�gle la fen�tre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  u:=0.8cm;
  i:=1;
  xmin:=-0.2;      % 
  xmax:=8;       % 
  xscl:=0.3;         %
  ymin:=-0.1;        % 
  ymax:=1.9;         % 
  yscl:=2;         %
  Nb_de_pts:=10;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  pair A[];
  axesfleches(xmin,xmax+xscl,ymin,2);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  %reliepts(f,0.1,xmax,Nb_de_pts );
%  relie_pts(f,1,xscl,Nb_de_pts);
  relie_pts(f,3*xscl,xscl,((xmax-3*xscl)/xscl));
  A0=(0,0.7*v);
  A1=(0.3*u,1.8*v);
  A2=(0.6*u,1.5*v);

  A8=(xmax*u,0.7*v);
    
  draw A1--A2--(0.9*u,(f(0.9))*v) dashed evenly ;
  dotlabel(btex $$ etex ,A1);
  dotlabel(btex $$ etex ,A2);

  draw A0--A8;
  draw ((A0--A8) shifted (0,0.28*v)) dashed evenly ;
  draw ((A0--A8) shifted (0,-0.28*v)) dashed evenly ;
  label.lft(btex $\ell+\varepsilon$ etex ,A0 shifted (0,0.28*v));
  label.lft(btex $\ell$ etex ,A0);
  label.lft(btex $\ell-\varepsilon$ etex ,A0 shifted (0,-0.28*v));
  draw (((0,0)--(0,0.98*v)) shifted (16*xscl*u,0));
  label.bot(btex $p$ etex ,(16*xscl*u,0));
  label.bot(btex $n$ etex ,(xmax*u,0));
  label.lft(btex $u_n$ etex ,(0,ymax*v));
  %courbe(f,xmin,xmax,Nb_de_pts);
  %vecunit;
endfig;
beginfig(2)
% Illustre le th des gendarmes pour fct avec un tube l+/-epsilon

%vardef est n�c�ssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef g(expr x) =  1/(0.7*x)+0.72 enddef;        % Ici on d�finit f(x)
  vardef f(expr x) := 70*sind(x/pi*700)/(12*x*x)+0.7 enddef;        % Ici on d�finit g(x)
 vardef h(expr x) :=  -1/(1.5*x)+0.62 enddef; 
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%                                          %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degr�s  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degr�s             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On r�gle la fen�tre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
 u:=1.2cm;
 v:=1.8cm;
  i:=1;
  xmin:=-0.2;      % 
  xmax:=10;       % 
  xscl:=0.3;         %
  ymin:=-0.1;        % 
  ymax:=1.9;         % 
  yscl:=2;         %
  Nb_de_pts:=20;  %
M:=20;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  pair A[];path p[];
  axesfleches(xmin,xmax+xscl,ymin,2.3);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  %reliepts(f,0.1,xmax,Nb_de_pts );
%  relie_pts(f,1,xscl,Nb_de_pts);
  %relie_pts(f,3*xscl,xscl,((xmax-3*xscl)/xscl));
%  courbe(f,3*xscl,xscl,((xmax-3*xscl)/xscl));
  courbe(f,1.8,xmax,100 );
  %courbe(g,1.1,xmax,Nb_de_pts );
  courbe(h,0.6,xmax,Nb_de_pts );

  xmin:=2;

p1=( (0.6u,0.6v){dir 60}..( xmin*u, (g(xmin))*v )
        for i=1 upto M:
    ..( (xmin + (i/M)*(xmax - xmin))*u, (g( xmin + (i/M)*(xmax - xmin) ))*v)
  endfor ) ;
  draw p1;
  A0=(0,0.7*v);
  %A1=(0.3*u,1.8*v);
  %A2=(0.6*u,1.5*v);

  A8=(xmax*u,0.7*v);
    
  %draw A1--A2--(0.9*u,(f(0.9))*v) dashed evenly ;
  %dotlabel(btex $$ etex ,A1);
  %dotlabel(btex $$ etex ,A2);

  draw A0--A8;
  draw ((A0--A8) shifted (0,0.28*v)) dashed evenly ;
  draw ((A0--A8) shifted (0,-0.28*v)) dashed evenly ;
  label.lft(btex $\ell+\varepsilon$ etex ,A0 shifted (0,0.28*v));
  label.lft(btex $\ell$ etex ,A0);
  label.lft(btex $\ell-\varepsilon$ etex ,A0 shifted (0,-0.28*v));
  
  label.bot(btex $x$ etex ,(xmax*u,0));
  label.lft(btex $y$ etex ,(0,ymax*v));

  label.rt(btex $C_f$ etex ,(2.1*u,2v));
  label.top(btex $C_g$ etex ,(0.9*u,1.2v));
  label.lft(btex $C_h$ etex ,(0.7*u,-0.3v));
endfig;



end