
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



  u := 1cm; v=u;   % Unité
  pi:=3.14159265859;
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
    label.llft(btex $O$ etex, (0,0));         % Place la lettre O en bas à gauche de (0,0)
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
    ahangle:=30;            %angle au sommet de la flèche
    ahlength:=0.8*ahlength; %longueur de la pointe de flèche
    drawarrow  (( 0,0) -- (1,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,1) ) scaled v ;  % vecteurj
    label.llft(btex $O$ etex, (0,0));         % Place la lettre O en bas à gauche de (0,0)
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


beginfig(1)
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = mexp(-256*x)-1 enddef;        % Ici on définit f(x)
  vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%                                          %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
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

beginfig(2); %Parabole
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = x**2 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-2.5;      % 
  xmax:=2.5;       % 
  xscl:=1;         %
  ymin:=-1;        % 
  ymax:=6.5;         % 
  yscl:=1;         %
  Nb_de_pts:=50;  %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  courbe(f,xmin,xmax,Nb_de_pts );
 % courbe(g,xmin,xmax,Nb_de_pts);
  vecunit;
endfig;
beginfig(3); %Hyperbole
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = 1/x enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-5;      % 
  xmax:=-0.20;       % 
  Nb_de_pts:=50;  %
  courbe(f,xmin,xmax,Nb_de_pts );

  xmin:=0.2;      % 
  xmax:=5;       % 
  Nb_de_pts:=50;  %
  courbe(f,xmin,xmax,Nb_de_pts);

  xmin:=-5;      % 
  xmax:=5;
  xscl:=1;         %
  ymin:=-5;        % 
  ymax:=5;         % 
  yscl:=1;   
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;

beginfig(4); %Cosinus
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %vardef f(expr x) = x**2 enddef;        % Ici on définit f(x)
  vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-7;      % 
  xmax:=7;       % 
  xscl:=1;         %
  ymin:=-1.2;        % 
  ymax:=1.2;         % 
  yscl:=1;         %
  Nb_de_pts:=50;  %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  courbe(g,xmin,xmax,Nb_de_pts );
 % courbe(g,xmin,xmax,Nb_de_pts);
  vecunit;
endfig;

beginfig(5); %exp et ln
  papiermillimetre((0,0),1,1,(-4,-4),(5,5),orange);
 % papiermilli((0,0),1,1,(-2,-5),(5,5)) orange;
  vardef f(expr x) = mexp(256*x) enddef;        % Ici on définit f(x)
  vardef g(expr x) = mlog(x) enddef;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-4;      % 
  xmax:=1.6;       % 
  xscl:=1;         %
  ymin:=-1.2;        % 
  ymax:=1.2;         % 
  yscl:=1;         %
  Nb_de_pts:=50;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   courbe(f,xmin,xmax,Nb_de_pts );
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=1;      % 
  xmax:=1.5;       % 
  xscl:=1;         %
  ymin:=-4;        % 
  ymax:=5;         % 
  yscl:=1;         %
  Nb_de_pts:=5;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %courbe(g,xmin,xmax,Nb_de_pts);
  draw (0.018,-4)*u{dir 87}..(1,0)*u{dir 45}..(e,1)*u..(5,1.6094)*u;
  draw (-4,-4)*u--(5,5)*u;
  draw (1,0)*u--(1,e)*u--(0,e)*u dashed evenly;
  draw (e,0)*u--(e,1)*u--(0,1)*u dashed evenly;
  label.lrt(btex $F$ etex, (1.3,4)*u);
  label.ulft(btex $L$ etex, (4,1.5)*u);
  label.bot(btex $D$ etex, (3.5,3.5)*u);
  label.bot(btex $e$ etex, (2.6,0)*u);
  label.lft(btex $e$ etex, (-0.1,e)*u);
  
endfig;
beginfig(6); %Cube
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = x**3 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-1.6;      % 
  xmax:=1.6;       % 
  Nb_de_pts:=50;  %
  courbe(f,xmin,xmax,Nb_de_pts );

  xmin:=-2;      % 
  xmax:=2;
  xscl:=1;         %
  ymin:=-4.3;        % 
  ymax:=4.3;         % 
  yscl:=1;   
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;

