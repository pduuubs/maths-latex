%Trac� de courbes
%courbes.mp
%Christophe Poulain
%cr�ation : 17 Avril 2003
%derni�re modification : 05 Septembre 2003
%----------------------------------------------------------
input format;
init_numbers(btex $-$ etex, btex$1$etex, btex$ times 10$etex, btex$"" sup -$etex, btex$"" sup 2$etex);
%D�finiton Metapost
path Cb[],Cpa[],Cpo[],Cpopa[];
%Constantes
pi:=3.141592654;
e:=2.718281828;
c:=57.29578; % conversion d'un radian en degr�s
color rouge,vert,bleu,jaune,noir,blanc,orange,rose,violet,ciel,orangevif,gris,grisfonce;
rouge=(1,0,0);
bleu=(0,0,1);
noir=(0,0,0);
blanc=(1,1,1);
orange=(1,0.5,0);
violet=(0.9,0.1,0.9);
rose=(1,0.7,0.7);
ciel=0.9*(0.25,1,1);
orangevif=(1,0.25,0.1);
vert=(1,1,1)-violet;
jaune=(0.9,0.9,0.2);
gris=0.7*white;
grisfonce=0.6*white;
%%Marquage
string marque_re;
marque_re:= "non";
%%Marquage d'un point par une croix en x
def marquepoint(expr p)=
  draw (p shifted (cm*(-1/20,1/20)))--(p shifted (cm*(1/20,-1/20)));
  draw (p shifted(cm*(-1/20,-1/20)))--(p shifted (cm*(1/20,1/20)));
enddef;

%---------------
%D�finition de "fonctions de base"
%---------------
vardef sin(expr t) = sind(c*t) enddef;

vardef cos(expr t) = cosd(c*t) enddef;

vardef tan(expr t) = sin(t)/cos(t) enddef;

vardef exp(expr t) = e**t enddef;

vardef ch(expr x)=(exp(x)+exp(-x))/2 enddef;

vardef sh(expr x)=(exp(x)-exp(-x))/2 enddef;

vardef ln(expr t) = mlog(t)/256 enddef;

vardef arcsin(expr x)=%D�finition math�matique en radian
  pi*angle((sqrt(1-x**2),x))/180
enddef;

vardef arccos(expr x)=%D�finition math�matique en radian
  pi*angle((x,sqrt(1-x**2)))/180
enddef;
%---------------
%Macros de tra�age
%---------------
%---courbe y=f(x)
vardef courbe[](expr a,b,nb)(text texte)=
 path $;
 for i:=0 upto nb :
 x@[i]:=(a+i*(b-a)/nb);
 x:=x@[i];
 y@[i]:=texte;
 endfor ;
 Cb@:=(x@.0*x.u,y@.0*y.u)
 for i:=1 upto nb :
   ..(x@[i]*x.u,y@[i]*y.u)
 endfor;
 Cb@:=Cb@ shifted (z.origine*cm);
 $=Cb@;
 $
enddef;
%---courbe (x(t),y(t))
vardef param[](expr a,b,nb)(text texte)=
  path $;
  for i:=0 upto nb :
    t@[i]:= (a+i*(b-a)/nb) ;
    t:=t@[i];
    x@[i]:=xpart(texte);
    y@[i]:=ypart(texte);
  endfor;
 Cpa@:= (x@.0*x.u,y@.0*y.u)
 for i:=1 upto nb :
   ..(x@[i]*x.u,y@[i]*y.u)
 endfor;
 Cpa@:=Cpa@ shifted (z.origine*cm);
 $=Cpa@;
 $
enddef;
%---courbe rho=f(theta)
vardef polaire[](expr a,b,nb)(text texte)=
  path $;
  for i:=0 upto nb :
    t@[i]:= (a+i*(b-a)/nb) ;
    theta:=t@[i];
    x@[i]:=(texte)*cos(theta);
    y@[i]:=(texte)*sin(theta);
 endfor;
 Cpo@:= (x@.0*x.u,y@.0*y.u)
 for i:=1 upto nb :
   ..(x@[i]*x.u,y@[i]*y.u)
 endfor;
 Cpo@:=Cpo@ shifted (z.origine*cm);
 $=Cpo@;
 $
