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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
beginfig(1);
u:=1.6cm;
pair A[];
  A[0]:=(-1, -1)*u; %A
  A[1]:=( 1, -1)*u; %B
  A[2]:=( 1, 1)*u;  %C
  A[3]:=( -1, 1)*u; %D
  draw A[0]--A[1]--A[2]--A[3]--cycle withpen pencircle scaled 0.8bp;;
  draw A[1]--A[3];
%%
  label.llft(btex $A$ etex, A[0]);
  label.lrt(btex $B$ etex, A[1]);
  label.urt(btex $C$ etex, A[2]);
  label.ulft(btex $D$ etex, A[3]);
  a=0.25;
  A[4]:=( -a, a)*u; %M
  A[5]:=( -1, a)*u; %Q
  A[6]:=( -a, -1)*u; %P
  draw A[4]--A[5];
  draw A[4]--A[6];
  draw A[5]--A[6];
  A[7]=whatever[A[5],A[6]];
  A[7]=whatever[A[2],A[4]];
  draw A[2]--A[7]; 
 mark_rt_angle(A[1],A[6],A[4]); %MPD droit
 mark_rt_angle(A[4],A[5],A[3]); %MQD droit
  
  label.top(btex $\ \,M$ etex, A[4]+(0,0.06u));
  label.lft(btex $Q$ etex, A[5]);
  label.bot(btex $P$ etex, A[6]);

endfig;
beginfig(2);
u:=3cm;
pair A[];
  A[0]:=(0, 0)*u; %O
  A[1]:=( 1, 0)*u; %A
  A[2]:=( 0, 1)*u; %B
%%%%%%%%%%%%%%%%%%%%%
  A[3]:=( 0, 0.1)*u; %
  A[4]:=( 0.1, 0)*u; %
  A[5]:=( 0.1, 0.1)*u; %
  
  path p;
  %p:=A[0]--A[4]--A[5]--A[3]--A[0]--A[2]--A[1]--cycle;
  p:=A[0]--A[1]--A[2]--cycle;
   draw p rotated -20 withpen pencircle scaled 0.7bp;
  draw p rotated 115 scaled 0.7  withpen pencircle scaled 0.7bp;
  A[6]:=0.5[A[2]rotated -20,A[1]rotated 115 scaled 0.7];
  draw_marked(A[0]--A[1]rotated -20, 1);
  draw_marked(A[0]--A[2]rotated -20, 1);
  draw_marked(A[0]--A[1]rotated 115 scaled 0.7, 2);
  draw_marked(A[0]--A[2]rotated 115 scaled 0.7, 2);
  draw A[2]rotated -20--A[1]rotated 115 scaled 0.7;
  draw A[1]rotated -20--A[2]rotated 115 scaled 0.7;
  draw A[2]rotated -20--A[2]rotated 115 scaled 0.7 dashed evenly scaled 0.7;
  draw A[1]rotated -20--A[1]rotated 115 scaled 0.7 dashed evenly scaled 0.7;
   mark_rt_angle(A1rotated -20,A0,A2rotated -20);
    mark_rt_angle(A1rotated 115,A0,A2rotated 115);
   label.rt(btex $A$ etex, A[1]rotated -20);
   label.top(btex $B$ etex, A[2]rotated -20);
   label.top(btex $C$ etex, A[1]rotated 115 scaled 0.7);
   label.bot(btex $D$ etex, A[2]rotated 115 scaled 0.7);
   label.bot(btex $O$ etex, A[0]);
   dotlabel.top(btex $I$ etex, A[6]);
      
 endfig;
 beginfig(3);
u:=1cm;
pair A[];
  A[0]:=(-1, -1)*u; %A
  A[1]:=( 1, -1)*u; %B
  A[2]:=( 1, 1)*u;  %C
  A[3]:=( -1, 1)*u; %D
  A[4]:=A0+0.4*(A[1]-A[0]);% mil AB
  A[5]:=A1+0.4*(A[2]-A[1]);% mil BC
  
  draw A[0]--A[1]--A[2]--A[3]--cycle withpen pencircle scaled 0.7bp;
  draw A[3]--A[4]; draw A[0]--A[5];
  draw_marked(A0--A4,2);
  draw_marked(A1--A5,2);
%%
  label.llft(btex $A$ etex, A[0]);
  label.lrt(btex $B$ etex, A[1]);
  label.urt(btex $C$ etex, A[2]);
  label.ulft(btex $D$ etex, A[3]);
  dotlabel.rt(btex $J$ etex, A[5]);
  dotlabel.bot(btex $I$ etex, A[4]);
  
endfig;
beginfig(4);
u:=1.5cm;
pair A[];
  A[0]:=(0, 0)*u; %A
  A[1]:=( 1.5, 0)*u; %B
  A[2]:=( 2, 1)*u;  %C
  A[3]:=( 0.5, 1)*u; %D
  draw A[0]--A[1]--A[2]--A[3]--cycle withpen pencircle scaled 0.7bp;
  label.bot(btex $A$ etex, A[0]);
  label.lrt(btex $B$ etex, A[1]);
  label.urt(btex $C$ etex, A[2]);
  label.top(btex $D$ etex, A[3]);
  endfig;
end 
 