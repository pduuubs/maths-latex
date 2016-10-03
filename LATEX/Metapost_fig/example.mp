% This example metapost file makes a load of figures for a DJCM/John Conway document.
% To create the document, use the sequence:
% mpost example ; latex conwayfig ; dvips conwayfig ; gv conwayfig.ps

% The figures come roughly in order.
% Squares
% Triangles
% Knots

% The figures are preceded by a few macros for adding
% ticks to lines, and for labelling angles.

% input boxes is needed if special boxit,drawboxed commands are used.
prologues:=2;
verbatimtex
etex
input boxes

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

%%%%%%%%%%%%%%%%%%%% end defn of angle and line marking

% a simple example figure from the manual.
% Note:      -- means straight line and .. means curve
beginfig(1);
 u=2.5mm;
 draw (u,u)--(0,0)--(0,u)--(u,u)--(u,0)--(0,0) ;
endfig;

% SQUARES
%
% these examples illustrate the creation of paths that are used multiple times,
% and of pictures (including labels and paths) that are used multiple times.

% nxn square and mxm square:
path nsq, msq;

beginfig(2);
  % this declares an array of paths I think.
  path p[];
  picture npic;
  m := 17;
  n := 12;
  d := 5;  

  p0 := unitsquare scaled u;
  p1 := p0 scaled m; msq := p1;
  p2 := p0 scaled n; nsq := p2;

  pickup pencircle ;
  draw p2;
  label.top (btex $n$ etex, point 2.5 of  p2);
  label.lft (btex $n$ etex, point 3.5 of  p2);
  npic := currentpicture;
  currentpicture := nullpicture;

  % draw the mxm square.
  pickup defaultpen ;
  draw p1;
  label.top (btex $m$ etex, point 2.5 of  p1);
  label.lft (btex $m$ etex, point 3.5 of  p1);

  draw npic shifted ((m+d)*u,0);
  draw npic shifted ((m+n+2d)*u,0);

  pickup pencircle ;
endfig;


beginfig(3);

  path p[];

  % nsq is the one with corner at origin
  fill nsq withcolor 0.73white;
  p0 := nsq shifted (point 2 of msq - point 2 of nsq);
  fill p0  withcolor 0.73white;
%  draw the fill of p0 NOW
  p1 := buildcycle (subpath (1,3) of nsq,  subpath(3,5) of p0);

  fill p1 withcolor 0.36white;
  % fill is a drawing event

  % this draws the intersecting square
%  draw p1;
%  pickup pencircle ;
  % DRAW causes the path to be drawn (without its fill) using the current pen.
  draw msq;  
  pickup pencircle scaled 1.5pt;
  draw nsq;
  draw p0;
  % draws the edge of p0 alone

endfig;

% Triangle.
% Define a unit equilateral triangle. And a centred unit triangle.

path unittri ;
path cunittri ;
unittri := (0,0)--(1,0)--(0.5,sqrt(3)/2.0)--(0,0)--cycle ;
cunittri := unittri shifted  (- ( (0,0)+(1,0)+(0.5,sqrt(3)/2.0 ) ) /3.0 );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MORLEY'S TRIANGLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% these params define the main triangle and its baby and its orientation
a := 13 ; b := 20 ; c := 60-a-b ;
bizarre := 160 ;
t := 13mm ;
path  thetriangle ;
thetriangle := cunittri rotated bizarre scaled t ;

% draw thetriangle ;

% build a triangle from the edge and two other sides depending on
% a,b,c
% which must satisfy the rule a+b+c = 60 degrees.
% the apex away from edge is angle alpha, the other two angles
% are b+60 and c+60

% An old routine for making a triangle be drawn. Superceded by build.
def obuild ( expr edge , a ,b ,c ) =
  
  path e , qc , qb ;
  pair eb,ec,ea,em ;
  eb := point 1 of edge; 
  ec := point 0 of edge;
  em := point 0.5 of edge ;
  
  e := edge shifted -em ;
  qc := e scaled 100 rotated (60+b) shifted eb ;
  qb := e scaled 100 rotated (180-(60+c)) shifted ec ;
  ea := qc intersectionpoint qb ;

  draw ea--eb--ec--ea--cycle  ;
enddef ;