enddef;
%---courbe rho=f(t),theta=g(t)
vardef polaireparam[](expr a,b,nb)(text texte)=
  path $;
  for i:=0 upto nb :
    t@[i]:=(a+i*(b-a)/nb);
    t:=t@[i];
    rho:=(pi/2)*xpart(texte);
    theta:=2*ypart(texte);
    x@[i]:=rho*cos(theta);
    y@[i]:=rho*sin(theta);
 endfor;
 Cpopa@:=(x@.0*x.u,y@.0*y.u)
 for i:=1 upto nb :
   ..(x@[i]*x.u,y@[i]*y.u)
 endfor;
 Cpopa@:=Cpopa@ shifted (z.origine*cm);
 $=Cpopa@;
 $
enddef;
%param�tres de tra�age et papier millim�tr�
vardef cadre(expr q,r)=
  z.so=q;
  z.ne=r;
  path limite;
  limite:=z.so*cm--(x.ne*cm,y.so*cm)--z.ne*cm--(x.so*cm,y.ne*cm)--cycle;
  extra_endfig := "clip currentpicture to limite;" & extra_endfig;
enddef;
vardef origine(expr p)=
  x.origine=xpart(p);
  y.origine=ypart(p);
enddef;
vardef unites(expr q,r)=
  x.u:=q*cm;
  y.u:=r*cm;
enddef;
vardef millimetrepourcourbe suffix co =
  color coul;
  numeric hauteur, largeur ;
  path p[];

%horizontale
  p1:=(x.so*cm, 0)--(x.ne*cm, 0);
  %verticale
  p2:=(0,y.so*cm)--(0,y.ne*cm);
  %choix de la couleur
  if str co ="" :
    coul:= orange
  else :
    coul:=co
  fi;

   %grille penta-centim�trique
  %horizontales
  pickup pencircle scaled 1.5;
  for i:=y.so step 5 until y.ne :
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=x.so step 5 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille centim�trique
  pickup pencircle scaled 0.7;
  %horizontales
  for i:=y.so step 1 until y.ne:
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=x.so step 1 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille demi-centim�trique
  pickup pencircle scaled 0.5;
  %horizontales
  for i:=y.so step 0.5 until y.ne:
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=x.so step 0.5 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille millim�trique
  pickup pencircle scaled 0.2;
  %horizontales
  for i:=y.so step 0.1 until y.ne :
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=x.so step 0.1 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
enddef;
 
vardef axes=
  path axehor,axever;
  axehor=(x.so*cm,y.origine*cm)--(x.ne*cm,y.origine*cm);
  axever=(x.origine*cm,y.so*cm)--(x.origine*cm,y.ne*cm);
  drawarrow (x.so*cm,y.origine*cm)--(x.ne*cm,y.origine*cm);
  drawarrow (x.origine*cm,y.so*cm)--(x.origine*cm,y.ne*cm);
  label.llft(btex $O$ etex,(x.origine*cm,y.origine*cm));
enddef;
%graduation des axes
vardef graduationx(expr unitex) =
  label.bot(unitex,z.origine*cm+(1*x.u,0));
  marquepoint(z.origine*cm+(1*x.u,0));
enddef;

vardef graduationy(expr unitey) =
  label.lft(unitey,z.origine*cm+(0,1*y.u));
  marquepoint(z.origine*cm+(0,1*y.u));
enddef;

vardef graduantx@#=
  for k=floor((x.so*cm-x.origine*cm)/x.u) upto floor((x.ne*cm-x.origine*cm)/x.u):
    if k<>0:
      dotlabel.@#(format("%10f",k),placepoint(k,0));
      %label.@#(format("%10f",k),placepoint(k,0));
    fi;
  endfor;
enddef;
vardef graduanty@#=
  for k=floor((y.so*cm-y.origine*cm)/y.u) upto floor((y.ne*cm-y.origine*cm)/y.u):
    if k<>0:
      dotlabel.@#(format("%10f",k),placepoint(0,k));
      %label.@#(format("%10f",k),placepoint(0,k));
    fi;
  endfor;
