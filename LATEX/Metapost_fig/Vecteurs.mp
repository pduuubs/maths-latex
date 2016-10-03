prologues:=2;
verbatimtex
etex
input constantes;
input papiers;
%% MACROS
%% define draw_mark (crossmarks on lines) and similar angle marking operations
%%
%% These macros are stolen from mpman.ps and manfig.mp
marksize:=4pt; % how big the tics on lines are
 % how big the arc in an angle is. We define it using := rather than = so that
% it can easily be overridden later if desired.
default_angle_radius:=28pt;
angle_radius:=default_angle_radius ;

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
%idem mais ne trace pas le chemin.
def marked(expr p, n) =
  begingroup
  save amid;
  amid = .5*arclength p;
  for i=-(n-1)/2 upto (n-1)/2:
    draw_mark(p, amid+.6marksize*i);
  endfor
  %draw p;
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
  %label (btex texts etex , lc ); %marche pas...

  endgroup
enddef;

def mark_rt_angle(expr a, b, c) =
  draw ((1,0)--(1,1)--(0,1))
         zscaled (angle_radius*unitvector(a-b)) shifted b
  % not sure what zscaled means
       enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


       beginfig(1)
	 papiercinq((0,0),(3,3),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  A:=(1,5)*u; B:=(2,2)*u;
  C:=(4,4)*u; D:=(5,1)*u;
  %p=(-1.2,0.5)*u--(1.2,0.5)*u rotated 60;
  %E:=(-0.5,0)*u; F:=(0.5,0.5)*u;
  %I:=(-1,-0.25)*u; J:=(1,0.75)*u;
  %drawarrow A--B;
  %drawarrow C--D;
  %drawarrow I--J;
  %mark_angle(B,E,J,0);
  %mark_angle(D,F,J,0);
  dotlabel.llft(btex $A$ etex, A);
  dotlabel.bot(btex $B$ etex, B);
  dotlabel.top(btex $C$ etex, C);
  dotlabel.rt(btex $D$ etex, D);
endfig;
beginfig(2)  
 	 papiercinq((0,0),(3,3),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  A:=(2,5)*u; B:=(1,1)*u;
  C:=(4,5)*u; D:=(5,1)*u;
  %p=(-1.2,0.5)*u--(1.2,0.5)*u rotated 60;
  %E:=(-0.5,0)*u; F:=(0.5,0.5)*u;
  %I:=(-1,-0.25)*u; J:=(1,0.75)*u;
  %drawarrow A--B;
  %drawarrow C--D;
  %drawarrow I--J;
  %mark_angle(B,E,J,0);
  %mark_angle(D,F,J,0);
  dotlabel.llft(btex $A$ etex, A);
  dotlabel.bot(btex $B$ etex, B);
  dotlabel.top(btex $C$ etex, C);
  dotlabel.rt(btex $D$ etex, D);
endfig;
beginfig(3) 
 papiercinq((0,0),(3,3),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  A:=(2,5)*u; B:=(1,1)*u;
  C:=(5,5)*u; D:=(4,1)*u;
  %p=(-1.2,0.5)*u--(1.2,0.5)*u rotated 60;
  %E:=(-0.5,0)*u; F:=(0.5,0.5)*u;
  %I:=(-1,-0.25)*u; J:=(1,0.75)*u;
  %drawarrow A--B;
  %drawarrow C--D;
  %drawarrow I--J;
  %mark_angle(B,E,J,0);
  %mark_angle(D,F,J,0);
  dotlabel.llft(btex $A$ etex, A);
  dotlabel.bot(btex $B$ etex, B);
  dotlabel.top(btex $C$ etex, C);
  dotlabel.rt(btex $D$ etex, D);
  
endfig;
beginfig(4)  %%%% Placer D tel que AB=u+CD
  papiercinq((0,0),(3,3),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  A:=(3,5)*u; B:=(2,1)*u;
  C:=(4,3)*u; D:=(4,1)*u;
  %p=(-1.2,0.5)*u--(1.2,0.5)*u rotated 60;
  E:=(4,4)*u; F:=(1,2)*u;
  %I:=(-1,-0.25)*u; J:=(1,0.75)*u;
  drawarrow E--F;
  label.top(btex $\vec{u}$ etex, 0.5[E,F]);
  %drawarrow C--D;
  %drawarrow I--J;
  %mark_angle(B,E,J,0);
  %mark_angle(D,F,J,0);
  dotlabel.urt(btex $A$ etex, A);
  dotlabel.bot(btex $B$ etex, B);
  dotlabel.urt(btex $C$ etex, C);
  %dotlabel.rt(btex $D$ etex, D);
endfig;

beginfig(5)    %%%% Placer D tel que AB=u+CD
  papiercinq((0,0),(3,3),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  A:=(2,5)*u; B:=(2,1)*u;
  C:=(5,5)*u; D:=(4,1)*u;
  %p=(-1.2,0.5)*u--(1.2,0.5)*u rotated 60;
  E:=(1,4)*u; F:=(4,3)*u;
  %I:=(-1,-0.25)*u; J:=(1,0.75)*u;
  drawarrow E--F;
  label.top(btex $\vec{u}$ etex, 0.5[E,F]);
  %drawarrow C--D;
  %drawarrow I--J;
  %mark_angle(B,E,J,0);
  %mark_angle(D,F,J,0);
  dotlabel.ulft(btex $A$ etex, A);
  dotlabel.bot(btex $B$ etex, B);
  dotlabel.urt(btex $C$ etex, C);
  %dotlabel.rt(btex $D$ etex, D);
endfig;
beginfig(6)  %%%% Placer D tel que AB=u+CD
  papiercinq((0,0),(3,3),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  A:=(5,1)*u; B:=(2,1)*u;
  C:=(5,5)*u; D:=(4,1)*u;
  %p=(-1.2,0.5)*u--(1.2,0.5)*u rotated 60;
  E:=(1,4)*u; F:=(4,3)*u;
  %I:=(-1,-0.25)*u; J:=(1,0.75)*u;
  drawarrow F--E;
  label.top(btex $\vec{u}$ etex, 0.5[E,F]);
  %drawarrow C--D;
  %drawarrow I--J;
  %mark_angle(B,E,J,0);
  %mark_angle(D,F,J,0);
  dotlabel.urt(btex $A$ etex, A);
  dotlabel.bot(btex $B$ etex, B);
  dotlabel.urt(btex $C$ etex, C);
  %dotlabel.rt(btex $D$ etex, D);
 
endfig;
beginfig(7)  %%% Pour le module ku
  papiercinq((0,0),(15,2.5),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  A:=(1,2)*u; B:=(5,4)*u;
  C:=(4,1)*u; D:=(12,5)*u;
 
  E:=(15,4)*u; F:=(9,1)*u;
  %I:=(-1,-0.25)*u; J:=(1,0.75)*u;
  drawarrow A--B;
  drawarrow C--D;
  drawarrow E--F;
  label.top(btex $\vec{u}$ etex, 0.5[A,B]);
  label.top(btex $2\vec{u}$ etex, 0.5[C,D]);
  label.ulft(btex $-1,5\vec{u}$ etex, 0.5[E,F]);
  
endfig;
beginfig(8)  %%% Activité ku
papiercinq((0,0),(15,4),orange);
%de en bas à gauche à en haut à droite en cm.
 u:=0.5cm; %angle_radius:=0.4default_angle_radius ;
  pair A,B,C,D,E,F,I,J,K;
  path p,q,r;
  K:=(15,4)*u;
  A:=(1,7)*u; B:=(3,7)*u;
  C:=(1,4)*u; D:=(4,6)*u;
 
  E:=(3,1)*u; F:=(1,3)*u;
  
  %I:=(0,-0.25)*u; %J:=(1,0.75)*u;
  drawarrow A--B  withpen pencircle scaled 1.2pt;
  drawarrow C--D;
  drawarrow E--F;
  drawarrow ((0,0)--(4,0)*u) shifted (4*u,1*u) withpen pencircle scaled 1.2pt;
  drawarrow ((0,0)--(0,2)*u) shifted (4*u,2*u) withpen pencircle scaled 1.2pt;
  label.top(btex $\vec{u}$ etex, 0.5[A,B]);
  label.top(btex $\vec{v}$ etex, 0.5[C,D]);
  label.top(btex $\vec{w}$ etex, 0.5[E,F]);
  label.bot(btex $\vec{\imath}$ etex, (2,0)*u shifted (4*u,1*u));
  label.lft(btex $\vec{\jmath}$ etex, (0,1)*u shifted (4*u,2*u));
  dotlabel.llft(btex $A$ etex, K);
  dotlabel.llft(btex $O$ etex, K+(7*u,-u));
  
endfig;
beginfig(9)  
endfig;
beginfig(10) 
endfig;

beginfig(11)  
endfig;
beginfig(12) 
endfig;


    end