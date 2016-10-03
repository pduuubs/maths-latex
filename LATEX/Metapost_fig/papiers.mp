prologues:=2;
%&latex
%usepackage{amsmath}
verbatimtex
%&latex
etex
vardef origine(expr p)=
  x.origine:=xpart(p);
  y.origine:=ypart(p);
enddef;

vardef millimetre suffix co =
 color coul;
 numeric hauteur, largeur ;
 path p[];
 %ligne horizontale
 p1:=(x.so*cm, 0)--(x.ne*cm, 0);
 %ligne verticale
 p2:=(0,y.so*cm)--(0,y.ne*cm);
 %choix de la couleur
 if str co ="" :
 coul:= orange
 else :
 coul:=co
 fi;
 %grille millimétrique
 pickup pencircle scaled 0.2;
 %lignes horizontales
 for i:=y.so step 0.1 until y.ne :
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignes verticales
 for i:=x.so step 0.1 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
 %grille demi-centimétrique
 pickup pencircle scaled 0.5;
 %lignes horizontales
 for i:=y.so step 0.5 until y.ne:
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignes verticales
 for i:=x.so step 0.5 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
 %grille centimétrique
 pickup pencircle scaled 0.7;
 %lignes horizontales
 for i:=y.so step 1 until y.ne:
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignes verticales
 for i:=x.so step 1 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
 %grille penta-centimétrique
 %lignes horizontales
 pickup pencircle scaled 1;
 for i:=0 step -5 until y.so :
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 for i:=0 step 5 until y.ne :
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignesverticales
 for i:=0 step -5 until x.so :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
 for i:=0 step 5 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
enddef;