beginfig(7); 
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = 0.8(x+0.4)**2-1.7 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-3;      % 
  xmax:=2.2;       % 
  Nb_de_pts:=50;  %
  courbe(f,xmin,xmax,Nb_de_pts );

  xmin:=-3;      % 
  xmax:=3;
  xscl:=1;         %
  ymin:=-2;        % 
  ymax:=3;         % 
  yscl:=1;   
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;


beginfig(8); %%Une fct pas continue
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = 0.8(x+0.4)**2-1.7 enddef;        % Ici on définit f(x)
  vardef g(expr x) = sind(x/pi*180)+1 enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-3;      % 
  xmax:=1;       % 
  Nb_de_pts:=10;  %
  courbe(f,xmin,xmax,Nb_de_pts );

  xmin:=1;      % 
  xmax:=3;       % 
  Nb_de_pts:=10;  %
  courbe(g,xmin,xmax,Nb_de_pts );

  pickup pencircle scaled 3pt;
  draw (1,sind(1/pi*180)+1)*u ;
  %pickup pencircle scaled 1pt;
  
  xmin:=-3;      % 
  xmax:=3;
  xscl:=1;         %
  ymin:=-2;        % 
  ymax:=3;         % 
  yscl:=1;   
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;

beginfig(9);  %Partie entière
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %vardef f(expr x) = 0.8(x+0.4)**2-2 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

  pickup pencircle scaled 1bp;
  path p;
    p = (1.05,0.05)*u{left} .. (u,0){down} .. (1.05,-0.05)*u{right};
    draw p;

  for n=-3 step 1  until 3:
  draw (n,n)*u--(n+1,n)*u ;
  draw (n,n)*u withpen pencircle scaled 3bp;
  %draw p shifted n(u,u);   %%pourquoi ca foire? 
  endfor;
  draw p shifted -3(u,u);
  draw p shifted -2(u,u);
  draw p shifted -(u,u);
  draw p shifted (u,u);
  draw p shifted 2(u,u);
  draw p shifted 3(u,u);


  xmin:=-3;      % 
  xmax:=4;
  xscl:=1;         %
  ymin:=-3;        % 
  ymax:=3;         % 
  yscl:=1;   
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  %vecunit;

  
endfig;

beginfig(10); 
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %vardef f(expr x) = 0.8(x+0.4)**2-1.7 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %% Def des fonctions usuelles en metapost %%
  %%      x^n=x**n                            %%
  %%  mexp(x)=exp(x/256)                      %%  
  %%  mlog(x)=ln(x/256)                       %%
  %%  cosd(x)=cos(x)  x en degrés  x/pi*180   %%
  %%  sind(x)=sin(x)  x en degrés             %%
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  draw (-3,-1)*u .. (-2,1)*u .. (-1,2.5)*u .. (0.5,1)*u{dir -45} .. (1.5,1)*u..(2,1.5)*u{dir 45};
  draw(-3,1)*u--(3,1)*u dashed evenly;
  draw(-2,1)*u withpen pencircle scaled 3bp;
  draw(0.5,1)*u withpen pencircle scaled 3bp;
  draw(1.5,1)*u withpen pencircle scaled 3bp;
  label.lrt(btex $C$ etex, (1,2)*u);
  

  xmin:=-3;      % 
  xmax:=3;
  xscl:=1;         %
  ymin:=-2;        % 
  ymax:=3;         % 
  yscl:=1;   
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;

beginfig(11); %ln
  papiermillimetre((0,0),1,1,(-1,-4),(5,2),orange);
 % papiermilli((0,0),1,1,(-2,-5),(5,5)) orange;
  %vardef f(expr x) = mexp(256*x) enddef;        % Ici on définit f(x)
  vardef g(expr x) = mlog(x) enddef;
 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=1;      % 
  xmax:=1.5;       % 
  xscl:=1;         %
  ymin:=-4;        % 
  ymax:=5;         % 
  yscl:=1;         %
  Nb_de_pts:=5;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   %courbe(g,xmin,xmax,Nb_de_pts);
  draw (0.018,-4)*u{dir 87}..(1,0)*u{dir 45}..(e,1)*u..(5,1.6094)*u;
  draw (-1,-2)*u--(3,2)*u;
  %draw (1,0)*u--(1,e)*u--(0,e)*u dashed evenly;
   draw (e,0)*u--(e,1)*u--(0,1)*u dashed evenly;
  %label.lrt(btex $F$ etex, (1.3,4)*u);
  label.ulft(btex $L$ etex, (4,1.5)*u);
  label.top(btex $T$ etex, (1,1.5)*u);
  label.bot(btex $e$ etex, (2.6,0)*u);
  %label.lft(btex $e$ etex, (-0.1,e)*u);
  
