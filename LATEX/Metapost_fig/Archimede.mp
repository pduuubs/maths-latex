prologues:=2;
verbatimtex
etex

beginfig(1)  %%%% 
u:=1cm;
  xmin=-2.5;      % 
  xmax=2.5;       % 
  xscl=1;         %
  ymin=-1;        % 
  ymax=7;         % 
  yscl=1;         %
  M=50;           % Nb_de_pts
vardef f(expr x) = x**2 enddef;  
 draw ( (xmin,0) -- (xmax,0) ) scaled u ; 
 draw ( (0,ymin) -- (0,ymax) ) scaled u;
pickup pencircle scaled 1pt;
    ahangle:=20;            %angle au sommet de la flèche
    ahlength:=0.8*ahlength; %longueur de la pointe de flèche
    drawarrow  (( 0,0) -- (1,0) ) scaled u ;  % vecteur i
    drawarrow  (( 0,0) -- (0,1) ) scaled u ;  % vecteurj
    label.llft(btex $O$ etex, (0,0));        

%    def mil(expr a,b)=
%     (a+b)*0.5
%    enddef;
%   a=-2; b=2.5;
%   pair A,B;
%   pickup pencircle scaled 0.2pt;
%   A=(a,a**2)*u; B=(b,b**2)*u;
%   for i=1 up to 3:
%   draw A--(mil(a,b),(mil(a,b))**2)*u--B--cycle;
%   endfor;  

vardef dicho(expr a,b,n) =
    save c; 
    c =(a+b)*0.5; t=1;
    if n>0:
      dicho( a,c, n-1);
      dicho( b,c,  n-1);
      %t=t*(1-(1/n));
      path q;
      q = (a,a**2)*u--(c,c**2)*u--(b,b**2)*u--cycle;
  %fill q withcolor t*white;
  draw q withpen pencircle scaled 0.15pt;
     
    else:
      draw (a,a**2)*u--(c,c**2)*u--(b,b**2)*u--cycle withpen pencircle scaled 0.15pt;
    fi;
  enddef;

  a=-3; b=2.5;
  dicho(a,b,3);
  
  %%%%%%%%%%%%%%%%%%Décommenter ci- dessous pour tracer la parabole%%%%%%%%%%%%%%
%
%   pickup pencircle scaled 0.15mm;
%   path p;
%     draw ( ( xmin, f(xmin) )
%         for i=1 upto M:
%     ..( xmin + (i/M)*(xmax - xmin), f( xmin + (i/M)*(xmax - xmin) ))
%   endfor ) scaled u;
    
endfig;

  end