% instead of drawing the built triangle this returns it as  a path.
def build ( expr edge , a ,b ,c ) =
  begingroup
    path e , qc , qb ;
    pair eb,ec,ea,em ;
    eb := point 1 of edge; 
    ec := point 0 of edge;
    em := point 0.5 of edge ;
    
    e := edge shifted -em ;
    % lazy method to find intersection of two lines. Scale their unit vectors both up a lot (100).
    qc := e scaled 100 rotated (60+b) shifted eb ;
    qb := e scaled 100 rotated (180-(60+c)) shifted ec ;
    ea := qc intersectionpoint qb ;

    %%% Return value of function is here:
    ea--eb--ec--ea--cycle

  endgroup
enddef ;

% exploded triangle
beginfig(4);
  path edge , ta , tb , tc , ua,ub,uc; % t? are the inner acute triangles. u? are the obtuse outer ones.
  pair va,vb,vc ; % vertices of the central eqiulateral triangle
%  path e[] ;
  draw thetriangle ;

   factor := 0.7 ; vf := 0.8 ;

  edge := subpath (1,2) of thetriangle ;
  ta := build( edge,a,b,c );
  % shifted point 0 of thetriangle ;
  edge := subpath (2,3) of thetriangle ;
  tb :=  build( edge,b,c,a );
  edge := subpath (0,1) of thetriangle ;
  tc :=  build( edge,c,a,b );
  
  va :=  point 0 of thetriangle;
  vb :=  point 1 of thetriangle;
  vc :=  point 2 of thetriangle;
  
  ua := va -- point 0 of tb -- point 0 of tc -- va -- cycle ;
  ub := vb -- point 0 of tc -- point 0 of ta -- vb -- cycle ;
  uc := vc -- point 0 of ta -- point 0 of tb -- vc -- cycle ;
  
%   define shifted triangles and 
%    things for angle marking - the obtuse (u) triangles first
  % then the acute (t)
  path  sua,sub,suc ;
  path  sta,stb,stc ;

  sua:=ua shifted (vf*va); sub:= ub shifted (vf*vb); suc:= uc shifted (vf*vc);
  sta:=ta shifted (-factor*va); stb:= tb shifted (-factor*vb); stc:= tc shifted (-factor*vc);

  % Show the shifted triangles
  draw sta ; draw stb ;  draw stc ; 
  draw sua ; draw sub ;  draw suc ;

endfig;

% again exploded triangle, but this time with some markings of angles and edges
% and obtuse guys omitted.
beginfig(9);
  draw thetriangle ;

  % Show the shifted triangles
  draw sta ; draw stb ;  draw stc ;
  % obtuse guys omitted
%  draw sua ; draw sub ;  draw suc ;

  % mark angles in the central triangle
  angle_radius:=6pt;

  label_angle( va , vc , vb  , 0 , btex $0^+$ etex );
  label_angle( vc , vb , va  , 0 , btex $0^+$ etex );
  label_angle( vb , va , vc  , 0 , btex $0^+$ etex );
  
  label_angle( point 2 of sta , point 1 of sta, point 3 of sta , 0, btex $\gamma^+$ etex ); % lr corner
  label_angle( point 3 of sta , point 2 of sta, point 1 of sta , 0, btex $\alpha^+$ etex ); % u corner of bl acute triangle
  label_angle( point 2 of stb , point 1 of stb, point 3 of stb , 0, btex $\alpha^+$ etex ); 
  label_angle( point 3 of stb , point 2 of stb, point 1 of stb , 0, btex $\beta^+$ etex ); % l coner of br acute triangle
  label_angle( point 2 of stc , point 1 of stc, point 3 of stc , 0, btex $\beta^+$ etex ); % left corner
  label_angle( point 3 of stc , point 2 of stc, point 1 of stc , 0, btex $\gamma^+$ etex ); % lower r corner of u acute triangle


  angle_radius:=default_angle_radius ;

  % draw marks on the edges - central equilateral
  draw_marked ( subpath (1,2) of thetriangle , 1 ) ;
  draw_marked ( subpath (2,3) of thetriangle , 1 ) ;
  draw_marked ( subpath (0,1) of thetriangle , 1 ) ;
  draw_marked ( subpath (1,2) of sta , 1 ) ;
  draw_marked ( subpath (1,2) of stb , 1 ) ;
  draw_marked ( subpath (1,2) of stc , 1 ) ;

    % add labels to just three of the alpha beta gamma vertices
  angle_radius:=default_angle_radius ;
  label_distance_factor := 1.25;

  label_angle( point 1 of sta , point 3 of sta, point 2 of sta , 0 , btex $\beta$ etex ); 
  label_angle( point 1 of stb , point 3 of stb, point 2 of stb , 0 , btex $\gamma$ etex  ); 
  label_angle( point 1 of stc , point 3 of stc, point 2 of stc , 0 , btex $\alpha$ etex ); 

  label_distance_factor := default_label_distance_factor;
  

