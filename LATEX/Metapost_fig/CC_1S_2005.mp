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
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(1)  %%%% 
  u:=0.5cm; R=(1+sqrt2); RR=(2+sqrt2);
  pair A,B,C,D,E,F,G,H,I[],J[];
  A:=(R,R)*u; B:=(-R,R)*u; C:=(-R,-R)*u; D:=(R,-R)*u;
  E:=(RR,RR)*u; F:=(-RR,RR)*u; G:=(-RR,-RR)*u; H:=(RR,-RR)*u;
  draw A--B--C--D--cycle;
  draw E--F--G--H--cycle;
 draw A..B..C..D..cycle;

 pickup pencircle scaled 0.15bp;
   ahangle:=20;
  drawdblarrow (0,0)--A ;
  drawdblarrow (RR+0.5,R)*u--(RR+0.5,R+1)*u ;
  
  I1:=(0,RR)*u;I2:=I1 rotated 90;I3:=I2 rotated 90;I4:=I3 rotated 90;I5:=I4 rotated 90;
  J1:=(RR,RR)*u;J2:=J1 rotated 90;J3:=J2 rotated 90;J4:=J3 rotated 90;J5:=J4 rotated 90;
  for i=1 upto 4:
    draw I[i]--I[i] withpen pencircle scaled 1.5bp ;
    draw_marked(J[i]--I[i], 2);
     draw_marked(I[i]--J[i+1], 2);
  endfor;
    drawdblarrow (I2+(-0.5,0)*u)--(J2+(-0.5,0)*u);
    %label.lft(btex $x$ etex, 0.5*[I2,J2]+(-0.5,0)*u); 
    label.ulft(btex $x$ etex, (0.5*R,0.5*R)*u);
    label.rt(btex $1$ etex, (RR+0.5,R+0.5)*u);
    %dotlabel.rt(btex  etex, (0,R+1)*u);
  %pickup pencircle scaled 1bp;
 
  %label.ulft(btex $A$ etex, A);
  %label.llft(btex $B$ etex, B);
  %label.lrt(btex $C$ etex, C);
  %label.urt(btex $D$ etex, D);
  %label.bot(btex $E$ etex, E);
  %label.top(btex $F$ etex, F);
endfig;
beginfig(2);  %%%% 
  u:=1cm; R:=3;
  pair A,B,O;
  A:=(R,0)*u; B:=(0,R)*u; O:=(0,0)*u; 
 
  
    
 pickup pencircle scaled 0.4bp;
 draw O--A--B--cycle;
 mark_rt_angle(A,O,B);
 draw_marked(O--A,2);
  draw_marked(O--B,2);
 
  label.bot(btex $A$ etex, A);
  label.llft(btex $O$ etex, O);
  label.lft(btex $B$ etex, B);
  %label.urt(btex $D$ etex, D);
  %label.bot(btex $E$ etex, E);
  %label.top(btex $F$ etex, F);
endfig;
input constantes;
input papiers;
beginfig(3);
  papiermillimetre((0,0),1,1,(-2,-5),(6,5),orange);
 % papiermilli((0,0),1,1,(-2,-5),(5,5)) orange;
endfig;

 
end

