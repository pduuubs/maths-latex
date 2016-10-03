prologues:=2;
verbatimtex
etex

 %%%%%%%%%%%%%%%%%%%%%%%%%%

beginfig(1) %% Arbre (Pour un TP en 1S)
  u:=4cm; %h=2mm;
  pair A[], B[], C[];
  numeric k, t;
  A0=(0,0);
  A1=(0,u);
  draw A0--A1;
  B1=A1 rotatedaround(A0,40);
    C1=A1 rotatedaround(A0,10);
    C2=A1 rotatedaround(A0,20);
    C3=A1 rotatedaround(A0,30);
  draw A0--B1 dashed evenly;
  B2=B1 scaled 0.6;
   
  B3=B2 shifted A1;
  draw B3--A1;
  draw B2--B3 dashed evenly;
  draw A1..C1..C2..C3..B1 dashed evenly;
  draw ((A1..C1..C2..C3..B1) scaled 0.2);
  dotlabel.rt(btex $A$ etex, A0);
  dotlabel.rt(btex $B$ etex, A1);
  dotlabel.llft(btex $B_1$ etex, B1);
  dotlabel.llft(btex $B_2$ etex, B2);
  dotlabel.llft(btex $C$ etex, B3);
  label.lft(btex $t$ etex, (-0.05u,0.25u));
endfig;


 beginfig(2) %% Arbre2
   u:=3cm;
   pair A[];
   numeric k,t;
   path P[],Tree;
   t=40;
   k=0.8;
 % vardef Branche(expr A,B,n) =
    % save C; pair C;
%     C = A rotatedaround(1/3[A,B], 120);
%     if n>0:
%       koch( A,        1/3[A,B], n-1);
%       koch( 1/3[A,B], C,        n-1);
%       koch( C,        2/3[A,B], n-1);
%       koch( 2/3[A,B], B,        n-1);
%     else:
%       draw A--1/3[A,B]--C--2/3[A,B]--B withpen pencircle scaled 0.15mm;;
%     fi;
%   enddef;
   A0=(0,0); A1=(0,u);
   %A[2]=((A1 rotatedaround(A0,t)) scaled k ) shifted A1;
   %A[3]=((A1 rotatedaround(A0,90-t)) scaled k ) shifted A1;
   P0=A1--A0; %tronc
   draw P0;
   %Tree=A0--A1;
   P1=((P0 scaled k) rotatedaround(A0,t)) shifted A1;
   P2=((P0 scaled k) rotatedaround(A0,-t)) shifted A1;
   P3=P1--P2;
   %P1=A2--A1--A3; % V de deux branches
   draw P3;
   dotlabel.rt(btex $A_0$ etex, A0);
   %dotlabel.rt(btex $A_1$ etex, A1);
   %dotlabel.rt(btex $A_2$ etex, A2);
   %dotlabel.rt(btex $A_3$ etex, A3);
   
   P4=(((P3 shifted A0)  scaled k) shifted point 3 of P3) rotatedaround(point 3 of P3,t) ;
   P5=(((P3 shifted A0)  scaled k) shifted point 3 of P3) rotatedaround(point 3 of P3,-t) ;
   %draw P4;
   %draw P5;
   %draw (P3 shifted A0);
   % dotlabel.rt(btex $4_0$ etex, point 0 of P4);
%    dotlabel.top(btex $1$ etex, point 1 of P4);
%    dotlabel.lft(btex $2$ etex, point 2 of P4);
%    dotlabel.lft(btex $3$ etex, point 3 of P4);
%    dotlabel.rt(btex $5_0$ etex, point 0 of P5);
%    dotlabel.top(btex $1$ etex, point 1 of P5);
%    dotlabel.lft(btex $2$ etex, point 2 of P5);
%    dotlabel.lft(btex $3$ etex, point 3 of P5);

   P6=P4--P3--(point 1 of P5)--P5;
   draw P6;
   % dotlabel.rt(btex $6_0$ etex, point 0 of P6);
%    dotlabel.top(btex $6_1$ etex, point 1 of P6);
%    dotlabel.lft(btex $6_2$ etex, point 2 of P6);
%    dotlabel.lft(btex $6_3$ etex, point 3 of P6);
%    dotlabel.lft(btex $6_4$ etex, point 4 of P6);
%    dotlabel.top(btex $6_5$ etex, point 5 of P6);
%    dotlabel.lft(btex $6_6$ etex, point 6 of P6);
%    dotlabel.lft(btex $6_7$ etex, point 7 of P6);
%    dotlabel.lft(btex $6_8$ etex, point 8 of P6);
%    dotlabel.top(btex $6_9$ etex, point 9 of P6);
%    dotlabel.lft(btex $10$ etex, point 10 of P6);
%    dotlabel.lft(btex $11$ etex, point 11 of P6);
%    dotlabel.lft(btex $12$ etex, point 12 of P6);
   %0, 2, 9, 11
  