endfig;


% again again exploded triangle, but this time with MORE markings of angles and edges
beginfig(10);
  draw thetriangle ;

  % Show the shifted triangles
  draw sta ; draw stb ;  draw stc ; 
  draw sua ; draw sub ;  draw suc ;

  % mark angles in the central triangle
  angle_radius:=6pt;

  label_angle( va , vc , vb  , 0 , btex $0^+$ etex );
  label_angle( vc , vb , va  , 0 , btex $0^+$ etex );
  label_angle( vb , va , vc  , 0 , btex $0^+$ etex );
  
  label_angle( point 2 of sta , point 1 of sta, point 3 of sta , 0, btex $\gamma^+$ etex ); % lr corner
  label_angle( point 3 of sta , point 2 of sta, point 1 of sta , 0, btex $\alpha^+$ etex ); % u corner of bl acute triangle
  label_angle( point 2 of stb , point 1 of stb, point 3 of stb , 0, btex $\alpha^+$ etex ); 
  label_angle( point 3 of stb , point 2 of stb, point 1 of stb , 0, btex $\beta^+$ etex ); % l coner of br acute triangle
  label_angle( point 2 of stc , point 1 of stc, point 3 of stc , 0, btex $\beta^+$ etex ); % left corner
  label_angle( point 3 of stc , point 2 of stc, point 1 of stc , 0, btex $\gamma^+$ etex ); % lower r corner of u acute triangle

  label_angle( point 1 of sua , point 3 of sua, point 2 of sua , 0, btex $\beta^{++}$ etex ); 
  label_angle( point 1 of sub , point 3 of sub, point 2 of sub , 0, btex $\gamma^{++}$ etex ); 
  label_angle( point 1 of suc , point 3 of suc, point 2 of suc , 0, btex $\alpha^{++}$ etex ); 
  
  angle_radius:=default_angle_radius ;

  seven := 1 ;
  draw_marked ( subpath (2,3) of sta , 3 ) ;
  draw_marked ( subpath (0,1) of sta , 6 ) ;
  draw_marked ( subpath (2,3) of sua , 2 ) ;
  draw_marked ( subpath (0,1) of sua , seven ) ;
  
  draw_marked ( subpath (2,3) of stb , 4 ) ;
  draw_marked ( subpath (0,1) of stb , seven ) ;
  draw_marked ( subpath (2,3) of sub , 3 ) ;
  draw_marked ( subpath (0,1) of sub , 5 ) ;
  
  draw_marked ( subpath (2,3) of stc , 2 ) ;
  draw_marked ( subpath (0,1) of stc , 5 ) ;
  draw_marked ( subpath (2,3) of suc , 4 ) ;
  draw_marked ( subpath (0,1) of suc , 6 ) ;

  % add labels to just three of the alpha beta gamma vertices
  angle_radius:=default_angle_radius ;
  label_distance_factor := 1.25;

  % the removed integers for ticks are 1,2,3, 
  label_angle( point 1 of sta , point 3 of sta, point 2 of sta , 0 , btex $\beta$ etex ); 
  label_angle( point 1 of stb , point 3 of stb, point 2 of stb , 0 , btex $\gamma$ etex  ); 
  label_angle( point 1 of stc , point 3 of stc, point 2 of stc , 0 , btex $\alpha$ etex ); 
								 
  % the removed integers for ticks are   1,1  2,2  3,3		 
  label_angle( point 3 of sub , point 2 of sub, point 1 of sub , 0 , btex ? etex ); 
  label_angle( point 2 of suc , point 1 of suc, point 3 of suc , 0 , btex ? etex ); % lhs
  label_angle( point 2 of sua , point 1 of sua, point 3 of sua , 0 , btex ? etex ); 
  label_angle( point 3 of suc , point 2 of suc, point 1 of suc , 0 , btex ? etex  ); 
  label_angle( point 3 of sua , point 2 of sua, point 1 of sua , 0 , btex ? etex ); %\/
  label_angle( point 2 of sub , point 1 of sub, point 3 of sub , 0 , btex ? etex ); 
  
  label_distance_factor := default_label_distance_factor;
  
endfig;


