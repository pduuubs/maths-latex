%Différents papiers (Nouvelle version)
%papiers1.mp
%Christophe Poulain
%création :  07 Septembre 2003
%Modification : 13 Septembre 2003
%----------------------------------------------------------
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

%paramètres de traçage
vardef cadre(expr q,r)=
  z.so=q;
  z.ne=r;
  path limite;
  limite:=z.so*cm--(x.ne*cm,y.so*cm)--z.ne*cm--(x.so*cm,y.ne*cm)--cycle;
  extra_endfig := "clip currentpicture to limite;" & extra_endfig;
enddef;

boolean orig,uni;
orig=false;
vardef origine(expr p)=
  x.origine:=x.so*cm+xpart(p)*quad.u;
  y.origine:=y.so*cm+ypart(p)*quad.u;
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
    pickup pencircle scaled 0.5;
          %horizontales
    for i:=y.so step t until y.ne:
      draw p1 shifted (0,i*cm);
    endfor;
          %verticales
    for i:=x.so step t until x.ne :
      draw p2 shifted (i*cm,0);
    endfor;
    );
  gri
enddef;

def enplace=
  if orig:
    xscaled x.u yscaled y.u shifted (z.origine)
  else:
    xscaled x.u yscaled y.u shifted (z.so*cm)
  fi
enddef;

vardef placepoint(expr q,r)=
  (q,r) enplace
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
p1:=(x.so*cm, 0)--(x.ne*cm, 0);
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
  axehor=(x.so,y.origine)--(x.ne,y.origine);
  axever=(x.origine,y.so)--(x.origine,y.ne);
  picture axx;
  axx=image(
    drawarrow (x.so,y.origine)--(x.ne,y.origine);
    drawarrow (x.origine,y.so)--(x.origine,y.ne);
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
p1:=(x.so*cm, 0)--(x.ne*cm, 0);
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
    for i:=0 upto 2*(x.ne-x.so):
      for j:=0 upto 2*(y.ne-y.so):
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
    p1:=(x.so*cm,0)--((x.so+1)*cm,0)--((x.so*cm,0) rotatedabout(((x.so+1)*cm,0),-60))--cycle;
     %triangle bas
    p2:=((x.so*cm,0)--((x.so+1)*cm,0)--((x.so*cm,0) rotatedabout(((x.so+1)*cm,0),60))--cycle) shifted (-0.5cm,((sqrt3)/2)*cm);
     %grille horizontale1
    pickup pencircle scaled 0.5;
    numeric etag;
    etag=floor((y.ne-y.so)/(sqrt(3)/2));
    for i:=0 step 2 until etag:
      for j:=0 upto (x.ne-x.so):
	draw p1 shifted (j*cm,i*((sqrt3)/2)*cm);
	draw p2 shifted (j*cm,i*((sqrt3)/2)*cm);
      endfor
    endfor;
     %grille horizontale 2
    pickup pencircle scaled 0.5;
    for i:=1 step 2 until etag:
      for j:=0 upto (x.ne-x.so):
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
    $=z.so shifted (q*(x.u,0)+r*(x.u/2,y.u));
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
    for i:=0 step 1 until (y.ne-y.so):
      for j:=0 step 2 until (x.ne-x.so+2):
	fill (fullcircle scaled 1bp shifted (z.so*cm)) shifted (j*((sqrt3)/2)*cm,i*cm);
      endfor
    endfor;
     %grille horizontale 2
    for i:=0 step 1 until (y.ne-y.so-1):
      for j:=1 step 2 until (x.ne-x.so+1):
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
    p1:=(x.so*cm,1*cm)--((x.so*cm,0) rotatedabout((x.so*cm,1*cm),60))--(x.so*cm,0);%--cycle;
     %triangle bas
    p2:=((x.so*cm,1*cm)--((x.so*cm,0) rotatedabout((x.so*cm,1*cm),-60))--(x.so*cm,0)) shifted (((sqrt3)/2)*cm,0*cm);
     %grille horizontale1
    pickup pencircle scaled 0.5;
    for i:=0 step 2  until (x.ne-x.so):
      for j:=0 upto (y.ne-y.so-1):
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
  hexa:=(x.so*cm,y.so*cm)--((x.so+1)*cm,y.so*cm)--((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120))--(((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120))--(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)) rotatedabout((((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120)),-120))--((((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120)) rotatedabout((((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)) rotatedabout((((x.so+1)*cm,y.so*cm) rotatedabout(((x.so*cm,y.so*cm) rotatedabout(((x.so+1)*cm,y.so*cm),-120)),-120)),-120)),-120))--cycle;
  $=image(
    pickup pencircle scaled 0.5;
    numeric etag;
    etag=floor((y.ne-y.so)/(sqrt(3)/2));
    for i:=0 step 3  until (x.ne-x.so):
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
    $=(hexa shifted(0.5cm,0)) shifted((colo-1)*3*cm,(lign-1)*2*((sqrt 3)/2)*cm);
  else:
    $=(hexa shifted(0.5cm,0)) shifted((colo-1)*1.5*cm,((lign-1)*2+1)*((sqrt 3)/2)*cm);
  fi;
  $
enddef;

%Ajouté sur proposition de C.Kibleur.

vardef Projection(expr pp)=
  save h,k,$;
  pair h,k;
  picture $;
  $=image(
    h - pp=whatever*(z.origine*cm - (z.origine*cm+(1*x.u,0))) rotated 90;
    h=whatever[z.origine*cm+(1*x.u,0),z.origine*cm];
    k - pp=whatever*(z.origine*cm - (z.origine*cm+(0,1*y.u))) rotated 90;
    k=whatever[z.origine*cm+(0,1*y.u),z.origine*cm];
    draw k--pp--h dashed evenly;
    );
  $
enddef;