endfig;

beginfig(12); %%%DM8 1S
  papiermillimetre((0,0),1,1,(-6,-1.5),(6,1.5),orange);
 % papiermilli((0,0),1,1,(-2,-5),(5,5)) orange;
    vardef g(expr x) = 2*x/(1+x*x) enddef;
 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=-6;      % 
  xmax:=6;       % 
  xscl:=1;         %
  ymin:=-1.5;        % 
  ymax:=1.5;         % 
  yscl:=1;         %
  Nb_de_pts:=50;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
  
  draw (-0.75,-1.5)*u--(0.75,1.5)*u;
  pickup pencircle scaled 1pt;
  courbe(g,xmin,xmax,Nb_de_pts);
  label.top(btex $C$ etex, (3,0.7)*u);
  label.bot(btex $T$ etex, (1,1.5)*u);
  
  
  
endfig;

beginfig(13); %%% CC TES 2006
 
 
    vardef g(expr x) = (0.5*x*x-x+3) enddef;
 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=0;      % 
  xmax:=5;       % 
  xscl:=1;         %
  ymin:=0;        % 
  ymax:=11;         % 
  yscl:=1;         %
  Nb_de_pts:=20;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  u:=2cm; v:=0.5cm;
  axes(xmin,5.2,ymin,ymax);
  grad(xscl,yscl,xmin,5,ymin,ymax);
  %vecunit;
  %draw (-0.75,-1.5)*u--(0.75,1.5)*u;
  pickup pencircle scaled 0.5pt;
  courbe(g,1,xmax,Nb_de_pts);
  label.bot(btex $C$ etex, (4.5*u,10*v));
  label.llft(btex $O$ etex, (0*u,0y*v));

  label.bot(btex $1$ etex, (1*u,0*v));
  label.bot(btex $2$ etex, (2*u,0*v));
  label.bot(btex $3$ etex, (3*u,0*v));
  label.bot(btex $4$ etex, (4*u,0*v));
  label.bot(btex $5$ etex, (5*u,0*v));

  label.lft(btex $1$ etex, (0*u,1*v));
  label.lft(btex $5$ etex, (0*u,5*v));
  label.lft(btex $10$ etex, (0*u,10*v));
  


  label.bot(btex $q$  etex, (5.2*u,0*v));
  label.lft(btex $E(q)$ etex, (0*u,11*v));
   
  
  %label.bot(btex $T$ etex, (1,1.5)*u);
   
endfig;
beginfig(14); %%% CC TES 2006
 
 
    vardef g(expr x) = 50/((2*x+5)**2) enddef;
 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=0;      % 
  xmax:=4;       % 
  xscl:=1;         %
  ymin:=0;        % 
  ymax:=2.2;         % 
  yscl:=1;         %
  Nb_de_pts:=20;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  u:=2.5cm; v:=2.5cm;
  axes(xmin,4.15,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,2);
  vecunit;
  %draw (-0.75,-1.5)*u--(0.75,1.5)*u;
  pickup pencircle scaled 0.5pt;
  courbe(g,xmin,xmax,Nb_de_pts);
  label.top(btex $F$ etex, (3.5*u,0.4*v));

  label.bot(btex $1$ etex, (1*u,0*v));
  label.bot(btex $2$ etex, (2*u,0*v));
  dotlabel.bot(btex $2,5$ etex, (2.5*u,0*v));

  label.lft(btex $1$ etex, (0*u,1*v));
  label.lft(btex $2$ etex, (0*u,2*v));
  
  dotlabel.top(btex $C$ etex, (2.5*u,0.5*v));
  dotlabel.urt(btex $A$ etex, (0*u,2*v));
  dotlabel.urt(btex $B$ etex, (1*u,50/49*v));


    
  %label.bot(btex $T$ etex, (1,1.5)*u);
   
