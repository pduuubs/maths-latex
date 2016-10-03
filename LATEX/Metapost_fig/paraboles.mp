
prologues:=2;
verbatimtex %\input Modele%
etex
input constantes;
input papiers;



  u := 0.5cm;   % Unité
  pi:=3.14159265859;
  % 
    def axes(expr xmin,xmax,ymin,ymax) =
      pickup pencircle scaled 0.5pt;
      ahangle:=30;            %angle au sommet de la flèche
    ahlength:=0.9*ahlength;
    drawarrow ( (xmin,0) -- (xmax,0) ) scaled u ; 
    drawarrow ( (0,ymin) -- (0,ymax) ) scaled u;
  enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  def grad(expr xscl,yscl,xmin,xmax,ymin,ymax)=
    pickup pencircle scaled 0.5pt;
%% grad sur Ox
    for i=0 step xscl until xmax:
      draw (i,1/15)*u--(i,-1/15)*u;
  endfor;
   for i=0 step -xscl until xmin:
      draw (i,1/15)*u--(i,-1/15)*u;
  endfor;
%% grad sur Oy
  for i=0 step yscl until ymax:
    draw (1/15,i)*u--(-1/15,i)*u;
  endfor;
   for i=0 step -yscl until ymin:
     draw (1/15,i)*u--(-1/15,i)*u;
  endfor;
enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  def vecunit =
    pickup pencircle scaled 1pt;
    ahangle:=30;            %angle au sommet de la flèche
    ahlength:=0.9*ahlength; %longueur de la pointe de flèche
    drawarrow  (( 0,0) -- (1,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,1) ) scaled u ;  % vecteurj
    label.llft(btex $O$ etex, (0,0));         % Place la lettre O en bas à gauche de (0,0)
    %label.bot(btex $\overrightarrow{i}$ etex, (0.5,0)*u);  
    %label.lft(btex $\overrightarrow{j}$ etex, (0,0.5)*u);
    label.bot(btex $i$ etex, (0.35,0)*u);
    label.lft(btex $j$ etex, (-0.15,0.5)*u);
    %On colle ensuite dans le .tex:
    %\psfrag{O}{$O$} \psfrag{i}{$\vi$}   \psfrag{j}{$\vj$}
    

    
  enddef;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  def courbe(suffix f)(expr xmin, xmax, M) =
    draw ( ( xmin, f(xmin) )
        for i=1 upto M:
    ..( xmin + (i/M)*(xmax - xmin), f( xmin + (i/M)*(xmax - xmin) ))
  endfor ) scaled u;
enddef;


beginfig(1)
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = (x-1)**2-1.5 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

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
  xmax=3;       % 
  xscl=1;         %
  ymin=-2;        % 
  ymax=3;         % 
  yscl=1;         %
  Nb_de_pts=20;  %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  %grad(xscl,yscl,xmin,xmax,ymin,ymax);
  courbe(f,-1.1,xmax,Nb_de_pts );
  %courbe(g,xmin,xmax,Nb_de_pts);
  %vecunit;
endfig;

beginfig(2)
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = -(x**2)+x+2 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

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
i:=1;
  xmin:=-2;      % 
  xmax:=3;       % 
  xscl:=1;         %
  ymin:=-2;        % 
  ymax:=3;         % 
  yscl:=1;         %
  Nb_de_pts:=20;  %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  %grad(xscl,yscl,xmin,xmax,ymin,ymax);
  courbe(f,-1.5,2.4,Nb_de_pts );
  %courbe(g,xmin,xmax,Nb_de_pts);
  %vecunit;
endfig;

beginfig(3)
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = (x-1)**2 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

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
i:=1;
  xmin:=-1;      % 
  xmax:=4;       % 
  xscl:=1;         %
  ymin:=-1;        % 
  ymax:=4;         % 
  yscl:=1;         %
  Nb_de_pts:=20;  %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  %grad(xscl,yscl,xmin,xmax,ymin,ymax);
  courbe(f,-0.9,3,Nb_de_pts );
  %courbe(g,xmin,xmax,Nb_de_pts);
  %vecunit;
endfig;




beginfig(4)
%vardef est nécéssaire pour pouvoir passer f en argument
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  vardef f(expr x) = -(0.8(x-1)**2)-0.5 enddef;        % Ici on définit f(x)
  %vardef g(expr x) = cosd(x/pi*180) enddef;        % Ici on définit g(x)

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
i:=1;
  xmin:=-2;      % 
  xmax:=3;       % 
  xscl:=1;         %
  ymin:=-4;        % 
  ymax:=1;         % 
  yscl:=1;         %
  Nb_de_pts:=20;  %
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  %grad(xscl,yscl,xmin,xmax,ymin,ymax);
  courbe(f,-1.3,xmax,Nb_de_pts );
  %courbe(g,xmin,xmax,Nb_de_pts);
  %vecunit;