% AGAIN again again exploded triangle, but this time with MORE markings of angles and edges
beginfig(11);
  draw thetriangle ;

  % Show the shifted triangles
  draw sta ; draw stb ;  draw stc ; 
  draw sua ; draw sub ;  draw suc ;

  % mark angles in the central triangle
  angle_radius:=6pt;

  label_angle( va , vc , vb  , 0 , btex $0^+$ etex );
  label_angle( vc , vb , va  , 0 , btex $0^+$ etex );
  label_angle( vb , va , vc  , 0 , btex $0^+$ etex );
  
  label_angle( point 2 of sta , point 1 of sta, point 3 of sta , 0, btex $\gamma^+$ etex ); % lr corner
  label_angle( point 3 of sta , point 2 of sta, point 1 of sta , 0, btex $\alpha^+$ etex ); % u corner of bl acute triangle
  label_angle( point 2 of stb , point 1 of stb, point 3 of stb , 0, btex $\alpha^+$ etex ); 
  label_angle( point 3 of stb , point 2 of stb, point 1 of stb , 0, btex $\beta^+$ etex ); % l coner of br acute triangle
  label_angle( point 2 of stc , point 1 of stc, point 3 of stc , 0, btex $\beta^+$ etex ); % left corner
  label_angle( point 3 of stc , point 2 of stc, point 1 of stc , 0, btex $\gamma^+$ etex ); % lower r corner of u acute triangle

  label_angle( point 1 of sua , point 3 of sua, point 2 of sua , 0, btex $\beta^{++}$ etex ); 
  label_angle( point 1 of sub , point 3 of sub, point 2 of sub , 0, btex $\gamma^{++}$ etex ); 
  label_angle( point 1 of suc , point 3 of suc, point 2 of suc , 0, btex $\alpha^{++}$ etex ); 
  
  angle_radius:=default_angle_radius ;
  label_distance_factor := 1.25;

  label_angle( point 3 of sub , point 2 of sub, point 1 of sub , 1 , btex $\beta$ etex ); 
  label_angle( point 2 of suc , point 1 of suc, point 3 of suc , 1 , btex $\beta$ etex ); % lhs
  label_angle( point 1 of sta , point 3 of sta, point 2 of sta , 1 , btex $\beta$ etex ); 
  label_angle( point 2 of sua , point 1 of sua, point 3 of sua , 2 , btex $\gamma$ etex ); 
  label_angle( point 3 of suc , point 2 of suc, point 1 of suc , 2 , btex $\gamma$ etex  ); 
  label_angle( point 1 of stb , point 3 of stb, point 2 of stb , 2 , btex $\gamma$ etex  ); 
  label_angle( point 1 of stc , point 3 of stc, point 2 of stc , 3 , btex $\alpha$ etex ); 
  label_angle( point 3 of sua , point 2 of sua, point 1 of sua , 3 , btex $\alpha$ etex ); %\/
  label_angle( point 2 of sub , point 1 of sub, point 3 of sub , 3 , btex $\alpha$ etex ); 

  label_distance_factor := default_label_distance_factor;


endfig;

% final macro for finishing the proof - build the v-shaped object
def buildv ( expr va,vb,vc , a,b,c ) =
  begingroup
    pair qc,qb,eb,ec ;

    eb := vb shifted -(va);
    ec := vc shifted -(va);
    qb := eb rotated -(120+2b) shifted (va);
    qc := ec rotated ((120+2c)) shifted (va);
%% return value
    qc--va--qb
  endgroup
enddef ;