enddef;

%l�gende des axes
vardef legendex(expr legx)=
  label.llft(legx,(x.ne*cm,y.origine*cm));
enddef;

vardef legendey(expr legy)=
  label.lrt(legy,(x.origine*cm,y.ne*cm));
enddef;
%%18 Avril
vardef Projectiona(expr pp)=
  save h,$;
  pair h;
  picture $;
  $=image(
    h - pp=whatever*(z.origine*cm - (z.origine*cm+(1*x.u,0))) rotated 90;
    h=whatever[z.origine*cm+(1*x.u,0),z.origine*cm];
    draw pp--h dashed evenly;
    );
  $
enddef;
vardef Projectiono(expr pp)=
  save h,$;
  pair h;
  picture $;
  $=image(
    h - pp=whatever*(z.origine*cm - (z.origine*cm+(0,1*y.u))) rotated 90;
    h=whatever[z.origine*cm+(0,1*y.u),z.origine*cm];
    draw pp--h dashed evenly;
    );
  $
enddef;
%%19 Avril
def enplace=
  xscaled x.u yscaled y.u shifted (z.origine*cm)
enddef;
vardef placepoint(expr q,r)=
  (q,r) enplace
enddef;
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
%%21 Avril
vardef hachuragecourbe(expr chemin, angle, ecart, trace)suffix co=
  save $;
  picture $;
  path support;
  support=((cm*(-37,0))--(cm*(37,0))) rotated angle;
  if trace=1:
    drawoptions(dashed evenly);
  elseif trace=2:
    drawoptions(dashed dashpattern(on12bp off6bp on3bp off6bp));
  fi;
  $=image(
    for j=-200 upto 200:
      if ((support shifted (ecart*j*(cm,0))) intersectiontimes chemin)<>(-1,-1):
        draw support shifted (ecart*j*(cm,0))
        withcolor if str co="" : noir else:co fi;
      fi
    endfor;
    );
  clip $ to chemin;
  drawoptions();
  $
enddef;
vardef entrecourbes(expr aa,bb)suffix co=
  save $;
  picture $,figure;
  pair pti[];
  path parcour[];
  n:=0;
  for k=0 upto 100:
    if ((subpath(k/100*length aa,(k+1)/100*length aa) of aa) intersectiontimes bb)<>(-1,-1):
      n:=n+1;
      pti[n]:=(subpath(k/100*length aa,(k+1)/100*length aa) of aa) intersectionpoint bb;
    fi;
  endfor;
  if n>1:
    parcour1:=aa cutbefore ((xpart(pti[1]),y.so*cm)--(xpart(pti[1]),y.ne*cm)) cutafter ((xpart(pti[n]),y.so*cm)--(xpart(pti[n]),y.ne*cm));
    parcour2:=bb cutbefore ((xpart(pti[1]),y.so*cm)--(xpart(pti[1]),y.ne*cm)) cutafter ((xpart(pti[n]),y.so*cm)--(xpart(pti[n]),y.ne*cm));
    parcour3:=parcour1--(reverse parcour2)--cycle;
    if marque_re="hachure":
      $=image(
        draw hachuragecourbe(parcour3,60,0.25,0);
        );
    elseif marque_re="remplis":
      figure:=currentpicture;
      currentpicture:=nullpicture;
      $=image(
        fill parcour3 withcolor if str co="" : gris else: co fi;;
        draw figure;
        );
    fi;
  fi;
  $
enddef;
%Dessin de la tangente en cart�sien
vardef tangente[](expr abscisse)=
  save $;
  picture $;
  pair ptt,tangent;
  t:=(((abscisse*x.u+x.origine*cm)-xpart(point 0 of Cb@))/(xpart(point (length Cb@) of Cb@)-xpart(point 0 of Cb@)))*length Cb@;
  ptt:=point t of Cb@;
  tangent:=unitvector(direction t of Cb@);
  $=image(
    drawdblarrow (ptt shifted (-25*tangent))--(ptt shifted (25*tangent));
    marquepoint(ptt);
    );
  $