%graduation de l 'axe des x
vardef graduationx =
  label.llft(btex $O$ etex,(x.origine*cm,y.origine*cm));
  label.llft( btex $x$ etex,(x.ne*cm,y.origine*cm));
  pickup pencircle scaled 0.5;
  %dotlabel.bot(btex 1 etex,z.origine*cm+(1*x.u,0));
  draw (x.so*cm,y.origine*cm)--(x.ne*cm,y.origine*cm);
  
 % label.lrt( btex $x'$ etex,(x.so*cm,y.origine*cm));
enddef;

%graduation de l 'axe des y
vardef graduationy =
  label.lrt( btex $y$ etex,(x.origine*cm,y.ne*cm));
  pickup pencircle scaled 0.5;
  %dotlabel.lft(btex 1 etex,z.origine*cm+(0,1*y.u));
  draw (x.origine*cm,y.so*cm)--(x.origine*cm,y.ne*cm);
  %label.urt( btex $y'$ etex,(x.origine*cm,y.so*cm)) ;
enddef;

vardef papiermillimetre(expr m,n,p,q,r)(suffix col)= %
  origine(m);
  x.u:=n*cm;
  y.u:=p*cm;
  z.so=q;
  z.ne=r;
  millimetre col;
  graduationx;
  graduationy;
  ahangle:=30;
  ahlength:=1.5mm;
  drawarrow m--(m shifted (0.97x.u,0)) withpen pencircle scaled 1.2;
  label.bot( btex $i$ etex, (0.35x.u,0));
  drawarrow m--(m shifted (0,0.97y.u))withpen pencircle scaled 1.2;
  label.lft( btex $j$ etex, (-0.1x.u,0.5y.u));
enddef;

vardef papiermilli(expr m,n,p,q,r)(suffix col)=
  origine(m);
  x.u:=n*cm;
  y.u:=p*cm;
  z.so=q;
  z.ne=r;
  millimetre col;
  drawarrow (x.so*cm,y.origine*cm)--(x.ne*cm,y.origine*cm);
  drawarrow (x.origine*cm,y.so*cm)--(x.origine*cm,y.ne*cm);  
enddef;

vardef papiermil(expr m,n,p,q,r)(suffix col)=
  origine(m);
  x.u:=n*cm;
  y.u:=p*cm;
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  millimetre col;
enddef;


vardef demicenti suffix co =
 color coul;
 path p[];
  %ligne horizontale
 p1:=(x.so*cm, 0)--(x.ne*cm, 0);
 %ligne verticale
 p2:=(0,y.so*cm)--(0,y.ne*cm);
 %choix de la couleur
 if str co ="" :
 coul:= orange
 else :
 coul:=co
 fi;
 %grille demi-centimétrique
 pickup pencircle scaled 0.5;
 %lignes horizontales
 for i:=y.so step 0.5 until y.ne:
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignes verticales
 for i:=x.so step 0.5 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
 %grille centimétrique
 pickup pencircle scaled 0.5;%0.7
 %lignes horizontales
 for i:=y.so step 1 until y.ne:
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignes verticales
 for i:=x.so step 1 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
 %grille penta-centimétrique
 %lignes horizontales
 pickup pencircle scaled 0.5;%1
 for i:=0 step -5 until y.so :
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 for i:=0 step 5 until y.ne :
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignesverticales
 for i:=0 step -5 until x.so :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
 for i:=0 step 5 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
enddef;

vardef papiercinq(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  demicenti col;
enddef;

vardef pointe suffix co=
  pickup pencircle scaled 0.5;
  for i:=0 upto 2*(x.ne-x.so):
    for j:=0 upto 2*(y.ne-y.so):
      draw (fullcircle scaled 1bp shifted(z.so*cm)) shifted ((i/2,j/2)*cm) withcolor co;
    endfor;
  endfor;
enddef;

vardef papierpointe(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  pointe col;
enddef;

vardef centi suffix co =
 color coul;
 path p[];
 %ligne horizontale
 p1:=(x.so*cm, 0)--(x.ne*cm, 0);
 %ligne verticale
 p2:=(0,y.so*cm)--(0,y.ne*cm);
 %choix de la couleur
 if str co="" :
 coul:= orange
 else :
 coul:=co
 fi;
 %grille centimétrique
 pickup pencircle scaled 0.5;%0.7
 %lignes horizontales
 for i:=y.so step 1 until y.ne:
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignes verticales
 for i:=x.so step 1 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
enddef;

vardef papierun(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  centi col;
enddef;

vardef cahier suffix co =
 color coul;
 path p[];
 %ligne horizontale
 p1:=(x.so*cm, 0)--(x.ne*cm, 0);
 %ligne verticale
 p2:=(0,y.so*cm)--(0,y.ne*cm);
 %choix de la couleur
 if str co ="" :
 coul:= orange
 else :
 coul:=co
 fi;
 %grille 2-millimétrique
 pickup pencircle scaled 0.5;
 %lignes horizontales
 for i:=y.so step 0.2 until y.ne:
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %grille 8-millimétrique
 pickup pencircle scaled 0.7;
 %lignes horizontales
 for i:=y.so step 0.8 until y.ne:
 draw p1 shifted (0,i*cm) withcolor coul;
 endfor;
 %lignes verticales
 for i:=x.so step 0.8 until x.ne :
 draw p2 shifted (i*cm,0) withcolor coul;
 endfor;
enddef;

vardef papiercahier(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  cahier col;
enddef;

vardef triang suffix co =
 color coul;
 path p[];
 %triangle haut
 p1:=(x.so*cm, 0)--((x.so+1)*cm, 0)--((x.so*cm, 0) rotatedabout(((x.so+1)*cm,0),-60))--cycle;
 %triangle bas
 p2:=((x.so*cm, 0)--((x.so+1)*cm, 0)--((x.so*cm, 0) rotatedabout(((x.so+1)*cm,0),60))--cycle) shifted (-0.5cm,((sqrt3)/2)*cm);
  %choix de la couleur
 if str co ="" :
   coul:= noir
 else :
   coul:=co
 fi;
 %grille horizontale1
 pickup pencircle scaled 0.5;
 for i:=y.so step 2 until y.ne:
   for j:=0 upto (x.ne-x.so):
     draw p1 shifted (j*cm,i*((sqrt3)/2)*cm) withcolor coul;
     draw p2 shifted (j*cm,i*((sqrt3)/2)*cm) withcolor coul;
   endfor;
 endfor;
 %grille horizontale 2
 pickup pencircle scaled 0.5;
 for i:=(y.so+1) step 2 until y.ne:
   for j:=0 upto (x.ne-x.so):
     draw p1 shifted ((j-0.5)*cm,i*((sqrt3)/2)*cm) withcolor coul;
     draw p2 shifted ((j+0.5)*cm,i*((sqrt3)/2)*cm) withcolor coul;
   endfor;
 endfor;
enddef;

vardef papiertriangle(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  triang col;
enddef;

vardef isompointe suffix co =
 color coul;
 %choix de la couleur
 if str co ="" :
   coul:= noir
 else :
   coul:=co
 fi;
 %grille horizontale1
 pickup pencircle scaled 0.5;
 for i:=0 step 1 until (y.ne-y.so):
   for j:=0 step 2 until (x.ne-x.so+2):
     draw (fullcircle scaled 1bp shifted (z.so*cm)) shifted (j*((sqrt3)/2)*cm,i*cm) withcolor coul;
   endfor;
 endfor;
 %grille horizontale 2
 pickup pencircle scaled 0.5;
 for i:=0 step 1 until (y.ne-y.so-1):
   for j:=1 step 2 until (x.ne-x.so+1):
     draw (fullcircle scaled 1bp shifted (z.so*cm)) shifted (j*((sqrt3)/2)*cm,(i+0.5)*cm) withcolor coul;
   endfor;
 endfor;
enddef;

vardef papierisompointe(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  isompointe col;
enddef;

vardef isom suffix co =
 color coul;
 path p[];
 %triangle haut
 p1:=(x.so*cm,1*cm)--((x.so*cm,0) rotatedabout((x.so*cm,1*cm),60))--(x.so*cm,0);%--cycle;
 %triangle bas
 p2:=((x.so*cm,1*cm)--((x.so*cm,0) rotatedabout((x.so*cm,1*cm),-60))--(x.so*cm,0)) shifted (((sqrt3)/2)*cm,0*cm);
  %choix de la couleur
 if str co ="" :
   coul:= noir
 else :
   coul:=co
 fi;
 %grille horizontale1
 pickup pencircle scaled 0.5;
 for i:=0 step 2  until (x.ne-x.so):
   for j:=0 upto (y.ne-y.so-1):
     draw p1 shifted (i*((sqrt3)/2)*cm,j*cm) withcolor coul;
     draw p2 shifted ((i+1)*((sqrt3)/2)*cm,j*cm) withcolor coul;
   endfor;
 endfor;
enddef;

vardef papierisom(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  isom col;
enddef;

vardef hexa suffix co =
 color coul;
 path p[];
 %triangle haut
 p1:=(x.so*cm,y.so*cm)--((x.so+1)*cm,y.so*cm)--((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120))--(((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120))--(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)) rotatedabout((((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120)),-120))--((((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120)) rotatedabout((((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)) rotatedabout((((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120)),-120)),-120))--cycle;
  %choix de la couleur
 if str co ="" :
   coul:= noir
 else :
   coul:=co
 fi;
 %grille horizontale1
 draw p1 withpen pencircle scaled 3bp;
 pickup pencircle scaled 0.5;
 for i:=0 step 3  until (x.ne-x.so):
   for j:=0 step 2 until (y.ne-y.so):
     draw p1 shifted (i*cm,j*((sqrt 3)/2)*cm) withcolor coul;
     draw p1 shifted ((i+1.5)*cm,(j+1)*((sqrt 3)/2)*cm) withcolor coul;
   endfor;
 endfor;
enddef;

vardef papierhexa(expr q,r)(suffix col)=
  x.so:=xpart(q);
  y.so:=ypart(q);
  x.ne:=xpart(r);
  y.ne:=ypart(r);
  hexa col;
enddef;

endinput