endfig;
beginfig(15); %%% CC3 TS 2006
 
 %demicenti((0,0),1,1,(0,-2),(4,4.5),orange);
    vardef f(expr x) = (x-1)*(2- mexp(-256*x)) enddef;
 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=0;      % 
  xmax:=4;       % 
  xscl:=1;         %
  ymin:=-2;        % 
  ymax:=4.5;         % 
  yscl:=1;         %
  Nb_de_pts:=20;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  u:=2cm; v:=2cm;
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,2);
  vecunit;
  %draw (-0.75,-1.5)*u--(0.75,1.5)*u;
  pickup pencircle scaled 0.8pt;
  courbe(f,xmin,3.3,Nb_de_pts);
%%%%%%%%%
   pickup pencircle scaled 0.2pt;
%% lignes sur Ox
    for i=0 step xscl until xmax:
      draw (i*u,ymin*v)--(i*u,ymax*v);
  endfor;
  
%% lignes sur Oy
  for i=ymin step yscl until ymax:
    draw (xmin*u,i*v)--(xmax*v,i*v);
  endfor;
  %%%%--------------
   pickup pencircle scaled 0.01pt;
%% lignes sur Ox
    for i=0 step 0.5xscl until xmax:
      draw (i*u,ymin*v)--(i*u,ymax*v) dashed evenly;
  endfor;
  
%% lignes sur Oy
  for i=ymin step 0.5yscl until ymax:
    draw (xmin*u,i*v)--(xmax*v,i*v) dashed evenly;
  endfor;
%%%%%%%%%%%  
  
  label.bot(btex $C$ etex, (1.8*u,0.8*v));
  


    
  %label.bot(btex $T$ etex, (1,1.5)*u);
   
endfig;
%%%%%%%%%%%%%%%%%
beginfig(16); %parabole Activité continuité
  path p;
  %demicenti((0,0),1,1,(0,-2),(4,4.5),orange);
    vardef f(expr x) = x*(6-x) enddef;
 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=0;      % 
  xmax:=6;       % 
  xscl:=1;         %
  ymin:=0;        % 
  ymax:=9;         % 
  yscl:=1;         %
  Nb_de_pts:=50;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  u:=1cm; v:=1cm;
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunitaire;
  %draw (-0.75,-1.5)*u--(0.75,1.5)*u;
  pickup pencircle scaled 0.8pt;
  %courbe(f,xmin,3.3,Nb_de_pts);
%%%%%%%%%
   pickup pencircle  scaled 0.4pt;
%% lignes sur Ox
    for i=0 step xscl until xmax:
      draw (i*u,ymin*v)--(i*u,ymax*v) withcolor 0.5white;
  endfor;
  
%% lignes sur Oy
  for i=ymin step yscl until ymax:
    draw (xmin*u,i*v)--(xmax*v,i*v) withcolor 0.5white;
  endfor;
 axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunitaire;
%%%
%  Tracé de la courbe

  pickup pencircle scaled 0.3pt;
  p=(0,0)...(1,5)*u...(2,8)*u...(3,9)*u...(4,8)*u...(5,5)*u...(6,0)*u;
  draw p dashed evenly;
   label.bot( btex $1$ etex, (1,0)*u);
   label.lft( btex $1$ etex, (0,1)*v);
  label.urt(btex $y=x(6-x)$ etex, (4,8)*u);


 endfig;
%%%%%%%%%%%
 
 beginfig(17); %parabole Activité continuité CORRIGE
   path p, ac, ca, dc, c;
   pair tangent;
   transform S;
  
  %demicenti((0,0),1,1,(0,-2),(4,4.5),orange);
    vardef f(expr x) = x*(6-x) enddef;
 
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      On règle la fenêtre ici       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  xmin:=0;      % 
  xmax:=6;       % 
  xscl:=1;         %
  ymin:=0;        % 
  ymax:=9;         % 
  yscl:=1;         %
  Nb_de_pts:=50;  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  u:=1cm; v:=1cm;
  
  %draw (-0.75,-1.5)*u--(0.75,1.5)*u;
 
%%%%%%%%%
   pickup pencircle  scaled 0.4pt;
%% lignes sur Ox
    for i=0 step xscl until xmax:
      draw (i*u,ymin*v)--(i*u,ymax*v) withcolor 0.5white;
  endfor;
  