enddef;


%%%%%%%%%
vardef parahor(expr yh)=
  axehor shifted (0,yh*y.u)
enddef;
vardef paraver(expr xh)=
  axever shifted (xh*x.u,0)
enddef;
%Rep�rage d'un point en cart�sien
vardef pointcourbe[](expr abscisse)=
  save $;
  pair $;
  t:=(((abscisse*x.u+x.origine*cm)-xpart(point 0 of Cb@))/(xpart(point (length Cb@) of Cb@)-xpart(point 0 of Cb@)))*length Cb@;
  $=point t of Cb@;
  $
enddef;
%hachurage de l'aire sous la courbe comprise entre x=a et x=b en cart�sien
vardef airesouscourbe[](expr a,b) suffix co=
  save $;
  picture $,figure;
  path contourage;
  contourage:=placepoint(a,0)--(Cb@ cutbefore paraver(a) cutafter paraver(b))--placepoint(b,0)--cycle;
  if marque_re="hachure":
    $=image(
      draw hachuragecourbe(contourage,120,0.25,1);
      draw placepoint(a,0)--pointcourbe@(a);
      draw placepoint(b,0)--pointcourbe@(b);
      );
  elseif marque_re="remplis":
    figure:=currentpicture;
    currentpicture:=nullpicture;
    $=image(
      fill contourage withcolor if str co="" : gris else: co fi;;
      draw figure;
      draw placepoint(a,0)--pointcourbe@(a);
      draw placepoint(b,0)--pointcourbe@(b);
      );
  fi;
  $
enddef;
%%%Modif de grille pour pouvoir avoir un trait plus �pais et centr�e � l'origine %V.Pantaloni le 01/07/07
vardef grille(expr t)=
  path p[];
  %horizontale
  p1:=(x.so*cm, 0)--(x.ne*cm, 0);
  %verticale
  p2:=(0,y.so*cm)--(0,y.ne*cm);
  %options
  pickup pencircle scaled 0.5;
  drawoptions(withcolor gris);
%%%start modif
%horizontales
  for i:=0 step t until y.ne:
    draw p1 shifted (0,i*cm);
  endfor;
  for i:=0 step -t until y.so:
    draw p1 shifted (0,i*cm);
  endfor;
  %verticales
  for i:=0 step t until x.ne :
    draw p2 shifted (i*cm,0);
  endfor;
  for i:=0 step -t until x.so :
    draw p2 shifted (i*cm,0);
  endfor;
%end modif
%
  %lignes originelles:
%   %horizontales
%   for i:=y.so step t until y.ne:
%     draw p1 shifted (0,i*cm);
%   endfor;
%   %verticales
%   for i:=x.so step t until x.ne :
%     draw p2 shifted (i*cm,0);
%   endfor;
  drawoptions();
enddef;

%%22 Avril
vardef pointparam[](expr parametre,depart,arrivee)=
  save $;
  pair $;
  $=point((parametre/(arrivee-depart))*length Cpa@) of Cpa@;
  $
enddef;
vardef tangenteparam[](expr parametre,depart,arrivee)=
  save $;
  picture $;
  pair ptt,tangent;
  t:=(parametre*length Cpa@)/(arrivee-depart);
  tangent:=unitvector(direction t of Cpa@);
  ptt:=pointparam@(parametre,depart,arrivee);
  $=image(
    drawdblarrow (ptt shifted(-25*tangent))--(ptt shifted(25*tangent));
    marquepoint(ptt);
    );
  $
enddef;
vardef titre(expr place,placee,longueur,largeur,titrage)=
  save $;
  picture $;
  path cadrage;
  cadrage=placepoint(place,placee)--(placepoint(place,placee) shifted(cm*(longueur,0)))--(placepoint(place,placee) shifted(cm*(longueur,largeur)))--(placepoint(place,placee) shifted(cm*(0,largeur)))--cycle;
  $=image(
    fill cadrage withcolor jaune;
    %draw cadrage;
    label(titrage,1/2[placepoint(place,placee),(placepoint(place,placee) shifted(cm*(longueur,largeur)))]);
    );
  $
