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


beginfig(1)  %%%% Triangle qq 
  u:=2cm;
 angle_radius:=0.25default_angle_radius ;
pair A,B,C,D,E,F,I,J,K;
path p,q,r;
%transform T;
B:=(0.3,0.7)*u; A:=(0,0)*u; C:=(0.9,0)*u;
p=A--B--C--cycle;
draw p;
D:=(-1,0.4)*u;
label.bot(btex $A$ etex, A);
  label.top(btex $B$ etex, B);
  label.bot(btex $C$ etex, C);
  dotlabel.bot(btex $\Omega$ etex, D);
 % mark_angle(C,A,B,1);
 % mark_angle(A,B,C,2);
 % mark_angle(B,C,A,0);
 % T=identity
  draw (D+2*(A-D))--(D+2*(B-D)) withcolor white;
endfig;
beginfig(2)  %%%% Triangle qq images par des homothéties de rapports -1, 2, 1/2, -1/2
  u:=2cm;
 angle_radius:=0.25default_angle_radius ;
pair A,B,C,D,E[], F[], G[], H[];
path p,q,r;
%transform T;
B:=(0.3,0.7)*u; A:=(0,0)*u; C:=(0.9,0)*u;
p=A--B--C--cycle;
draw p;
D:=(-1,0.4)*u;
label.bot(btex $A$ etex, A);
  label.top(btex $B$ etex, B);
  label.bot(btex $C$ etex, C);
  dotlabel.bot(btex $\Omega$ etex, D);
 % mark_angle(C,A,B,1);
 % mark_angle(A,B,C,2);
 % mark_angle(B,C,A,0);
 % T=identity

  E1:=D+2*(A-D);
  dotlabel.bot(btex $A_1$ etex, E1);
  E2:=D+2*(B-D);
  dotlabel.top(btex $B_1$ etex, E2);
   E3:=D+2*(C-D);
   dotlabel.bot(btex $C_1$ etex, E3);
   draw E1--E2--E3--cycle;

    F1:=D-(A-D);
  dotlabel.top(btex $A_2$ etex, F1);
  F2:=D-(B-D);
  dotlabel.bot(btex $B_2$ etex, F2);
   F3:=D-(C-D);
   dotlabel.bot(btex $C_2$ etex, F3);
draw F1--F2--F3--cycle;

 G1:=D+0.5*(A-D);
  dotlabel.bot(btex $A_3$ etex, G1);
  G2:=D+0.5*(B-D);
  dotlabel.top(btex $B_3$ etex, G2);
   G3:=D+0.5*(C-D);
   dotlabel.bot(btex $C_3$ etex, G3);
   draw G1--G2--G3--cycle;

   H1:=D-0.5*(A-D);
  dotlabel.top(btex $A_4$ etex, H1);
  H2:=D-0.5*(B-D);
  dotlabel.bot(btex $B_4$ etex, H2);
   H3:=D-0.5*(C-D);
   dotlabel.bot(btex $C_4$ etex, H3);
   draw H1--H2--H3--cycle;
   
   draw E1--F1 dashed evenly;
   draw E2--F2 dashed evenly;
   draw E3--F3 dashed evenly;
endfig;

beginfig(3)  %%%% Image par une rotation
  u:=1.5cm;
 angle_radius:=0.25default_angle_radius ;
pair A,B,C,D,E[], F[], G[], H[];
path p,q,r;
%transform T;
A:=(0,0.8)*u; B:=(1.8,0)*u; C:=(1.2,-1)*u;
D=A rotatedaround(C,40);
E=B rotatedaround(C,40);