%% lignes sur Oy
  for i=ymin step yscl until ymax:
    draw (xmin*u,i*v)--(xmax*v,i*v) withcolor 0.5white;
  endfor;
 axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunitaire;
%%%
%  Tracé de la courbe

  pickup pencircle scaled 0.3pt;
  p=(0,0)...(1,5)*u...(2,8)*u...(3,9)*u...(4,8)*u...(5,5)*u...(6,0)*u;
  draw p dashed evenly;
   label.bot( btex $1$ etex, (1,0)*u);
   label.lft( btex $1$ etex, (0,1)*v);
  label.urt(btex $y=x(6-x)$ etex, (4,8)*u);
%%% tracé des demicercles de discont
   S=identity reflectedabout ((3u, 2), (3u, 6)); %symétrie axiaxe en x=3

   pickup pencircle scaled 0.8pt;
   dc=halfcircle rotated 90 scaled 0.1cm shifted (0.05cm,0);

   tangent=unitvector(direction 1 of p);
   ac= dc rotated angle(tangent) shifted (1u,5u); draw ac;
   ca= dc rotated (180+angle(tangent)) shifted (1u,1u); draw ca;
   ac:= ac transformed S; draw ac;
   ca:= ca transformed S; draw ca;

   tangent:=unitvector(direction 2 of p);
   ac:= dc rotated angle(tangent) shifted (2u,4u); draw ac;
   ca:= dc rotated (180+angle(tangent)) shifted (2u,2u); draw ca;
   ac:= ac transformed S; draw ac;
   ca:= ca transformed S; draw ca;

fill fullcircle scaled 0.1cm shifted (3u,3u) withcolor white;
   draw fullcircle scaled 0.1cm shifted (3u,3u);
%%% tracé des dots ou f prend une valeur.
   
   c=fullcircle scaled 0.1cm shifted (u,0);
   fill c    withcolor black;
   for k=1 upto 4:
     c:=c shifted (u,0); fill c    withcolor black;
    endfor;
   %%for k=1 upto 6 : %xmin upto xmax:
    %if k<>0:
     %% dotlabel.bot(format("%10f",k),(0,k)*u);
    %fi;
 % endfor;
  
   %draw dc  shifted (3u,3u) transformed S;

   draw subpath (0,1) of p ;
     draw subpath (0,1) of p transformed S;
   draw subpath (1,2) of p  shifted (0,-4u) ;
     draw subpath (1,2) of p  shifted (0,-4u)transformed S;
   draw subpath (2,2.95) of p  shifted (0,-6u);
     draw subpath (2,2.95) of p  shifted (0,-6u)transformed S;
 endfig;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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



beginfig(18);

axes; label.llft(btex $0$ etex,(-.1*ux,-.15*uy));

%%%%%%%%%%%%%%%
% Courbes
%%%%%%%%%%%%%%%
path p,q;

p:=(0,0){dir10}..(3.5*ux,3*uy); q:=(.2*ux,.5*uy)--(4.5*ux,1.5*uy);

draw p withpen pencircle scaled 0.8bp;% withcolor bleu_m;


label.rt(btex $\mathscr{C}_f$ etex,(3.5*ux,3.2*uy));


%%%%%%%%%%%%%%%%%%%%%%%%%
% Point d'intersection
%%%%%%%%%%%%%%%%%%%%%%%%
pair A;

A:=(p intersectionpoint q);

draw A withpen pencircle scaled 3bp;

label.ulft(btex A etex,A shifted (.1*ux,.1*uy));


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


draw (B shifted (0,.1*uy))--(B shifted (0,-.1*uy)); label.bot(btex $a$ etex,B shifted (0,-.17*uy));
draw (BB shifted (.1*ux,0))--(BB shifted (-.1*ux,0)); label.lft(btex $f(a)$ etex,BB shifted (-.17*ux,0));


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
label.rt(btex $\Delta y$ etex,((C+G)/2)shifted(0.3*ux,0)) withcolor 0.3white;
label.bot(btex $\Delta x$ etex,((A+G)/2)shifted(0,-0.3*uy))withcolor 0.3white;

draw A--G dashed evenly;
draw A withpen pencircle scaled 3bp;
endfig;

end