%A[2]=((A1 rotatedaround(A0,t)) scaled k ) shifted A1;
%k (Rotation[B, t °, A] - A) + B
%draw A0--A1--A2;

   %for i=0 upto 5:
   %b:=b  scaled k;
  %A[i+2]=(point 2 of b  rotatedaround(point 0 of b,i*t))  shifted A[i+1];
  %Tree:=Tree--A[i+2];
% withpen pencircle scaled 0.01bp;
      
 %   endfor;
%draw Tree;
 endfig;
%%%%______________________________________________________
%%%%______________________________________________________
 
 beginfig(3) %% Arbre3 Autre technique cf Metapost by doing
   
u:=1cm; branchrotation := 5;
offset := 180-branchrotation;
thinning := 0.75;
shortening := 0.95;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+8*uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,-offset-8*uniformdeviate(branchrotation))];
% Coefficients différents devant uniformdeviate donne arbre penché.
    if n>0:
      drawit(A--B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A--B,thickness);
      thickness := thinning*thickness;
      drawit(B--C, thickness);
      drawit(B--D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 10, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
%__________________________________________________________

 beginfig(4) %% Arbre3 Autre technique cf Metapost by doing
   
u:=1cm; branchrotation := 30;
offset := 180-branchrotation;
thinning := 0.7;
shortening := 0.85;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B,
      offset+0.55*uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,
      -offset-0.95*uniformdeviate(branchrotation))]; % Coefficients 0.75&0.95 différents donne arbre penché.
    if n>0:
      drawit(A--B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A--B,thickness);
      thickness := thinning*thickness;
      drawit(B--C, thickness);
      drawit(B--D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 10, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
%%______________________________
beginfig(5) %% Arbre3 Autre technique cf Metapost by doing
   
u:=1cm; branchrotation := 50;
offset := 180-branchrotation;
thinning := 0.7;
shortening := 0.80;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B,
      offset+uniformdeviate(1.5*branchrotation))]; %
    D := shortening[B, A rotatedaround(B,
      -offset-uniformdeviate(1.5*branchrotation))]; % Coefficients 0.75&0.95 différents donne arbre penché.
    if n>0:
      drawit(A--B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A--B,thickness);
      thickness := thinning*thickness;
      drawit(B--C, thickness);
      drawit(B--D, thickness);
    fi;
  enddef;
  tree((0,0), (0,u), 10, 1mm); %ATTENTION Capacity exceeded pour n=14 ou plus
 
  tree((0,0), (0,u), 6, 1mm);
endfig;
%%________________________________
beginfig(6) %% Arbre3 Autre technique cf Metapost by doing
   
u:=1cm; branchrotation :=5; %branchrotation := 5*2*uniformdeviate(branchrotation);
offset := 180-branchrotation;
thinning := 0.6;
shortening := 0.90;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+6*uniformdeviate(branchrotation+uniformdeviate(1)))]; %
    D := shortening[B, A rotatedaround(B, -offset-6*uniformdeviate(branchrotation+uniformdeviate(1)))];
% Coefficients 0.75&0.95 différents donne arbre penché.
    if n>0:
      drawit(A--B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A--B,thickness);
      thickness := thinning*thickness;
      drawit(B--C, thickness);
      drawit(B--D, thickness);
    fi;
  enddef;
  tree((0,0), (0,u), 10, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
%%_____________________________________
 beginfig(7) %% Arbre3 Autre technique cf Metapost by doing
   
u:=1cm; branchrotation := 5;
offset := 180-branchrotation;
thinning := 0.75;
shortening := 0.95;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+8*uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,-offset-8*uniformdeviate(branchrotation))];
% Coefficients différents devant uniformdeviate donne arbre penché.
    if n>0:
      drawit(A--B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A--B,thickness);
      thickness := thinning*thickness;
      drawit(B--C, thickness);
      drawit(B--D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 10, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;

 beginfig(8) %% Arbre Avec branches tordues
   
u:=1cm; branchrotation := 55;
offset := 180-branchrotation;
thinning := 0.7;
shortening := 0.8;
Coef:=1;
Coeff:=1;
UniD:=20;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,-offset-uniformdeviate(branchrotation))];
% Coefficients différents devant uniformdeviate donne arbre penché.
    if n>0:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B,thickness); %{dir (90+uniformdeviate(0)*uniformdeviate(5))}
      thickness := thinning*thickness;
      drawit(B{(direction 0 of (B--C))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--C))+(dir Coeff*uniformdeviate(-UniD))}C, thickness);
      drawit(B{(direction 0 of (B--D))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--D))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 10, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
