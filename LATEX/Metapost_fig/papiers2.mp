%Différents papiers (Nouvelle version)
%papiers1.mp
%Christophe Poulain
%création :  07 Septembre 2003
%Modification : 13 Septembre 2003
%----------------------------------------------------------
prologues:=2;
verbatimtex
%&latex
etex
input format;
init_numbers(btex $-$ etex, btex$1$etex, btex$ times 10$etex, btex$"" sup -$etex, btex$"" sup 2$etex);
%Constantes
color rouge,vert,bleu,jaune,noir,blanc,orange,rose,violet,ciel,orangevif,gris;
rouge=(1,0,0);
vert=(0,1,0);
bleu=(0,0,1);
noir=(0,0,0);
blanc=(1,1,1);
orange=(1,0.5,0);
violet=rouge+bleu;
rose=(1,0.7,0.7);
ciel=bleu+vert;
orangevif=(1,0.25,0.1);
jaune=rouge+vert;
gris=0.8*white;

boolean orig,uni;
orig=false;

vardef origine(expr p)=
  x.origine:=(x.so+xpart(p))*quad.u;
  y.origine:=(y.so+ypart(p))*quad.u;
  orig:=true;
enddef;

vardef unites(expr g,h)=
  x.u:=g*cm;
  y.u:=h*cm;
enddef;

vardef grille(expr t)=
  save gri;
  picture gri;
  orig:=false;
  x.u:=t*cm;
  y.u:=t*cm;
  quad.u:=t*cm;
  gri=image(
    path p[];
      %horizontale
    p1:=(x.so*cm,0)--(x.ne*cm,0);
      %verticale
    p2:=(0,y.so*cm)--(0,y.ne*cm);
          %options
          %horizontales
    %for i:=0 step t until (y.ne-y.so):
    for i:=y.so step t until y.ne:
      draw p1 shifted (0,i*cm);
    endfor;
          %verticales
    %for i:=0 step t until (x.ne-x.so):
    for i:=x.so step t until x.ne:
      draw p2 shifted (i*cm,0);
    endfor;
    );
  gri
enddef;

def enplace=
  if orig:
    xscaled x.u yscaled y.u shifted (z.origine)
  else:
    xscaled x.u yscaled y.u shifted (z.so)
  fi
enddef;

vardef placepoint(expr q,r)=
  (q,r) enplace
enddef;

def replace=
  xscaled (1/x.u) yscaled (1/y.u) shifted (-z.origine*cm)
enddef;

def retrouvecoord(expr p)=%trasnforme les coordonées du point d'affixe p dans le repère absolu de metapost en les coordonnées du point dans le repère défini par l'utilisateur
  p replace
enddef;

vardef papiermillimetre=
  save $;
  picture $;
  orig:=false;
  x.u:=1cm;
  y.u:=1cm;
  quad.u:=1cm;
  $=image(
    path p[];
      %horizontale
    p1:=(x.so*cm,0)--(x.ne*cm,0);
      %verticale
    p2:=(0,y.so*cm)--(0,y.ne*cm);
    %grille millimétrique
    pickup pencircle scaled 0.2;
    %horizontales
    for j:=y.so step 0.1 until y.ne:
      draw p1 shifted (0,j*cm);
    endfor;
    %verticales
    for j:=x.so step 0.1 until x.ne :
      draw p2 shifted (j*cm,0);
    endfor;
    %grille demi-centimétrique
    pickup pencircle scaled 0.5;
    %horizontales
    for j:=y.so step 0.5 until y.ne:
      draw p1 shifted (0,j*cm);
    endfor;
    %verticales
    for j:=x.so step 0.5 until x.ne :
      draw p2 shifted (j*cm,0);
    endfor;
    %grille centimétrique
    pickup pencircle scaled 0.7;
    %horizontales
    for j:=y.so step 1 until y.ne:
      draw p1 shifted (0,j*cm);
    endfor;
    %verticales
    for j:=x.so step 1 until x.ne :
      draw p2 shifted (j*cm,0);
    endfor;    
    %grille penta-centimétrique
    pickup pencircle scaled 1;
    %horizontales
    for j:=y.so step 5 until y.ne:
      draw p1 shifted (0,j*cm);
    endfor;
    %verticales
    for j:=x.so step 5 until x.ne :
      draw p2 shifted (j*cm,0);
    endfor;
    );
  $
enddef;

vardef axes=
  path axehor,axever;
  axehor=(x.so*cm,y.origine)--(x.ne*cm,y.origine);
  axever=(x.origine,y.so*cm)--(x.origine,y.ne*cm);
  picture axx;
  axx=image(
    drawarrow (x.so*cm,y.origine)--(x.ne*cm,y.origine);
    drawarrow (x.origine,y.so*cm)--(x.origine,y.ne*cm);
    label.llft(btex $O$ etex,z.origine);
    );
  axx
enddef;