% yet yet again again exploded triangle, but this time with MORE markings of angles and edges
% and with extra lines shown in the bottom triangle, the alpha++ one
beginfig(12);
  draw thetriangle ;

  % Show the shifted triangles
  draw sta ; draw stb ;  draw stc ; 
  draw sua ; draw sub ;  draw suc ;

  path wedge,swedge ;
  wedge := buildv( va,vb,vc , a,b,c );
  pickup pencircle scaled 2pt ;
  swedge := wedge shifted (vf*va) ;
  draw swedge ;

  pickup defaultpen ;
  % mark angles in the central triangle
  angle_radius:=6pt;

  label_angle( va , vc , vb  , 0 , btex $0^+$ etex );
  label_angle( vc , vb , va  , 0 , btex $0^+$ etex );
  label_angle( vb , va , vc  , 0 , btex $0^+$ etex );
  
  label_angle( point 2 of sta , point 1 of sta, point 3 of sta , 0, btex $\gamma^+$ etex ); % lr corner
  label_angle( point 3 of sta , point 2 of sta, point 1 of sta , 0, btex $\alpha^+$ etex ); % u corner of bl acute triangle
  label_angle( point 2 of stb , point 1 of stb, point 3 of stb , 0, btex $\alpha^+$ etex ); 
  label_angle( point 3 of stb , point 2 of stb, point 1 of stb , 0, btex $\beta^+$ etex ); % l coner of br acute triangle
  label_angle( point 2 of stc , point 1 of stc, point 3 of stc , 0, btex $\beta^+$ etex ); % left corner
  label_angle( point 3 of stc , point 2 of stc, point 1 of stc , 0, btex $\gamma^+$ etex ); % lower r corner of u acute triangle

  label_angle( point 1 of sua , point 3 of sua, point 2 of sua , 0, btex $\beta^{++}$ etex ); 
  label_angle( point 1 of sub , point 3 of sub, point 2 of sub , 0, btex $\gamma^{++}$ etex ); 
  label_angle( point 1 of suc , point 3 of suc, point 2 of suc , 0, btex $\alpha^{++}$ etex ); 
  
  angle_radius:=default_angle_radius ;

  seven := 1 ;
  draw_marked ( subpath (2,3) of sta , 3 ) ;
  draw_marked ( subpath (0,1) of sta , 6 ) ;
  draw_marked ( subpath (2,3) of sua , 2 ) ;
  draw_marked ( subpath (0,1) of sua , seven ) ;
  
  draw_marked ( subpath (2,3) of stb , 4 ) ;
  draw_marked ( subpath (0,1) of stb , seven ) ;
  draw_marked ( subpath (2,3) of sub , 3 ) ;
  draw_marked ( subpath (0,1) of sub , 5 ) ;
  
  draw_marked ( subpath (2,3) of stc , 2 ) ;
  draw_marked ( subpath (0,1) of stc , 5 ) ;
  draw_marked ( subpath (2,3) of suc , 4 ) ;
  draw_marked ( subpath (0,1) of suc , 6 ) ;

  % add labels to just three of the alpha beta gamma vertices
  angle_radius:=default_angle_radius ;
  label_distance_factor := 1.25;

  % the removed integers for ticks are 1,2,3, 
  label_angle( point 1 of sta , point 3 of sta, point 2 of sta , 0 , btex $\beta$ etex ); 
  label_angle( point 1 of stb , point 3 of stb, point 2 of stb , 0 , btex $\gamma$ etex  ); 
  label_angle( point 1 of stc , point 3 of stc, point 2 of stc , 0 , btex $\alpha$ etex ); 
								 
  % the removed integers for ticks are   1,1  2,2  3,3		 
  label_angle( point 3 of sub , point 2 of sub, point 1 of sub , 0 , btex ? etex ); 
  label_angle( point 2 of suc , point 1 of suc, point 3 of suc , 0 , btex ? etex ); % lhs
  label_angle( point 2 of sua , point 1 of sua, point 3 of sua , 0 , btex ? etex ); 
  label_angle( point 3 of suc , point 2 of suc, point 1 of suc , 0 , btex ? etex  ); 
  label_angle( point 3 of sua , point 2 of sua, point 1 of sua , 0 , btex ? etex ); %\/
  label_angle( point 2 of sub , point 1 of sub, point 3 of sub , 0 , btex ? etex ); 
  
  label_distance_factor := default_label_distance_factor;
  
endfig;


% the first triangle with partial trisections
beginfig(5);
%  path edge , ta , tb , tc , ua,ub,uc ,
  path thebigtriangle ;
  pair tta , ttb , ttc ; % the tips of the outer triangle.
  % whether to show the central equilateral triangle.
%  draw thetriangle ;

  factor := 0.0 ; % how much the obtuse triangles are exploded away
  vf := 0.0 ; % how much the acute triangles are exploded away
  pf :=0.7 ; % pf how much of paths to show

  tta := point 0 of ta ; ttb := point 0 of tb ; ttc := point 0 of tc ;
  thebigtriangle := tta--ttb--ttc--tta--cycle ;

  % only makes sense if factor and vf are zero
  draw thebigtriangle ;

  % draw the obtuse guys
