prologues:=2;
verbatimtex
etex

beginfig(1); %Une marguerite.
  u:=1cm;
  pair O,A,B,C,D;
  path p,q,r,s,c,etam,etamm;
  O:=(0,0); A:=(4*u,0); B:=(u,0); C:=(1.1*u,0.2*u);
  %dotlabel(btex B etex,B);
  p=B{dir -12}...A{up}...C...cycle;
  draw p;
  q=p ;
   for i:=0 upto 33: 
     p:=p rotatedaround(O, 10);
     fill p withcolor white;
     draw p;
   endfor
   p:=p rotatedaround(O, 10);
   fill p withcolor white;
   draw p;
   r=buildcycle(p,q);
   draw r;
  
   s=subpath(0.03,1.05) of r;
   pickup pencircle scaled 1.5bp;
   draw s  withcolor white ;
   c=fullcircle scaled 1.9u;
   fill c withcolor 0.8white;%le centre
   pickup pencircle scaled 0.8bp;
   etam=(0,0){dir -30}...(0.96u,0){dir 60};
   for j:=1 upto 72:
     draw etam  dashed withdots scaled 0.3;
     etam:=etam rotatedaround(O,5);
   endfor
   
 endfig;
 beginfig(2);
    u:=0.5cm; ahangle:=15;
    path p[];
    numeric N[];
    p0=(0,0);
   pickup pencircle scaled 0.2bp;
   for i:=1 upto 2001:
     
      N0:=normaldeviate;
      N1:=normaldeviate;
      drawarrow(0,0)..(1.5N0,N1**3)*u rotated 90;
      %draw (N0,N1**2)*u..(N1,N0**2)*u..(N2,N3**2)*u;
    endfor
    for i:=1 upto 2000:
 pickup pencircle scaled 1bp;        
      N2:=normaldeviate ;
      N3:=normaldeviate ;
      draw (N2,N3)*0.7u withcolor white;
      %draw (N0,N1**2)*u..(N1,N0**2)*u..(N2,N3**2)*u;
    endfor
 
 %draw (-5u,5u)--(-5u,-5u)--(5u,-5u)--(5u,5u)--cycle;

endfig;

 beginfig(3);
    u:=1cm; ahangle:=15;
    pair K[],a,b;
    K0=(.1,.1);
    a=(-0.5,0.96);
    b=(1,5);
 for i:=1 upto 40:
   K[i]=(K[i-1] zscaled a)  + b;
   drawarrow K[i-1]--K[i] scaled 0.04u;
 endfor
endfig;
 beginfig(4);
    u:=1cm; ahangle:=15;
    pair K[],a,b;
    K0=(.1,.1);
    a=(0.5,0.93);
    b=(1,5);
 for i:=1 upto 60:
   K[i]=(K[i-1] zscaled a)  + b;
   drawarrow K[i-1]--K[i] scaled 0.04u;
 endfor
endfig;

beginfig(5);
    u:=1cm; ahangle:=15;
    path p[];
    numeric N[];
    p0=(0,0){dir 200*normaldeviate}..(u,0){dir 300*normaldeviate}..(1u,1u){dir 300*normaldeviate}..(0,1u){dir 300*normaldeviate}..cycle;
    %draw p;
   
    for i:=0 upto 40:
      N0:=normaldeviate;
      N1:=normaldeviate;
      N2:=normaldeviate ;  
      
   p[i+1]:=p[i] rotated (300*N0) shifted (12*N1,15*N2)  ;
   draw p[i];
   %drawarrow K[i-1]--K[i] scaled 0.04u;
 endfor
endfig;

beginfig(6); %Brownien
    u:=1cm; ahangle:=15;
    path p[];
    numeric N[];
    p0=(0,0);
   %pickup pencircle scaled 3bp;
    for i:=0 upto 500:
      N0:=normaldeviate;
      N1:=normaldeviate;
      N2:=normaldeviate ;
      N3:=normaldeviate ;
      N4:=normaldeviate ;
      N5:=normaldeviate ; 
      %draw (N0,N1)*u..(N2,N3)*u..(N3,N4)*u;
   p0:=p0..(N0,N1)*u;%..(N2,N3)*u..(N3,N4)*u;
 endfor
 draw p0;
 pickup pencircle scaled 0.8bp;
endfig;
beginfig(7); %Brownien autour d'un chemin. Effet "galaxie"
  u:=0.2cm; ahangle:=15;
  pair A[];
  path p[];
  numeric t[],N[];
    %p0=fullcircle scaled 20u;
  A0:=(30u,0);
  p0:=A0;
  N4:=45;%
  for j:=0 upto N4:
    A[j+1]:=A[j] zscaled (0.85,0.36);
    p0:=p0..A[j+1];
  endfor
    %draw p0; %p0 est une spirale convergeant en zéro
    N3:=100;
    t0:=0;
    N5:=arclength p0;
    N6:=20; %nb de points brownien placés par valeur de tk
   pickup pencircle scaled 2bp;
    for k:=1 upto N3:
      t[k]:=arctime N5/N3*k of p0;

      for i:=0 upto N6:
	N0:=normaldeviate;
	N1:=normaldeviate;
     draw (point t[k] of p0)+(N0*0.05(N3-k+6)*u,N1*0.05(N3-k+6)*u);
   endfor
  endfor

endfig;
beginfig(8); %Brownien autour d'un chemin. Effet "galaxie"
    u:=0.2cm; ahangle:=15;
    path p[];
    numeric t[],N[];
    p0=fullcircle scaled 20u;
    %draw p0;
    N3:=150;
    t0:=0;
   pickup pencircle scaled 2bp;
    for k:=1 upto N3:
      t[k]:=t[k-1]+k*length(p0)/N3;

      for i:=0 upto 3:
      
      N0:=normaldeviate;
      N1:=normaldeviate;
      draw (point t[k] of p0)+(N0*u,N1*u);
          
    endfor
  endfor

endfig;
