
%% =====================================================================
%% COURBES.MP
%% Courbes 1 (8 octobre 2001)
%% Macros pour pr�senter des courbes
%% Jean-Michel Sarlat -- Mai 1997
%% =====================================================================


%% =====================================================================
%% Rep�re et coordonn�es
%% =====================================================================
pair origine;

vardef repere(expr lx,ly,ox,oy,ux,uy) =
        % affectations
        _ox := ox ; _oy := oy ;
        _ux := ux ; _uy := uy ;
        _lx := lx ; _ly := ly ;
        origine := (_ox,_oy);
        unitex := ux;
        unitey := uy;
        unite := ux;
        r_xmin := -ox/ux;
        r_xmax := (lx-ox)/ux;
        r_ymin := -oy/uy;
        r_ymax := (ly-oy)/uy;
        _largeur_marques := 1mm;
enddef;

% Proc�dure de mise en place dans le rep�re
def en_place =
    xscaled unitex yscaled unitey shifted origine
enddef;

% D�finir un point
vardef rpoint(expr x,y) =
        (x,y) en_place
enddef;

%% =====================================================================
%% Construction dans le rep�re
%% =====================================================================
% Axes
vardef rtrace.axes(expr t) =
        drawarrow (0,_oy)--(_lx,_oy) withpen pencircle scaled t;
        drawarrow (_ox,0)--(_ox,_ly) withpen pencircle scaled t;
enddef;


% Marque des unit�s
vardef marque.unites(expr l) =
        draw (_ox+_ux,_oy-l)--(_ox+_ux,_oy+l);
        draw (_ox-l,_oy+_uy)--(_ox+l,_oy+_uy);
        _largeur_marques := l;
enddef;

% Labels des unit�s
vardef etiquette.unites =
        label.bot(btex $+1$ etex,(_ox+_ux,_oy-_largeur_marques));
        label.lft(btex $+1$ etex,(_ox-_largeur_marques,_oy+_uy));
enddef;
% Grille
vardef rtrace.lignes.horizontales(expr d,taille,couleur) =
       numeric ni,nf;
       ni := floor(r_ymin/d);
       nf := floor(r_ymax/d);
       for i=ni upto nf:
          draw ((r_xmin,i*d)--(r_xmax,i*d)) en_place
            withpen pencircle scaled taille
            withcolor couleur;
       endfor;
enddef; vardef rtrace.lignes.verticales(expr d,taille,couleur) =
       numeric ni,nf;
       ni := floor(r_xmin/d);
       nf := floor(r_xmax/d);
       for i=ni upto nf:
          draw ((i*d,r_ymin)--(i*d,r_ymax)) en_place
            withpen pencircle scaled taille
            withcolor couleur;
       endfor;
enddef; vardef rtrace.grille(expr d,taille,couleur) =
       rtrace.lignes.horizontales(d,taille,couleur);
       rtrace.lignes.verticales(d,taille,couleur);
enddef;

% Projeter un point sur les axes
vardef projection.axes(expr a,taille,ecart) =
       draw ((0,ypart a)--a--(xpart a,0)) en_place
             dashed evenly scaled ecart
             withpen pencircle scaled taille
enddef;

% Trac� d'une droite parall�le � l'axe des y
vardef parallele.axe.y(expr x) =
       draw (_ox+x*_ux,0)--(_ox+x*_ux,_ly)
enddef;

% Trac� d'une droite parall�le � l'axe des x
vardef parallele.axe.x(expr y) =
       draw (0,_oy+y*_uy)--(_lx,_oy+y*_uy)
enddef;

% On coupe tout ce qui d�passe les limites du rep�re
vardef decoupe.repere =
        clip currentpicture to (0,0)--(0,_ly%+0.5*_uy
        )--(_lx%+0.5*_ux
        ,_ly%
        +0.5*_uy
        )--(_lx%+0.5*_ux
        ,0)--cycle;
enddef;

vardef etiquette.axes =
        label.bot (btex $x$ etex,(_lx,_oy));
        label.lft(btex $y$ etex,(_ox,_ly));
enddef;