endfig;
beginfig(5) %Famille de paraboles, chute des corps
u := 1cm;
  v=3; %vitesse initiale
  %a=45; %angle
   pickup pencircle scaled 0.5pt;
  for a=10 step 10 until 89:
    %pickup pencircle scaled 0.5pt;
    %draw (0,0){dir a}..(v*v*sind(a)*cosd(a)*u,0.5*v*v*sind(a)*sind(a)*u)..(2*sind(a)*cosd(a)*v*v*u,0){dir -a};
    xmax:=2*sind(a)*cosd(a)*v*v;
    %ymax:=0.5*v*v*sind(a)*sind(a)*u;
    vardef f(expr x) = x*sind(a)/cosd(a) -x*x/(2*(v*cosd(a))**2) enddef;  
    courbe(f,0,2*xmax,20);
    %courbe(f,xmax,2*xmax,10);
  endfor;
  pickup pencircle scaled 1.5pt;
  a=45;
  xmin:=0;
  xmax:=4*sind(a)*cosd(a)*v*v;
  ymax:=v*v*sind(a)*sind(a)*u;
  vardef f(expr x) = x*sind(a)/cosd(a) -x*x/(2*(v*cosd(a))**2) enddef; 
  M:=20;
draw ( ( xmin, f(xmin) )
        for i=1 upto M:
    ..( xmin + (i/M)*(xmax - xmin), f( xmin + (i/M)*(xmax - xmin) )) 
  endfor ) scaled u;
 drawarrow (0,0)--(xmax*1.02*u,0);
    drawarrow (0,0)--(0,2*ymax*1.05);
 
endfig;
beginfig(6) %Famille de paraboles, chute des corps sans courbe, juste des splines
u := 1cm;
  v:=3; %vitesse initiale
  %a=45; %angle
   pickup pencircle scaled 0.5pt;
  for a=2.5 step 5 until 89:
    pickup pencircle scaled 0.2pt;
    xmax:=4*sind(a)*cosd(a)*v*v*u;
    ymax:=v*v*sind(a)*sind(a)*u;
    draw (0,0){dir a}...(0.5*xmax,ymax)...(xmax,0){dir -a};
    
    endfor;
    a:=45;
    pickup pencircle scaled 1.2pt;
    xmax:=4*sind(a)*cosd(a)*v*v*u;
    ymax:=v*v*sind(a)*sind(a)*u;
    draw (0,0){dir a}...(0.5*xmax,ymax)...(xmax,0){dir -a} dashed evenly;
    drawarrow (0,0)--(xmax*1.02,0);
    drawarrow (0,0)--(0,2*ymax*1.05);
endfig;

beginfig(7) % Translations 
  u := 2cm;
  path p[];
  transform T;
    pickup pencircle scaled 0.5pt;
  
    p0=((-2,4)...(-1,1)...(-0.5,0.25)...(0,0)...(0.5,0.25)...(1,1)...(2,4))scaled u;
    %parabole y=x² de -2 à 2
  draw p0;
  T=identity shifted (-2*u,1*u);
  p1=p0 transformed T;
  draw p1;

  T:=identity yscaled -1 shifted (-1*u,-2*u);
  p2=p0 transformed T;
  draw p2;
drawarrow (-3*u,0)--(3*u,0);
drawarrow (0,-6)*u--(0,6)*u; 
endfig;

beginfig(8) %Famille des y=k.x²
  u := 2cm;
  numeric k, kmax;
  path p[];
 kmax=1.6;
  transform S;
  
    pickup pencircle scaled 2pt;
  
    p0=((-2,4)...(-1,1)...(-0.5,0.25)...(0,0)...(0.5,0.25)...(1,1)...(2,4))scaled u;
    %parabole y=x² de -2 à 2
    draw p0;
    p1=p0; 
    S=identity yscaled -1;
    p2=p0 transformed S;
    draw p2 dashed evenly scaled 2;
    pickup pencircle scaled 0.5pt;
   for k=0.1 step 0.2 until kmax:
  p1:=p0 yscaled k;
  draw p1;
  
  label.rt(btex $k=$ etex, (2,k*4)*u); %btex $k=$ etex
  label.rt(btex $k=$ etex, (2,-k*4)*u);
  p2:=p1 transformed S;
  
  draw p2;
endfor;
label.rt(btex $k=$ etex, (2,4)*u); %btex $k=$ etex
  label.rt(btex $k=$ etex, (2,-4)*u);
%draw TEX("$k=" & decimal(k) & "$");
pickup pencircle scaled 1.5pt;
drawarrow (-2*u,0)--(2*u,0);
drawarrow (0,-4*kmax)*u--(0,4*kmax)*u;

endfig;



end