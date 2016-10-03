prologues:=2;

vardef mylabel(expr pic, p, t) =
    save H; pair H;
    H = point t of p +
        8bp * unitvector(direction t of p) rotated 90;
    label(pic, H);
  enddef;


beginfig(5)  %transfo pi/2-x
u:=3cm;
 pickup pencircle scaled 0.2mm ;
  draw (-1u,0)--(1u,0);
  draw (0,-u)--(0,u);
  drawarrow (0,0)--(1u,0)            withpen pencircle scaled 1bp;
  drawarrow (0,0)--(0,1u)            withpen pencircle scaled 1bp;
  draw fullcircle scaled 2u;


pair o,A,B,C,D,E,S,BB;
  o:=(0,0); A:=((sqrt 3)/2,0.5)*u; C:=((sqrt 3)/2,0)*u; S:=(0,0.5)*u; D:=(0.5,0)*u; E:=(0,(sqrt 3)/2)*u;
draw o--A;  %rayon (Ox) à pi/6
draw A--C dashed evenly; draw A--S dashed evenly;
BB:=((sqrt 3)/2,-0.5)*u;
  B:=(0.5,(sqrt 3)/2)*u; 
  draw o--B ;
  draw B--D dashed evenly; draw B--E dashed evenly; draw o--BB dashed withdots;



    path p; 
  p = (0,0)..(-u,u)..(u,u);
  p:=fullcircle scaled 2.5u;
  i:=length(p)/12; draw point i of p withpen pencircle scaled 4bp; mylabel(btex $x$ etex,p,i);
  i:=length(p)/6; draw point i of p withpen pencircle scaled 4bp; mylabel(btex ${\pi \over 2}-x$ etex,p,i);
endfig;

end