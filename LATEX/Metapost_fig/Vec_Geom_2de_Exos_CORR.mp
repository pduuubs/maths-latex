prologues:=2;
verbatimtex
etex
%% MACROS
%% define draw_mark (crossmarks on lines) and similar angle marking operations
%%
%% These macros are stolen from mpman.ps and manfig.mp
marksize:=4pt; % how big the tics on lines are
 % how big the arc in an angle is. We define it using := rather than = so that
% it can easily be overridden later if desired.
default_angle_radius:=28pt;
angle_radius:=0.2*default_angle_radius ;

% don't use this; it is used by draw_marked. Use that instead.
def draw_mark(expr p, a) =
  begingroup
  save t, dm; pair dm;
  t = arctime a of p;
  dm = marksize*unitvector direction t of p
    rotated 90;
  draw (-.5dm.. .5dm) shifted point t of p;
  endgroup
enddef;

% draws n tics in the middle of path p
def draw_marked(expr p, n) =
  begingroup
  save amid;
  amid = .5*arclength p;
  for i=-(n-1)/2 upto (n-1)/2:
    draw_mark(p, amid+.6marksize*i);
  endfor
  draw p;
  endgroup
enddef;

% draw an angle arc and label it with n tics.
def mark_angle(expr a, b, c, n) =
  begingroup
  save s, p; path p;
  p = unitvector(a-b){(a-b)rotated 90}..unitvector(c-b);
  s = .9marksize/length(point 1 of p - point 0 of p);
  if s<angle_radius: s:=angle_radius; fi
  draw_marked(p scaled s shifted b, n);
  endgroup
enddef;

% written by DJCM mar 2003
% just like mark_angle but in addition to the n tics also add the
%   label "texts" which is typically           something like    btex $\alpha$ etex
%   at a sensible location near the arc.
default_label_distance_factor := 2.3 ;
label_distance_factor := default_label_distance_factor ;
def label_angle(expr a, b, c, n, texts ) =
  begingroup
  save s, p; path p;
  p = unitvector(a-b){(a-b)rotated 90}..unitvector(c-b);
  % the clever notation (x){y}..(z) forces the curve x..z to have tangent y at x.
  % (x)..(z) would make the simplest curve from x to z, namely a straight line.
  s = .9marksize/length(point 1 of p - point 0 of p);
  if s<angle_radius: s:=angle_radius; fi
  draw_marked(p scaled s shifted b, n);

  save lc ; pair lc ; % label coordinates added by DJCM
  ldfs := label_distance_factor*s ;
  lc = point 0.5 of ( p scaled ldfs shifted b ) ;
  label ( texts , lc );

  endgroup
enddef;

def mark_rt_angle(expr a, b, c) =
  draw ((1,0)--(1,1)--(0,1))
         zscaled (angle_radius*unitvector(a-b)) shifted b
  % not sure what zscaled means
enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(1);
u:=1.3cm;
pair A[];
  A[0]:=(0,0)*u; %A
  A[1]:=( 5,0)*u; %B
  A[2]:=( 1, 3.4)*u;  %C
  A[3]:=A0+2/3(A[1]-A[0]); %I
  A[4]:=A0+3/4(A[2]-A[0]);%J
  A[5]:=A1+3/5(A[2]-A[1]);% K
  A6:=A[3]+0.5*(A[2]-A[3]);%G
  
  draw A[0]--A[1]--A[2]--cycle withpen pencircle scaled 0.8bp;
  draw A[2]--A[3];%
  draw A[0]--A[5] dashed evenly withpen pencircle scaled 0.2bp;
  draw A[1]--A[4] dashed evenly withpen pencircle scaled 0.2bp;
  draw_marked(A2--A6,1);
  draw_marked(A3--A6,1);
%%
  label.llft(btex $A$ etex, A[0]);
  label.lrt(btex $B$ etex, A[1]);
  label.top(btex $C$ etex, A[2]);
  dotlabel.bot(btex $I$ etex, A[3]);
  dotlabel.lft(btex $J$ etex, A[4]);
  dotlabel.urt(btex $K$ etex, A[5]);
  dotlabel.bot(btex $G$ etex, A[6]);
  dotlabel.bot(btex  etex,A0+1/3(A[1]-A[0]));
  dotlabel.bot(btex  etex,A0+1/4(A[2]-A[0]));
  dotlabel.bot(btex  etex,A0+1/2(A[2]-A[0]));
  dotlabel.bot(btex  etex,A1+1/5(A[2]-A[1]));
  dotlabel.bot(btex  etex,A1+2/5(A[2]-A[1]));
  dotlabel.bot(btex  etex,A1+4/5(A[2]-A[1]));
  
endfig;

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
pickup pencircle scaled 0.3bp;   
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
    pickup pencircle scaled 1.3bp;
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


beginfig(2);

  xmin=-2;      % 
  xmax=6;       % 
  xscl=1;         %
  ymin=-2;        % 
  ymax=4;         % 
  yscl=1;         %
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  axes(xmin,xmax,ymin,ymax);
  grad(xscl,yscl,xmin,xmax,ymin,ymax);
  vecunit;

  
  dotlabel.urt(btex $A$ etex, (1,3)*u);
  dotlabel.lrt(btex $B$ etex,(3,-1)*u );
  dotlabel.urt(btex $C$ etex, (5,1)*u);
  dotlabel.lrt(btex $I$ etex, (4,0)*u);
  dotlabel.urt(btex $J$ etex, (3,2)*u);
  dotlabel.urt(btex $K$ etex, (2,1)*u);
  dotlabel.urt(btex $G$ etex, (3,1)*u);

  draw (1,3)*u--(3,-1)*u--(5,1)*u--cycle withpen pencircle scaled 0.8bp;

  
endfig;
end