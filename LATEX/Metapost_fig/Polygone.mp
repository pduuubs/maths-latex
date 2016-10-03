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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       MACRO VP pour faire des polygones réguliers et etoilés
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       u:=3cm; %unité de longueur, peut être changé après le beginfig()
       
       def ngone(expr n) =
%définit une liste de points A[i] qui forment u n polygone erg à n cotés centré en O
	 %save A[];
	 save p, c;
	 pair A[];
	 path p,c;
	 c:=fullcircle scaled u;
	 A0=point 0 of c;
	 p=A0;
	 for i=1 upto n: 
         A[i]:=point i*8/n of c; 
         %draw A[i-1]--A[i];
	 p:=p--A[i];
       endfor
       %draw p;
     enddef;
     
       def draw_ngone(expr n) = %pour dessiner le ngone
	 ngone(n);
	 draw p;
	 enddef;

	 def draw_diag(expr n) = %pour dessiner les diagonales et les côtés.
	   ngone(n);
	   for i=0 upto n:
	     for j=i+1 upto  n :
	       draw A[i]--A[j];	 
	     endfor
	   endfor
	 enddef;

	  def draw_rayons(expr n) = %pour dessiner les rayons...
	   ngone(n);
	   for i=0 upto n:
	     draw (0,0)--A[i];	 
	   endfor
	 enddef;

  %%%%%%%%
	 def label_ngone(expr n) =
	   ngone(n);
	    pair B[];
	    for i=0 upto n:
	      B[i]=A[i]+8bp*unitvector(A[i]);
%Reste à coller ceci:
  %label(btex $A_0$ etex , B[0]);
  %label(btex $A_1$ etex , B[1]);
  %label(btex $A_2$ etex , B[2]);
  %label(btex $A_3$ etex , B[3]);
  %label(btex $A_4$ etex , B[4]);
  %label(btex $A_i$ etex , B[i];
	    endfor
	 enddef;
	   
beginfig(1)  %%% Polygone regulier à 5 cotés
 u:=3cm;
  draw_ngone(5);
  draw_rayons(5);
  draw c;
  label_ngone(5);
  label(btex $A_0$ etex , B[0]);
  label(btex $A_1$ etex , B[1]);
  label(btex $A_2$ etex , B[2]);
  label(btex $A_3$ etex , B[3]);
  label(btex $A_4$ etex , B[4]);

  label.bot(btex $O$ etex , (0,0));
endfig;
beginfig(2)  %%% Polygone regulier à 6 cotés
 u:=6cm;
 draw_rayons(6);
 draw c;
 %draw_diag(6);
 draw p;% dashed evenly;
 for i=0 upto 5: 
   marked (A[i]--A[i+1],2);
 endfor
marked (A[0]--(0,0),2);
endfig;
beginfig(3)  %%% Polygone regulier à 6 cotés On peut transformer avant de tracer. Le polygone s'appelle p.
 u:=3cm;
 % draw_rayons(5);
 % draw c;
 ngone(6);
 draw p dashed evenly;
 draw p rotated 30;
endfig;

beginfig(4)  %%% Polygone regulier à 5 cotés
 u:=10cm;
 % draw_rayons(5);
 % draw c;
  draw_diag(23);
endfig;


end