enddef;
vardef depart(expr q,r,p,s,t)=
  cadre(q,r);
  origine(p);
  unites(s,t);
enddef;
vardef pointpolaireparam[](expr parametre,depart,arrivee)=
  save $;
  pair $;
  $=point((parametre/(arrivee-depart))*length Cpopa@) of Cpopa@;
  $
enddef;
vardef tangentepolaireparam[](expr parametre,depart,arrivee)=
  save $;
  picture $;
  pair ptt,tangent;
  t:=(parametre*length Cpopa@)/(arrivee-depart);
  tangent:=unitvector(direction t of Cpopa@);
  ptt:=pointpolaireparam@(parametre,depart,arrivee);
  $=image(
    drawdblarrow (ptt shifted(-25*tangent))--(ptt shifted(25*tangent));
    marquepoint(ptt);
    );
  $
enddef;
%24 Avril
vardef pointpolaire[](expr parametre,depart,arrivee)=
  save $;
  pair $;
  $=point((parametre/(arrivee-depart))*length Cpo@) of Cpo@;
  $
enddef;
vardef tangentepolaire[](expr parametre,depart,arrivee)=
  save $;
  picture $;
  pair ptt,tangent;
  t:=(parametre*length Cpo@)/(arrivee-depart);
  tangent:=unitvector(direction t of Cpo@);
  ptt:=pointpolaire@(parametre,depart,arrivee);
  $=image(
    drawdblarrow (ptt shifted(-25*tangent))--(ptt shifted(25*tangent));
    marquepoint(ptt);
    );
  $