% draw the acute guys   

  sua:=ua shifted (vf*va); sub:= ub shifted (vf*vb); suc:= uc shifted (vf*vc);
  sta:=ta shifted (-factor*va); stb:= tb shifted (-factor*vb); stc:= tc shifted (-factor*vc);
  
  draw subpath (3-pf,3) of sta;
  draw subpath (0,pf)   of sta;
  draw subpath (3-pf,3) of stb;
  draw subpath (0,pf)   of stb;
  draw subpath (3-pf,3) of stc;
  draw subpath (0,pf)   of stc;


%  mark_angle( point 1 of sua , point 3 of sua, point 2 of sua , 2 ); 
  mark_angle( point 2 of sua , point 1 of sua, point 3 of sua , 2 ); 
  mark_angle( point 3 of sua , point 2 of sua, point 1 of sua , 3 ); %\/
%  mark_angle( point 1 of sub , point 3 of sub, point 2 of sub , 2 ); % obtuse angle
  mark_angle( point 2 of sub , point 1 of sub, point 3 of sub , 3 ); 
  mark_angle( point 3 of sub , point 2 of sub, point 1 of sub , 1 ); 
%  mark_angle( point 1 of suc , point 3 of suc, point 2 of suc , 3 ); % obtuse angle
  mark_angle( point 2 of suc , point 1 of suc, point 3 of suc , 1 ); % lhs
  mark_angle( point 3 of suc , point 2 of suc, point 1 of suc , 2 ); 

  mark_angle( point 1 of sta , point 3 of sta, point 2 of sta , 1 ); 
%  mark_angle( point 2 of sta , point 1 of sta, point 3 of sta , 1 ); % lr corner
%  mark_angle( point 3 of sta , point 2 of sta, point 1 of sta , 4 ); % u corner of bl acute triangle
  mark_angle( point 1 of stb , point 3 of stb, point 2 of stb , 2 ); 
%  mark_angle( point 2 of stb , point 1 of stb, point 3 of stb , 2 ); 
%  mark_angle( point 3 of stb , point 2 of stb, point 1 of stb , 4 ); % l coner of br acute triangle
  mark_angle( point 1 of stc , point 3 of stc, point 2 of stc , 3 ); 
%  mark_angle( point 2 of stc , point 1 of stc, point 3 of stc , 3 ); % left corner
%  mark_angle( point 3 of stc , point 2 of stc, point 1 of stc , 5 ); % lower r corner of u acute triangle


endfig;

% the construction up to the central triangle but not showing it.
beginfig(6);
  % whether to show the central equilateral triangle.
%  pickup pencircle scaled 2.5pt;
%  draw thetriangle ;

  % put dot at each vertex of central triangle.
  pickup pencircle scaled 3.9pt ;
  draw va ;  draw vb ;  draw vc ;

  pickup defaultpen ;
  factor := 0.0 ; % how much the obtuse triangles are exploded away
  vf := 0.0 ; % how much the acute triangles are exploded away
  pf :=1 ; % pf how much of paths to show

  % only makes sense if factor and vf are zero
  draw thebigtriangle ;


  sua:=ua shifted (vf*va); sub:= ub shifted (vf*vb); suc:= uc shifted (vf*vc);
  sta:=ta shifted (-factor*va); stb:= tb shifted (-factor*vb); stc:= tc shifted (-factor*vc);
  
  draw subpath (3-pf,3) of sta;
  draw subpath (0,pf)   of sta;
  draw subpath (3-pf,3) of stb;
  draw subpath (0,pf)   of stb;
  draw subpath (3-pf,3) of stc;
  draw subpath (0,pf)   of stc;


%  mark_angle( point 1 of sua , point 3 of sua, point 2 of sua , 2 ); 
  mark_angle( point 2 of sua , point 1 of sua, point 3 of sua , 2 ); 
  mark_angle( point 3 of sua , point 2 of sua, point 1 of sua , 3 ); %\/
%  mark_angle( point 1 of sub , point 3 of sub, point 2 of sub , 2 ); % obtuse angle
  mark_angle( point 2 of sub , point 1 of sub, point 3 of sub , 3 ); 
  mark_angle( point 3 of sub , point 2 of sub, point 1 of sub , 1 ); 
%  mark_angle( point 1 of suc , point 3 of suc, point 2 of suc , 3 ); % obtuse angle
  mark_angle( point 2 of suc , point 1 of suc, point 3 of suc , 1 ); % lhs
  mark_angle( point 3 of suc , point 2 of suc, point 1 of suc , 2 ); 

  mark_angle( point 1 of sta , point 3 of sta, point 2 of sta , 1 ); 