%% =====================================================================
%% Partie num�rque
%% =====================================================================

numeric Pi; numeric E;

Pi := 3.1415926535897932384626433832795028841971; E  := 2.71828;

vardef sin(expr x) =
        sind(x/Pi*180)
enddef;

vardef cos(expr x) =
        cosd(x/Pi*180)
enddef;

vardef tan(expr x) =
        sin(x)/cos(x)
enddef;

vardef exp(expr x) =
        E**x
enddef;

vardef ch(expr x) =
        (E**x + E**(-x))/2
enddef;

vardef sh(expr x) =
        (E**x - E**(-x))/2
enddef;

vardef th(expr x) =
        (E**(2*x) - 1)/(E**(2*x) + 1)
enddef;

vardef ln(expr x) =
        (mlog(x))/256
enddef;

vardef pui(expr x,a) =
        if x>0 : (exp(a*ln(x))) else : (if x=0 : (0) else : (-exp(a*ln(-x))) fi ) fi
enddef;


%% =====================================================================
%% Partie fonctions
%% Fonctions pr�d�finies t -> fx(t) et y -> fy(t)
%% =====================================================================
numeric pas_derivation;

pas_derivation := 0.01;

vardef f(expr t) =
           (fx(t),fy(t))
enddef; vardef dfx(expr t) =
       (fx(t+pas_derivation)-fx(t-pas_derivation))/2/pas_derivation
enddef; vardef dfy(expr t) =
       (fy(t+pas_derivation)-fy(t-pas_derivation))/2/pas_derivation
enddef; vardef vd(expr t) =
      unitvector((dfx(t),dfy(t)))
enddef; vardef ftrace(expr ti,tf,n) =
    numeric fpas;
    fpas := (tf-ti)/n;
    f(ti)
    for i = 1 upto n:
        ..f(ti+i*fpas)
    endfor
enddef; vardef rtrace.courbe(expr ti,tf,n,taille,couleur) =
    draw ftrace(ti,tf,n) en_place
         withpen pencircle scaled taille
         withcolor couleur;
enddef;

vardef rtrace.courbepoint(expr ti,tf,n,taille,pointille) =
    draw ftrace(ti,tf,n) en_place
         withpen pencircle scaled taille
         dashed pointille
enddef;



%% =====================================================================
%% Partie �quations diff�rentielles
%% Fonction pr�d�finie (x,y) -> F(x,y)  <numeric>
%% =====================================================================
vardef champ.vecteurs(expr x,y,pas,dx,couleur) =
  npasxg := floor((x-r_xmin)/pas);
  npasxd := floor((r_xmax-x)/pas);
  npasyb := floor((y-r_ymin)/pas);
  npasyh := floor((r_ymax-y)/pas);
  facteur:= unite*dx;
  %for i = 0 upto npasxg:
    % for j = 0 upto npasyb:
   %    drawarrow ((0,0)--unitvector((1,F(x-i*pas,y-j*pas))))
    %             scaled facteur
     %            shifted rpoint(x-i*pas,y-j*pas)
      %           withcolor couleur;
    % endfor
    % for j = 0 upto npasyh:
%       drawarrow ((0,0)--unitvector((1,F(x-i*pas,y+j*pas))))
%                 scaled facteur
 %                shifted rpoint(x-i*pas,y+j*pas)
  %               withcolor couleur;
   %  endfor
 % endfor
  for i = 0 upto npasxd:
     for j = 0 upto npasyb:
       drawarrow ((0,0)--unitvector((1,F(x+i*pas,y-j*pas))))
                 scaled facteur
                 shifted rpoint(x+i*pas,y-j*pas)
                 withcolor couleur;
     endfor
     for j = 0 upto npasyh:
       drawarrow ((0,0)--unitvector((1,F(x+i*pas,y+j*pas))))
                 scaled facteur
                 shifted rpoint(x+i*pas,y+j*pas)
                 withcolor couleur;
     endfor
  endfor
enddef;

%% =====================================================================
endinput
%% =====================================================================



      Page compos�e par petitParseur[mp2html(dr)] le vendredi 3 mai 2002