%graduation des axes
string marque_axe;
marque_axe:="simple";
vardef graduantx@#=
  if marque_axe="complete":
    for k=floor((x.so*cm-x.origine)/x.u) upto floor((x.ne*cm-x.origine)/x.u):
      if k<>0:
	dotlabel.@#(format("%10f",k),placepoint(k,0));
      fi;
    endfor;
  elseif marque_axe="simple":
    dotlabel.@#(format("%10f",1),placepoint(1,0));
  fi;
enddef;
vardef graduanty@#=
  if marque_axe="complete":
    for k=floor((y.so*cm-y.origine)/y.u) upto floor((y.ne*cm-y.origine)/y.u):
      if k<>0:
	dotlabel.@#(format("%10f",k),placepoint(0,k));
      fi;
    endfor;
  elseif marque_axe="simple":
    dotlabel.@#(format("%10f",1),placepoint(0,1));
  fi;
enddef;

vardef Pointe(text t)=
  for p_=t: if pair p_:
      fill fullcircle scaled 1mm shifted p_;
    fi;
  endfor;
enddef;

vardef papiercahier=
  save $;
  orig:=false;
  picture $;
  x.u:=8mm;
  y.u:=8mm;
  quad.u:=8mm;
  $=image(
    path p[];
  %horizontale
p1:=(x.so*cm,0)--(x.ne*cm,0);
  %verticale
p2:=(0,y.so*cm)--(0,y.ne*cm);
     %grille 2-millimétrique
    pickup pencircle scaled 0.5;
     %lignes horizontales
    for i:=y.so step 0.2 until y.ne:
      draw p1 shifted (0,i*cm);
    endfor;
     %grille 8-millimétrique
    pickup pencircle scaled 1;
     %lignes horizontales
    for i:=y.so step 0.8 until y.ne:
      draw p1 shifted (0,i*cm);
    endfor;
     %lignes verticales
    for i:=x.so step 0.8 until x.ne :
      draw p2 shifted (i*cm,0);
    endfor;
    );
  $
enddef;

vardef papierpointe=
  save $;
  picture $;
  orig:=false;
  x.u:=5mm;
  y.u:=5mm;
  quadu:=5mm;
  $=image(
    for i:=0 upto 2*(xpart(retrouvecoord(z.ne*cm))-xpart(retrouvecoord(z.so*cm))):
      for j:=0 upto 2*(ypart(retrouvecoord(z.ne*cm))-ypart(retrouvecoord(z.so*cm))):
	fill ((fullcircle scaled 1bp shifted(z.so*cm)) shifted ((i/2,j/2)*cm));
      endfor
    endfor;
    );
  $
enddef;

vardef papiertriangle=
  save $;
  orig:=false;
  x.u:=1cm;
  y.u:=(sqrt(3)/2)*cm;
  picture $;
  $=image(
    path p[];
     %triangle haut
    p1:=(x.so*cm,0)--(x.so*cm+1cm,0)--((x.so*cm,0) rotatedabout((x.so*cm+1cm,0),-60))--cycle;
    %triangle bas
    p2:=((x.so*cm,0)--(x.so*cm+1cm,0)--((x.so*cm,0) rotatedabout((x.so*cm+1cm,0),60))--cycle) shifted (-0.5cm,((sqrt3)/2)*cm);
    %grille horizontale1
    pickup pencircle scaled 0.5;
    numeric etag;
    etag=floor((ypart(retrouvecoord(z.ne*cm))-ypart(retrouvecoord(z.so*cm)))/(sqrt(3)/2));
    for i:=0 step 2 until etag:
      for j:=0 upto (xpart(retrouvecoord(z.ne*cm))-xpart(retrouvecoord(z.so*cm))):
	draw p1 shifted (j*cm,i*((sqrt3)/2)*cm);
	draw p2 shifted (j*cm,i*((sqrt3)/2)*cm);
      endfor
    endfor;
     %grille horizontale 2
    pickup pencircle scaled 0.5;
    for i:=1 step 2 until etag:
      for j:=0 upto (xpart(retrouvecoord(z.ne*cm))-xpart(retrouvecoord(z.so*cm))):
	draw p1 shifted ((j-0.5)*cm,i*((sqrt3)/2)*cm);
	draw p2 shifted ((j+0.5)*cm,i*((sqrt3)/2)*cm);
      endfor
    endfor;
    );
  $
enddef;

vardef placepointtri(expr q,r)=
  save $;
  pair $;
  if orig:
    $=z.origine shifted (q*(x.u,0)+r*(x.u/2,y.u));
  else:
    $=z.so*cm shifted (q*(x.u,0)+r*(x.u/2,y.u));
  fi;
  $
enddef;