%  mark_angle( point 2 of sta , point 1 of sta, point 3 of sta , 1 ); % lr corner
%  mark_angle( point 3 of sta , point 2 of sta, point 1 of sta , 4 ); % u corner of bl acute triangle
  mark_angle( point 1 of stb , point 3 of stb, point 2 of stb , 2 ); 
%  mark_angle( point 2 of stb , point 1 of stb, point 3 of stb , 2 ); 
%  mark_angle( point 3 of stb , point 2 of stb, point 1 of stb , 4 ); % l coner of br acute triangle
  mark_angle( point 1 of stc , point 3 of stc, point 2 of stc , 3 ); 
%  mark_angle( point 2 of stc , point 1 of stc, point 3 of stc , 3 ); % left corner
%  mark_angle( point 3 of stc , point 2 of stc, point 1 of stc , 5 ); % lower r corner of u acute triangle

  
endfig;


beginfig(7);
  % whether to show the central equilateral triangle.
  pickup pencircle scaled 2.5pt;
  draw thetriangle ;

  pickup defaultpen ;
  factor := 0.0 ; % how much the obtuse triangles are exploded away
  vf := 0.0 ; % how much the acute triangles are exploded away
  pf :=1 ; % pf how much of paths to show

  % only makes sense if factor and vf are zero
  draw thebigtriangle ;


  sua:=ua shifted (vf*va); sub:= ub shifted (vf*vb); suc:= uc shifted (vf*vc);
  sta:=ta shifted (-factor*va); stb:= tb shifted (-factor*vb); stc:= tc shifted (-factor*vc);
  
  draw subpath (3-pf,3) of sta;
  draw subpath (0,pf)   of sta;
  draw subpath (3-pf,3) of stb;
  draw subpath (0,pf)   of stb;
  draw subpath (3-pf,3) of stc;
  draw subpath (0,pf)   of stc;

%  mark_angle( point 1 of sua , point 3 of sua, point 2 of sua , 2 ); 
  mark_angle( point 2 of sua , point 1 of sua, point 3 of sua , 2 ); 
  mark_angle( point 3 of sua , point 2 of sua, point 1 of sua , 3 ); %\/
%  mark_angle( point 1 of sub , point 3 of sub, point 2 of sub , 2 ); % obtuse angle
  mark_angle( point 2 of sub , point 1 of sub, point 3 of sub , 3 ); 
  mark_angle( point 3 of sub , point 2 of sub, point 1 of sub , 1 ); 
%  mark_angle( point 1 of suc , point 3 of suc, point 2 of suc , 3 ); % obtuse angle
  mark_angle( point 2 of suc , point 1 of suc, point 3 of suc , 1 ); % lhs
  mark_angle( point 3 of suc , point 2 of suc, point 1 of suc , 2 ); 

  mark_angle( point 1 of sta , point 3 of sta, point 2 of sta , 1 ); 
%  mark_angle( point 2 of sta , point 1 of sta, point 3 of sta , 1 ); % lr corner
%  mark_angle( point 3 of sta , point 2 of sta, point 1 of sta , 4 ); % u corner of bl acute triangle
  mark_angle( point 1 of stb , point 3 of stb, point 2 of stb , 2 ); 
%  mark_angle( point 2 of stb , point 1 of stb, point 3 of stb , 2 ); 
%  mark_angle( point 3 of stb , point 2 of stb, point 1 of stb , 4 ); % l coner of br acute triangle
  mark_angle( point 1 of stc , point 3 of stc, point 2 of stc , 3 ); 
%  mark_angle( point 2 of stc , point 1 of stc, point 3 of stc , 3 ); % left corner
%  mark_angle( point 3 of stc , point 2 of stc, point 1 of stc , 5 ); % lower r corner of u acute triangle

  
endfig;

% define another different triangle to
% illustrate the generality

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MORLEY'S other TRIANGLE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Here we repeat an earlier figure with different parameters.
% The way i have done it is ugly as I could have used a single subroutine,
% but instead I just cut and pasted. But this way of doing things illustrates
% the fact that when you use := you overwrite previous objects.
%
% these params define the main triangle and its baby and its orientation
a := 13 ; b := 7 ; c := 60-a-b ;
bizarre := 190 ;
t := 8mm ;
thetriangle := cunittri rotated bizarre scaled t ;

%%%%%%%%%%%%% now the equilateral baby defined, can go ahead and redo

