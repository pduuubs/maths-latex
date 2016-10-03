prologues:=2;
verbatimtex
etex

u:=4cm;

  
beginfig(1)
  
  pair A[]; pair M[]; pair N[];
  A2:=origin;
  A1:=(0,1)*u;
  A3:=(1,0)*u;
  %A4:=(0,1)*u;
 draw A1--A2--A3;

 pickup pencircle scaled 0.1 mm ;

for i=0 upto 20:
    draw ((i/20)[A1,A2])--((i/20)[A2,A3]);
  endfor;
endfig;

beginfig(3)
  
  pair A[]; pair M[]; pair N[];
  A2:=origin;
  A1:=(0,1)*u;
  A3:=(1,0)*u;
  %A4:=(0,1)*u;
 draw A1--A2--A3;

 pickup pencircle scaled 0.1 mm ;

for i=0 upto 10:
    draw ((i/10)[A1,A2])--((i/10)[A2,A3]);
  endfor;
  dotlabel lft ( btex $A$ etex, A1 );
    dotlabel lft ( btex $B$ etex, A2 );
    dotlabel rt ( btex $C$ etex, A3 );
endfig;
beginfig(2)
  
  pair A[]; pair M[]; pair N[];
  A2:=origin;
  A1:=(0,1)*u;
  A3:=(1,0)*u;
  %A4:=(0,1)*u;
 draw A1--A2--A3;

 pickup pencircle scaled 0.1 mm ;

%for i=0 upto 4:
 draw ((1/4)[A1,A2])--((1/4)[A2,A3]);
 M1:=(1/4)[((1/4)[A1,A2]),((1/4)[A2,A3])];
 % endfor;
    dotlabel lft ( btex $A$ etex, A1 );
    dotlabel lft ( btex $B$ etex, A2 );
    dotlabel rt ( btex $C$ etex, A3 );
    dotlabel urt ( btex $M$ etex, M1 );

    pickup pencircle scaled 0.25 mm ;
    for i=0 upto 100:
% draw ((1/4)[A1,A2])--((1/4)[A2,A3]);
     draw (i/100)[((i/100)[A1,A2]),((i/100)[A2,A3])]; % N[i]:=
     endfor;
endfig; 
 
 % q:= (p scaled 0.5 yscaled -1 rotated (90))..(p scaled 0.5 shifted ((0,0.5)*u))..(p scaled 0.5 shifted ((0.5,0.5)*u))..(p scaled 0.5 yscaled -1 rotated (-90) shifted ((1,0.5)*u));
  %draw q;
   
%endfig;

end