vardef papierisometriquepointe=
  save $;
  orig:=false;
  y.u:=1cm;
  x.u:=(sqrt(3)/2)*cm;
  picture $;
  $=image(
    %grille horizontale1
    pickup pencircle scaled 0.5;
    for i:=0 step 1 until (ypart(retrouvecoord(z.ne*cm))-ypart(retrouvecoord(z.so*cm))):
      for j:=0 step 2 until (xpart(retrouvecoord(z.ne*cm))-xpart(retrouvecoord(z.so*cm))+2):
	fill (fullcircle scaled 1bp shifted (z.so*cm)) shifted (j*((sqrt3)/2)*cm,i*cm);
      endfor
    endfor;
     %grille horizontale 2
    for i:=0 step 1 until (ypart(retrouvecoord(z.ne*cm))-ypart(retrouvecoord(z.so*cm))-1):
      for j:=1 step 2 until (xpart(retrouvecoord(z.ne*cm))-xpart(retrouvecoord(z.so*cm))+1):
	fill (fullcircle scaled 1bp shifted (z.so*cm)) shifted (j*((sqrt3)/2)*cm,(i+0.5)*cm);
      endfor
    endfor;
    );
  $
enddef;

vardef papierisometrique=
  save $;
  orig:=false;
  x.u:=(sqrt(3)/2)*cm;
  y.u:=1cm;
  picture $;
  $=image(
    path p[];
    %triangle haut
    p1:=(x.so*cm,1cm)--((x.so*cm,0) rotatedabout((x.so*cm,1cm),60))--(x.so*cm,0);
    %triangle bas
    p2:=((x.so*cm,1cm)--((x.so*cm,0) rotatedabout((x.so*cm,1cm),-60))--(x.so*cm,0)) shifted (((sqrt3)/2)*cm,0);
    %grille horizontale1
    pickup pencircle scaled 0.5;
    for i:=0 step 2  until (xpart(retrouvecoord(z.ne*cm))-xpart(retrouvecoord(z.so*cm))):
      for j:=0 upto (ypart(retrouvecoord(z.ne*cm))-ypart(retrouvecoord(z.so*cm))-1):
	draw p1 shifted (i*((sqrt3)/2)*cm,j*cm);
	draw p2 shifted ((i+1)*((sqrt3)/2)*cm,j*cm);
      endfor
    endfor;
    );
  $
enddef;

vardef papierhexagonal=
  save $;
  picture $;
  orig:=false;
  path hexa;
  %hexagone de départ
  hexa:=z.so*cm--(x.so*cm+1cm,y.so*cm)--(z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120))--((x.so*cm+1cm,y.so*cm) rotatedabout((z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120)),-120))--((z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120)) rotatedabout(((x.so*cm+1cm,y.so*cm) rotatedabout((z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120)),-120)),-120))--(((x.so*cm+1cm,y.so*cm) rotatedabout((z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120)),-120)) rotatedabout(((z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120)) rotatedabout(((x.so*cm+1cm,y.so*cm) rotatedabout((z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120)),-120)),-120)),-120))--cycle;
  $=image(
    pair centrehexa;
    centrehexa=1/2[z.so*cm,((x.so*cm+1cm,y.so*cm) rotatedabout((z.so*cm rotatedabout((x.so*cm+1cm,y.so*cm),-120)),-120))];
    pickup pencircle scaled 0.5;
    numeric etag;
    etag=floor((abs(y.ne*cm-y.so*cm))/((sqrt(3)/2)*cm));
    for i:=0 step 3  until (abs(x.ne*cm-x.so*cm)/1cm):
      for j:=0 step 2 until etag:
	draw hexa shifted ((i+0.5)*cm,j*((sqrt 3)/2)*cm);
	draw hexa shifted ((i+2)*cm,(j+1)*((sqrt 3)/2)*cm);
      endfor
    endfor;
    );
  $
enddef;

vardef reperehexa(expr colo,lign)=
  save $;
  path $;
  if (colo mod 2)=1:
    $=(hexa shifted(0.5cm,0)) shifted((colo-1)*1.5*cm,(lign-1)*2*((sqrt 3)/2)*cm);
  else:
    $=(hexa shifted(0.5cm,0)) shifted((colo-1)*1.5*cm,((lign-1)*2+1)*((sqrt 3)/2)*cm);
  fi;
  $
enddef;

vardef Centrehexa(expr colo,lign)=
  save $;
  pair $;
  if (colo mod 2)=1:
    $=(centrehexa shifted(0.5cm,0)) shifted((colo-1)*1.5*cm,(lign-1)*2*((sqrt 3)/2)*cm);
  else:
    $=(centrehexa shifted(0.5cm,0)) shifted((colo-1)*1.5*cm,((lign-1)*2+1)*((sqrt 3)/2)*cm);
  fi;
  $
enddef;
  
%Ajouté sur proposition de C.Kibleur.

vardef Projection(expr pp)=
  save h,k,$;
  pair h,k;
  picture $;
  $=image(
    h - pp=whatever*(z.origine - (z.origine+(x.u,0))) rotated 90;
    h=whatever[z.origine+(x.u,0),z.origine];
    k - pp=whatever*(z.origine - (z.origine+(0,y.u))) rotated 90;
    k=whatever[z.origine+(0,y.u),z.origine];
    draw k--pp--h dashed evenly;
    );
  $
enddef;