beginfig(8);
  path edge , ta , tb , tc , ua,ub,uc ,thebigtriangle ;
  pair va,vb,vc ;
  % whether to show the central equilateral triangle.
  pickup pencircle scaled 2.5pt;
  draw thetriangle ;

  pickup defaultpen ;

  factor := 0.0 ; % how much the obtuse triangles are exploded away
  vf := 0.0 ; % how much the acute triangles are exploded away
  pf :=1 ; % pf how much of paths to show

  edge := subpath (1,2) of thetriangle ;
  ta := build( edge,a,b,c );
  % shifted point 0 of thetriangle ;
  edge := subpath (2,3) of thetriangle ;
  tb :=  build( edge,b,c,a );
  edge := subpath (0,1) of thetriangle ;
  tc :=  build( edge,c,a,b );
  
  va :=  point 0 of thetriangle;
  vb :=  point 1 of thetriangle;
  vc :=  point 2 of thetriangle;
  
  ua := va -- point 0 of tb -- point 0 of tc -- va -- cycle ;
  ub := vb -- point 0 of tc -- point 0 of ta -- vb -- cycle ;
  uc := vc -- point 0 of ta -- point 0 of tb -- vc -- cycle ;
  thebigtriangle := point 0 of ta -- point 0 of tb -- point 0 of tc --
                       point 0 of ta -- cycle ;

  % only makes sense if factor and vf are zero
  draw thebigtriangle ;

  % draw the obtuse guys
  
% draw ua shifted (vf*va) ; draw ub shifted (vf*vb) ; draw uc shifted (vf*vc) ;

% draw the acute guys   
  
  draw subpath (3-pf,3) of ta shifted (-factor*va) ;
  draw subpath (0,pf)   of ta shifted (-factor*va) ;
  draw subpath (3-pf,3) of tb shifted (-factor*vb) ;
  draw subpath (0,pf)   of tb shifted (-factor*vb) ;
  draw subpath (3-pf,3) of tc shifted (-factor*vc) ;
  draw subpath (0,pf)   of tc shifted (-factor*vc) ;
  
endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% KNOTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% here I am trying to make pictures that show the geometry of knots clearly.
% The method used in fig 20 only allows pictures of wormturds to be created --
% sequences of crossings that are ordered in time.
beginfig(20);
  m := 17;
  n := 12;
  k=2cm ; % my fundamental unit for k figures

  p0 := unitsquare scaled u;
  p1 := p0 scaled m; msq := p1;
  p2 := p0 scaled n; nsq := p2;

  p0 := nsq shifted (point 2 of msq - point 2 of nsq);
  
  path m[];
  m0 := (0,0){(1,0)}..(1,0.2)..(2,1.5)..(3,1)..(2,0.5)..(1,1.8)..(0,2){(-1,0)} ;
  m2 := m0 rotated 180 shifted (4,2) ;

  p0 := m0 scaled k ;
  p2 := m2 scaled k ;

  for i=0 upto 6 :
    pickup pencircle scaled 9.5pt;
    linecap := butt ;
    undraw subpath (i,i+1) of p0 ;
    undraw subpath (i,i+1) of p2 ;
    pickup pencircle scaled 4.5pt ; 
    draw subpath (i,i+1) of p0 withcolor red ;
    pickup pencircle scaled 4.5pt ; 
    draw subpath (i,i+1) of p2  withcolor blue ;
  endfor

  pickup defaultpen ;
  

endfig ;

beginfig(21);
  k:=1cm;
  path m[];
  m0 :=
  (1,1)..(5,4)..(0,6)..(-5,4)..(-1,1)..(2,0){(1,0)}..(0,2)..
  (-2,0){(1,0)}..cycle ;
  m1 := subpath (0,4) of m0 ;
  m2 := subpath (4,6) of m0 ;
  m3 := subpath (6,8) of m0 ;

  p0 := m0 scaled k ;
  p1 := m1 scaled k ;
  p2 := m2 scaled k ;
  p3 := m3 scaled k ;

  for i=0 upto 3 :
    pickup pencircle scaled 9.5pt;
    linecap := butt ;
    undraw subpath (i,i+1) of p1 ;
    undraw subpath (i,i+1) of p3 ;
    undraw subpath (i,i+1) of p2 ;
    pickup pencircle scaled 4.5pt ; 
    draw subpath (i,i+1) of p3 withcolor red ;
    draw subpath (i,i+1) of p1 withcolor green ;
    draw subpath (i,i+1) of p2  withcolor blue ;
  endfor

  pickup defaultpen ;
  

endfig ;

end



