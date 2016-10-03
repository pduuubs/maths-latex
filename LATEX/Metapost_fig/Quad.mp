
prologues:=2;
verbatimtex %\input Modele%
etex



  u := 1cm;   % Unité
  pi=3.14159265859;
  % 
    def axes(expr xmin,xmax,ymin,ymax) =
    pickup pencircle scaled 1bp;   
    draw ( (xmin,0) -- (xmax,0) ) scaled u ; 
    draw ( (0,ymin) -- (0,ymax) ) scaled u;
  enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  def grad(expr xscl,yscl,xmin,xmax,ymin,ymax)=
pickup pencircle scaled 0.15bp;   
%% grad sur Ox
    for i=0 step xscl until xmax:
      draw (i,ymin)*u--(i,ymax)*u;
  endfor;
   for i=0 step -xscl until xmin:
      draw (i,ymin)*u--(i,ymax)*u;
  endfor;
%% grad sur Oy
  for i=0 step yscl until ymax:
    draw (xmin,i)*u--(xmax,i)*u;
  endfor;
   for i=0 step -yscl until ymin:
     draw (xmin,i)*u--(xmax,i)*u;
  endfor;
enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
  def vecunit =
    pickup pencircle scaled 1.5bp;
    ahangle:=20;            %angle au sommet de la flèche
    %ahlength:=0.8*ahlength; %longueur de la pointe de flèche
    drawarrow  (( 0,0) -- (0.95,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,0.95) ) scaled u ;  % vecteurj
    label.llft(btex $O$ etex, (-0.1,-0.1)*u);         % Place la lettre O en bas à gauche de (0,0)
label.bot(btex i etex, (0.35,-0.1)*u);  
label.lft(btex j etex, (-0.25,0.5)*u);
    %label.bot(btex $\overrightarrow{i}$ etex, (0.5,0)*u);  
    %label.lft(btex $\overrightarrow{j}$ etex, (0,0.5)*u);
  enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Reste à coller ceci dans le fichier TeX:
%%  
%%  \psfrag{i}{$\vec{\imath}$} \psfrag{j}{$\vec{\jmath}$}  \psfrag{O}{$O$} 
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 def vecunite =
    pickup pencircle scaled 1.5bp;
    ahangle:=20;            %angle au sommet de la flèche
    %ahlength:=0.8*ahlength; %longueur de la pointe de flèche
    drawarrow  (( 0,0) -- (0.95,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,0.95) ) scaled u ;  % vecteurj
    label.llft(btex $O$ etex, (-0.1,-0.1)*u);         % Place la lettre O en bas à gauche de (0,0)
label.bot(btex $\vi$ etex, (0.35,-0.1)*u);  
label.lft(btex $\vj$ etex, (-0.25,0.5)*u);
    %label.bot(btex $\overrightarrow{i}$ etex, (0.5,0)*u);  
    %label.lft(btex $\overrightarrow{j}$ etex, (0,0.5)*u);
  enddef;

beginfig(1)

  xmin=-4;      % 
  xmax=4;       % 
  xscl=1;         %
  ymin=-4;        % 
  ymax=4;         % 
  yscl=1;         %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;

beginfig(2);
  xmin:=-5;      % 
  xmax:=3;       % 
  xscl:=1;         %
  ymin:=-6;        % 
  ymax:=2;         % 
  yscl:=1;         %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;
beginfig(3); %CC-1S-2005
  xmin:=-2;      % 
  xmax:=6;       % 
  xscl:=1;         %
  ymin:=-5;        % 
  ymax:=5;         % 
  yscl:=1;         %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;
endfig;
beginfig(4); %CC-1S-2005
  xmin:=-2;      % 
  xmax:=2;       % 
  xscl:=1;         %
  ymin:=-1;        % 
  ymax:=3;         % 
  yscl:=2;         %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunite;
endfig;
end