prologues:=2;
verbatimtex
etex



   
beginfig(1) %%
  u:=0.75cm;
pickup pencircle scaled 0.2mm %yscaled 60; 
draw((-9,0)*u--(9,0)*u);
dotlabel.bot(btex $A$ etex, (0,0)*u);

for a=-9 step 1  until 9 :     
draw ((a,-0.1)*u -- (a,0.1)*u);
endfor ;
pickup pencircle scaled 0.1mm %yscaled 60; 
path p;
p=halfcircle scaled 16u shifted (0,0);
path pp;
pp=quartercircle scaled 6u shifted (-8u,0);
path ppp;
ppp=halfcircle scaled 14u shifted (0,0);
path pppp;
pppp=quartercircle scaled 16u shifted (-3u,0);
path ppppp;
ppppp=halfcircle scaled 6u shifted (0,0);

path q;
q=quartercircle scaled 16u shifted (-7u,0);
draw q;
draw halfcircle scaled 16u shifted (0,0);
draw halfcircle scaled 14u shifted (0,0);
draw quartercircle scaled 6u shifted (-8u,0);
draw halfcircle scaled 6u shifted (0,0);
draw quartercircle scaled 16u shifted (-3u,0);

dotlabel.bot(btex $B_1$ etex, (-3,0)*u);
dotlabel.llft(btex $B_2$ etex, (-8,0)*u);
dotlabel.bot(btex $C_3,C_4$ etex, (-7,0)*u);
pair A,B[], C[];
A=(0,0);
B1=(-3,0)*u;
B2=(-8,0)*u;
C3=(-7,0)*u;

B3=p intersectionpoint pp;
%C2=pp intersectionpoint ppp;
C2=(A--B3) intersectionpoint ppp;
C1=ppp intersectionpoint pppp;
B4=(A--C1) intersectionpoint ppppp;

dotlabel.ulft(btex $B_3$ etex, B3);
dotlabel.rt(btex $C_2$ etex, C2);
dotlabel.urt(btex $C_1$ etex, C1);
dotlabel.urt(btex $B_4$ etex, B4);

draw A--B1--C1--cycle dashed evenly;
draw B2--C2 dashed evenly; draw B4--C3 dashed evenly;
draw A--B3--C3--cycle  dashed evenly;

 
  for n=1 step 1  until 4 :     
    C[n+4]=C[n] xscaled -1;
    B[n+4]=B[n] xscaled -1;
  %draw C[n+3] with pencircle scaled 2bp;
  endfor ;
  %dotlabel.bot(btex $C_5$ etex, C3);
  dotlabel.top(btex $C_5$ etex, C5);
  dotlabel.bot(btex $C_7,C_8$ etex, C7);
  dotlabel.llft(btex $C_6$ etex, C6);
  %dotlabel.bot(btex $B_4$ etex, B4);
  dotlabel.bot(btex $B_5$ etex, B5);
  dotlabel.lrt(btex $B_6$ etex, B6);
  dotlabel.urt(btex $B_7$ etex, B7);
  dotlabel.ulft(btex $B_8$ etex, B8);
  label.rt(btex $(d)$ etex, (9u,0));
endfig;
end




beginfig(2) %% Tartan de Cantor
  u:=4cm;
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