enddef;
%Distance dans le rep�re donn�
vardef distance(expr aa,bb)=abs((xpart(aa)/x.u,ypart(aa)/y.u)-(xpart(bb)/x.u,ypart(bb)/y.u))
enddef;
%Labelisation d'une courbe cart�sienne
vardef labelise@#(expr a)(suffix pos) suffix co =
 numeric t;
 pair pt,tangent;
 color coul;
 if str co ="" :
 coul:= noir
 else :
 coul:=co
 fi;
 if str pos ="" :
 t:=0.5*length Cb@#
 else :
 t:=pos*length Cb@#
 fi;
 pt:=point t of Cb@#;
 tangent:=unitvector(direction t of Cb@#);
 label(a rotated angle(tangent),pt+2mm*(tangent rotated 90)) withcolor coul;
enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Macro PANTALONI pour graduer Ox ou Oy tous les...combien . (cf NewCourbe.11)
vardef graduextousles(expr combien)=
for k=floor((x.so*cm-x.origine*cm)/(combien*x.u)) upto floor((x.ne*cm-x.origine*cm)/(combien*x.u)):
    if k<>0:
      dotlabel.bot(format("%10f",combien*k),placepoint(combien*k,0));
    fi;
  endfor;
enddef;
vardef gradueytousles(expr combien)=
for k=floor((y.so*cm-y.origine*cm)/(combien*y.u)) upto floor((y.ne*cm-y.origine*cm)/(combien*y.u)):
    if k<>0:
      dotlabel.lft(format("%10f",combien*k),placepoint(0,combien*k));
    fi;
  endfor;
enddef;
%Macros suppl�mentaires
%

%%Marquage d'un point par une croix en + (Vincent PANTALONI le 1/7/7)
def marqueplus(expr p)=
  pickup pensquare scaled 1bp;
  draw (p shifted (cm*(-1/15,0)))--(p shifted (cm*(1/15,0)));
  draw (p shifted(cm*(0,-1/15)))--(p shifted (cm*(0,1/15)));
  pickup pensquare scaled 0.45bp;
enddef;
%%%Modif de grille pour pouvoir avoir une grille au trait plus �pais, plus fonc� et centr�e � l'origine %V.Pantaloni le 01/07/07
vardef grilleprincipale(expr t)=
  path p[];
  %horizontale
  p1:=(x.so*cm, 0)--(x.ne*cm, 0);
  %verticale
  p2:=(0,y.so*cm)--(0,y.ne*cm);
  %options
  pickup pencircle scaled 1;
  drawoptions(withcolor grisfonce);
  %horizontales
  for i:=0 step t until y.ne:
    draw p1 shifted (0,i*cm);
  endfor;
  for i:=0 step -t until y.so:
    draw p1 shifted (0,i*cm);
  endfor;
  %verticales
  for i:=0 step t until x.ne :
    draw p2 shifted (i*cm,0);
  endfor;
  for i:=0 step -t until x.so :
    draw p2 shifted (i*cm,0);
  endfor;
  drawoptions();
  pickup pencircle scaled 0.7;
enddef;
%%%%%%%%%%%% TANGENTES de tailles variables. (coeff 1 donne tangente)
vardef tangentevp[](expr abscisse, coeff)=
  save $;
  picture $;
  pair ptt,tangent;
  t:=(((abscisse*x.u+x.origine*cm)-xpart(point 0 of Cb@))/(xpart(point (length Cb@) of Cb@)-xpart(point 0 of Cb@)))*length Cb@;
  ptt:=point t of Cb@;
  tangent:=unitvector(direction t of Cb@);
  $=image(%
    drawdblarrow (ptt shifted (-25*coeff*tangent))--(ptt shifted (25*coeff*tangent));
    marqueplus(ptt);
    );
  $
enddef;
%%% Pour une demi tangente, � droite si coeff sup � 0 et � g si coeff inf � 0
vardef demitangente[](expr abscisse, coeff)= %
  save $;
  picture $;
  pair ptt,tangent;
  t:=(((abscisse*x.u+x.origine*cm)-xpart(point 0 of Cb@))/(xpart(point (length Cb@) of Cb@)-xpart(point 0 of Cb@)))*length Cb@;
  ptt:=point t of Cb@;
  tangent:=coeff*unitvector(direction t of Cb@);
  $=image(%
    drawarrow (ptt--(ptt shifted (25*tangent)));
    marqueplus(ptt);%
    );
  $
enddef;
%%%%%%%%%%
%#######################################
%papier millimetr� mais centr� � l'origine qui doit etre (0,0)
vardef millimetrecentreorigine suffix co =
  color coul;
  numeric hauteur, largeur ;
  path p[];
  %horizontale
  p1:=(x.so*cm, 0)--(x.ne*cm, 0);
  %verticale
  p2:=(0,y.so*cm)--(0,y.ne*cm);
  %choix de la couleur
  if str co ="" :
    coul:= orange
  else :
    coul:=co
  fi;
%
%premierquadrant (N.E.)
%
  %grille penta-centim�trique
  %horizontales
  pickup pencircle scaled 1.2;
  for i:=0 step 5 until y.ne :
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step 5 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille centim�trique
  pickup pencircle scaled 0.7;
  %horizontales
  for i:=0 step 1 until y.ne:
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step 1 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille demi-centim�trique
  pickup pencircle scaled 0.5;
  %horizontales
  for i:=0 step 0.5 until y.ne:
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step 0.5 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille millim�trique
  pickup pencircle scaled 0.2;
  %horizontales
  for i:=0 step 0.1 until y.ne :
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step 0.1 until x.ne :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;


  %Deuxieme quadrant (N.W.)
%
  %grille penta-centim�trique
  %horizontales
  pickup pencircle scaled 1.2;
  for i:=0 step -5 until y.so :
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step -5 until x.so :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille centim�trique
  pickup pencircle scaled 0.7;
  %horizontales
  for i:=0 step -1 until y.so:
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step -1 until x.so :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille demi-centim�trique
  pickup pencircle scaled 0.5;
  %horizontales
  for i:=0 step -0.5 until y.so:
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step -0.5 until x.so :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
  %grille millim�trique
  pickup pencircle scaled 0.2;
  %horizontales
  for i:=0 step -0.1 until y.so :
    draw p1 shifted (0,i*cm) withcolor coul;
  endfor;
  %verticales
  for i:=0 step -0.1 until x.so :
    draw p2 shifted (i*cm,0) withcolor coul;
  endfor;
enddef;

endinput;