%%%________________________________________________
 beginfig(9) %% Arbre Avec branches tordues
   
u:=1cm; branchrotation := 30;
offset := 180-branchrotation;
thinning := 0.75;
shortening := 0.95;
Coef:=1;
Coeff:=1;
UniD:=13;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,-offset-uniformdeviate(branchrotation))];
% Coefficients différents devant uniformdeviate donne arbre penché.
    if n>0:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B,thickness); %{dir (90+uniformdeviate(0)*uniformdeviate(5))}
      thickness := thinning*thickness;
      drawit(B{(direction 0 of (B--C))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--C))+(dir Coeff*uniformdeviate(-UniD))}C, thickness);
      drawit(B{(direction 0 of (B--D))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--D))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 8, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
%%_____________________________
 beginfig(10) %% Arbre Avec branches tordues
   
u:=1cm; branchrotation := 45;
offset := 180-branchrotation;
thinning := 0.7;
shortening := 0.8;
Coef:=1;
Coeff:=1;
UniD:=20;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,-offset-uniformdeviate(branchrotation))];
% Coefficients différents devant uniformdeviate donne arbre penché.
    if n>0:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B,thickness); %{dir (90+uniformdeviate(0)*uniformdeviate(5))}
      thickness := thinning*thickness;
      drawit(B{(direction 0 of (B--C))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--C))+(dir Coeff*uniformdeviate(-UniD))}C, thickness);
      drawit(B{(direction 0 of (B--D))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--D))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 10, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
%%_____________________________
 beginfig(11) %% Arbre Avec branches tordues
   
u:=1cm; branchrotation := 35;
offset := 180-branchrotation;
thinning := 0.7;
shortening := 0.85;
Coef:=1;
Coeff:=1;
UniD:=15;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,-offset-uniformdeviate(branchrotation))];
% Coefficients différents devant uniformdeviate donne arbre penché.
    if n>0:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B,thickness); %{dir (90+uniformdeviate(0)*uniformdeviate(5))}
      thickness := thinning*thickness;
      drawit(B{(direction 0 of (B--C))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--C))+(dir Coeff*uniformdeviate(-UniD))}C, thickness);
      drawit(B{(direction 0 of (B--D))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..{(direction 0 of (B--D))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 6, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
%%_____________________________
 beginfig(12) %% Arbre Avec branches tordues
   
u:=1cm; branchrotation := 50;
offset := 180-branchrotation;
thinning := 0.7;
shortening := 0.8;
Coef:=1;
Coeff:=1;
UniD:=10;
def drawit(expr p, linethickness) =
  draw p withpen pencircle scaled linethickness;
enddef;
vardef tree(expr A,B,n,size) =
    save C,D,thickness; pair C,D;
    thickness := size;
    C := shortening[B, A rotatedaround(B, offset+uniformdeviate(branchrotation))]; %
    D := shortening[B, A rotatedaround(B,-offset-uniformdeviate(branchrotation))];
% Coefficients différents devant uniformdeviate donne arbre penché.
    if n>0:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..%
	{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B, thickness);
      thickness := thinning*thickness;
      tree(B, C, n-1, thickness);
      tree(B, D, n-1, thickness);
    else:
      drawit(A{(direction 0 of (A--B))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..%
	{(direction 0 of (A--B))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}B,thickness); %
      thickness := thinning*thickness;
      drawit(B{(direction 0 of (B--C))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..%
	{(direction 0 of (B--C))+(dir Coeff*uniformdeviate(-UniD))}C, thickness);
      drawit(B{(direction 0 of (B--D))+(dir Coef*(uniformdeviate(UniD)-UniD/2))}..%
	{(direction 0 of (B--D))+(dir Coeff*(uniformdeviate(UniD)-UniD/2))}D, thickness);
    fi;
enddef;
tree((0,0), (0,u), 6, 2mm); %ATTENTION Capacity exceeded pour n=14 ou plus
endfig;
 end