dotlabel.top(btex $A$ etex, A);
dotlabel.top(btex $B$ etex, B);
dotlabel.bot(btex $A'$ etex, D);
dotlabel.bot(btex $B'$ etex, E);
%dotlabel.top(btex $C$ etex, C);%%Centre
draw A--B;
draw D--E;
draw C--C withpen pencircle scaled 0.01pt;
endfig;

beginfig(4)  %%%% Image par une rotation
  u:=1.5cm;
 angle_radius:=0.25default_angle_radius ;
pair A,B,C,D,E[], F[], G[], H[];
path p,q,r;
%transform T;
A:=(0,0.8)*u; B:=(1.8,0)*u; C:=(1.2,-1)*u;
D=A rotatedaround(C,40);
E=B rotatedaround(C,40);

dotlabel.top(btex $A$ etex, A);
dotlabel.top(btex $B$ etex, B);
dotlabel.bot(btex $A'$ etex, D);
dotlabel.bot(btex $B'$ etex, E);
dotlabel.top(btex $C$ etex, C);%%Centre
draw A--B;
draw D--E;
draw A--D  ;
draw B--E;
draw C--(0.5[A,D])  dashed evenly;
draw C--(0.5[B,E]) dashed evenly;
endfig;



beginfig(5)  %%%% Carré ABCD
  
  u:=3cm; %phi=(1+sqrt5)/2;
   papiermil((-4cm,-4cm),1,1,(0,-2),(5,3),0.3white);
  
  pair A,B,C,D,E,F;
  A:=(0,1)*u; B:=(0,0)*u; C:=(1,0)*u; D:=(1,1)*u; E:=(1,-4/9)*u;% F:=(1,1)*u;
    %pickup pencircle scaled 0.5bp;
  draw A--B--C--D--cycle withpen pensquare scaled 1pt;
  %draw E--F;
  label.ulft(btex $A$ etex, A);
  label.llft(btex $B$ etex, B);
  label.lrt(btex $C$ etex, C);
  label.urt(btex $D$ etex, D);
  %label.bot(btex $E$ etex, E);
  %label.top(btex $F$ etex, F);
  draw E--E withpen pensquare scaled 0.7pt;
endfig;


beginfig(6)  %%%% Feuille A4
  u:=2cm; sq=sqrt2;
  pair A,B,C,D,E,F;
  A:=(0,0)*u; B:=(sq,0)*u; C:=(sq,1)*u; D:=(0,1)*u; E:=(sq/2,0)*u; F:=(sq/2,1)*u;
    %pickup pencircle scaled 0.5bp;
  draw A--D;
  draw B--C;
  %draw E--F;
  label.bot(btex $A$ etex, A);
  label.bot(btex $B$ etex, B);
  label.top(btex $C$ etex, C);
  label.top(btex $D$ etex, D);
  label.bot(btex $E$ etex, E);
  label.top(btex $F$ etex, F);
  draw E--F dashed evenly;% withpen pencircle scaled 0.01pt;
  draw_marked (A--E, 2);
  draw_marked (B--E, 2);
  draw_marked (D--F, 2);
  draw_marked (F--C, 2);
endfig;
beginfig(7)  %%%% Carré ABCD
  
  u:=3cm; %phi=(1+sqrt5)/2;
   papiermil((-4cm,-4cm),1,1,(0,-2),(5,3),0.4white);
  
   pair A,B,C,D,E,F[];
   path c[];
  A:=(0,1)*u; B:=(0,0)*u; C:=(1,0)*u; D:=(1,1)*u; E:=(1,-4/9)*u;% F:=(1,1)*u;
    %pickup pencircle scaled 0.5bp;
  
  c1=B--A--D--C--cycle;
  draw c1 withpen pensquare scaled 1pt;
  transform T;
  C transformed T = C;
  B transformed T = (1,2/3)*u;
  D transformed T = (1+(2/3),0)*u;  
  
  %T = identity scaled (2/3) shifted C rotatedaround(C,-90) shifted C;%  shifted C;
  c2=c1 transformed T;
  c3=c2 transformed T;
  c4=c3 transformed T;
  c5=c4 transformed T;
  c6=c5 transformed T;
  c7=c6 transformed T;
  c8=c7 transformed T;
  c9=c8 transformed T;
  draw c2  withpen pensquare scaled 1pt;
  draw c3  withpen pensquare scaled 1pt;
   draw c4  withpen pensquare scaled 0.9pt;
   draw c5  withpen pensquare scaled 0.8pt;
    draw c6  withpen pensquare scaled 0.7pt;
    draw c7  withpen pensquare scaled 0.6pt;
    draw c8  withpen pensquare scaled 0.5pt;
    draw c9  withpen pensquare scaled 0.4pt;
  %draw E--F;
  label.ulft(btex $A$ etex, A);
  label.llft(btex $B$ etex, B);
  label.lrt(btex $C$ etex, C);
  label.urt(btex $D$ etex, D);
  %label.bot(btex $E$ etex, E);
  %label.top(btex $F$ etex, F);
  draw E--E withpen pensquare scaled 0.01pt;
endfig;
end