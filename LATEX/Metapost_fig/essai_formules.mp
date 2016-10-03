verbatimtex 
%&latex 
\documentclass[a4paper,10pt]{article}
\usepackage[dvips]{epsfig}
\usepackage{amsmath}
\pagestyle{empty}
\begin{document} 
etex 
beginfig(1);
  u:=1cm;
  z0=(0,0); z1=(1,1)*u; z2=(-1,2)*u; 

pickup pencircle scaled 0.5;
draw z0..z1..z2;

endfig;
end 
 