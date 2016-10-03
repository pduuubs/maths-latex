prologues:=2;

% Pour boîtes rectangulaires ou circulaires
input boxes;

% Utilisation des fontes fourier en 12pt pour btex ... etex
% (positionner la variable d'environnement TEX à "latex").
verbatimtex \documentclass[12pt]{article}
%\usepackage[oldstyle,upright]{fourier}
\usepackage[T1]{fontenc}
\usepackage{lmodern,textcomp}
\usepackage{color}
\begin{document}
etex

% Cercle des neuf points (d'après Denis R{\oe}gel, cahier GUT 39-40).
beginfig(1);
% Échelle :
numeric u; u=10mm;
% Déclarer tous les éléments du graphe :
pair A,B,C,D,E,F,G,H,I,J,K,L,N,X;
% Les sommets du triangle : A, B, C
A=origin; B-A=(7u,0); C-A=(u,5u);
% Milieux des côtés : D, E, F
D=0.5[A,B]; E=0.5[B,C] ; F=0.5[C,A];
% Pieds des hauteurs : G, H, I
G=whatever[B,C]=whatever[A,A+((C-B) rotated 90)];
H=whatever[C,A]=whatever[B,B+((A-C) rotated 90)];
I=whatever[A,B]=whatever[C,C+((B-A) rotated 90)];
% Orthocentre : X
X=(A--G) intersectionpoint (B--H);
% Milieux des segments AX, BX, CX : J, K, L
J=0.5[A,X]; K=0.5[B,X]; L=0.5[C,X];
% Centre du cercle des neuf points : N
% (intersection des médiatrices ID et DE par exemple)
N=whatever[0.5[I,D], (0.5[I,D]+((I-D) rotated 90))];
N=whatever[0.5[E,D], (0.5[E,D]+((E-D) rotated 90))];
% Calcul du rayon : r
r=arclength(I--N);
% Tracé
draw A--B--C--cycle;                               % le triangle ABC
draw A--G withcolor blue;                          % les hauteurs
draw B--H withcolor blue;
draw C--I withcolor blue;
draw fullcircle scaled 2r shifted N withcolor red; % cercle centre N, rayon 2r
% Les noms des points
dotlabel.llft(btex $A$ etex, A);
dotlabel.lrt(btex $B$ etex, B);
dotlabel.top(btex $C$ etex, C);
dotlabel.bot(btex \textcolor{green}{$D$} etex, D);
dotlabel.urt(btex \textcolor{green}{$E$} etex, E);
dotlabel.ulft(btex \textcolor{green}{$F$} etex, F);
dotlabel.urt(btex \textcolor{blue}{$G$} etex, G);
dotlabel.lft(btex \textcolor{blue}{$H$} etex, H);
dotlabel.llft(btex \textcolor{blue}{$I$} etex, I);
dotlabel.rt(btex \textcolor{green}{$J$} etex, J);
dotlabel.ulft(btex \textcolor{green}{$K$} etex, K);
dotlabel.lrt(btex \textcolor{green}{$L$} etex, L);
dotlabel.top(btex \textcolor{red}{$N$} etex, N);
dotlabel.lrt(btex $X$ etex, X);
endfig;

% Cercle de Gershgorin
beginfig(2);
numeric u; u=25mm;
pair O,C,M,X,Y;
color yellow;
yellow:= red + green;
path c;
O=origin;
C-O=(.2u,0);
M-O=(u,0);
X-O=(1.2u,0);
Y-O=(0,1.2u);
r=arclength(C--M);
c=fullcircle scaled 2r shifted C;
fill c withcolor yellow;
drawarrow O--X;
drawarrow O--Y;
draw fullcircle scaled 2u;
draw c;
% Labels *après* le cercle plein !
dotlabel.bot(btex $O$ etex, O);
dotlabel.bot(btex $C$ etex, C);
dotlabel.urt(btex 1 etex, M);
endfig;

% Graphe de transition d'une chaîne de Markov
beginfig(3);
numeric u; u=20mm;
pair A,B,C,D,E;
% Définition des sommets (chiffres dans cercle grisé) en plaçant leur centre
circleit.A(btex 1 etex); A.c=(2u,0); fill bpath.A withcolor .9 white;
circleit.B(btex 2 etex); B.c=(3u,0); fill bpath.B withcolor .9 white;
circleit.C(btex 3 etex); C.c=(4u,0); fill bpath.C withcolor .9 white;
circleit.D(btex 4 etex); D.c=(5u,0); fill bpath.D withcolor .9 white;
circleit.E(btex 5 etex); E.c=(6u,0); fill bpath.E withcolor .9 white;
% Dessiner ces sommets
drawboxed(A,B,C,D,E);
% Flèches reliant les sommets (arrêt au bord des disques A,B,C,D,E)
drawarrow A.c{dir 30} .. B.c{dir -30} cutbefore bpath.A cutafter bpath.B;
drawarrow B.c{dir 30} .. C.c{dir -30} cutbefore bpath.B cutafter bpath.C;
drawarrow C.c{dir 30} .. D.c{dir -30} cutbefore bpath.C cutafter bpath.D;
drawarrow D.c{dir 30} .. E.c{dir -30} cutbefore bpath.D cutafter bpath.E;
drawarrow E.c{dir -150}..D.c{dir 150} cutbefore bpath.E cutafter bpath.D;
drawarrow D.c{dir -150}..C.c{dir 150} cutbefore bpath.D cutafter bpath.C;
drawarrow B.c{dir -150}..A.c{dir 150} cutbefore bpath.B cutafter bpath.A;
drawarrow A.c{dir 135}..(1.6u,0)..A.c{dir 45}
  cutbefore bpath.A cutafter bpath.A;
drawarrow B.c{dir 45}..(3u,.4u)..B.c{dir -45}
  cutbefore bpath.B cutafter bpath.B;
% Valeur des arcs
label.lft(btex \textonehalf etex,    (1.6u,0));
label.top(btex \textonehalf etex,    (2.5u,.15u));
label.bot(btex \textonequarter etex, (2.5u,-.15u));
label.top(btex \textonequarter etex, (3.5u,.15u));
label.top(btex \textonehalf etex,    (3u,.4u));
label.top(btex 1 etex,               (4.5u,.15u));
label.top(btex \textonehalf etex,    (5.5u,.15u));
label.bot(btex \textonehalf etex,    (4.5u,-.15u));
label.bot(btex 1 etex,               (5.5u,-.15u));
endfig;

end
