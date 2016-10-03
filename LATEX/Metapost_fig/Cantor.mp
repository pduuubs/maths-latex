prologues:=2;
verbatimtex
etex



vardef sirp(expr A,B,C,n)=   %Procédure pour sierpinski
     if n>0:
      sirp( A,1/2[A,B],1/2[A,C], n-1);
      sirp( 1/2[A,B],  B ,1/2[B,C] , n-1);
      sirp( 1/2[A,C],  1/2[B,C],C  , n-1);
    else:
           fill A--B--C--cycle withcolor black;
     fi;
    
   enddef;

   
beginfig(1) %% Cantor
  u:=4cm;
pickup pencircle scaled 0.01mm yscaled 60; 

vardef cantor(expr A,B,n)=
     if n>0:
      cantor( A,        1/3[A,B], n-1);
      cantor( 2/3[A,B], B,        n-1);
    else:
    draw A--1/3[A,B] ;
    draw 2/3[A,B]--B ;
    
    fi;
  enddef;
   z0=(u,0); z1=-z0; z3=(0,-0.03)*u;
   draw z0--z1;
   for n=1 upto 6:
     cantor(z0+n*z3,z1+n*z3,n-1);
   endfor;  
 endfig;

beginfig(2) %% Tartan de Cantor
  u:=12cm;
pickup pencircle scaled 0.01mm; 

vardef cant(expr A,B,n)=
     if n>0:
      cant( A,        1/3[A,B], n-1);
      cant( 2/3[A,B],  B      , n-1);
    else:
      draw A--(A shifted (0,u));
      draw 1/3[A,B]--(1/3[A,B] shifted (0,u)) ;
      draw 2/3[A,B]--(2/3[A,B] shifted (0,u)) ;
      draw B--(B shifted (0,u));
%et à 90 degrés
           
      draw A  rotatedaround( (0,0), 90)--(A  rotatedaround( (0,0), 90) shifted (u,0));
      draw 1/3[A rotatedaround( (0,0), 90),B rotatedaround((0,0), 90)]--(1/3[A rotatedaround( (0,0), 90),B rotatedaround( (0,0), 90)] shifted (u,0)) ;
      draw 2/3[A rotatedaround((0,0), 90),B rotatedaround( (0,0), 90)]--(2/3[A rotatedaround( (0,0), 90),B rotatedaround( (0,0), 90)] shifted (u,0)) ;
      draw B rotatedaround( (0,0), 90)--(B rotatedaround( (0,0), 90) shifted (u,0));
    fi;
    
  enddef;
  z0=(0,0); z1=(u,0);
  
  draw z0--z1--(u,u)--(0,u)--cycle;
  
   cant(z0,z1,4);
  
 endfig;

 beginfig(3) %% Tapis de sierpinski
  u:=5cm;
pickup pencircle scaled 0.01mm; 
z0=(0,0); z1=(u,0);z2=(0.5,(sqrt(3))/2)*u; %triangle équilatéral
  
  
   sirp(z0,z1,z2,1);
  
 endfig;
 beginfig(4) %% Tapis de sierpinski
  u:=5cm;
pickup pencircle scaled 0.01mm; 
z0=(0,0); z1=(u,0);z2=(0.5,(sqrt(3))/2)*u; %triangle équilatéral
  
  
   sirp(z0,z1,z2,2);
  
 endfig;
 beginfig(5) %% Tapis de sierpinski
  u:=5cm;
pickup pencircle scaled 0.01mm; 
z0=(0,0); z1=(u,0);z2=(0.5,(sqrt(3))/2)*u; %triangle équilatéral
  
  
   sirp(z0,z1,z2,3);
  
 endfig;
  beginfig(6) %% Tapis de sierpinski
  u:=5cm;
pickup pencircle scaled 0.01mm; 
z0=(0,0); z1=(u,0);z2=(0.5,(sqrt(3))/2)*u; %triangle équilatéral
  
  
   sirp(z0,z1,z2,8);
  
 endfig;
 
 
 end