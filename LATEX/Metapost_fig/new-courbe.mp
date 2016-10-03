prologues:=2;
verbatimtex
etex
input constantes;
input papiers;
beginfig(1);
  papiermillimetre((0,0),1,1,(-1,-1),(3,2),noir);
 % papiermilli((0,0),1,1,(-2,-5),(5,5)) orange;
endfig;
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
papiermillimetre((0,0),1,1,(-1,-1),(3,2),noir);

%  color macouleur;
%macouleur = .8*orange;
  papiercinq((0,0),(4,3),orange);
  papierpointe((0,0),(4,3),orange);
papierun((0,0),(4,3),orange);
papiercahier((0,0),(4,3), macouleur); % macouleur = .7[red,blue];
papiertriangle((0,0),(4,3),);
papierisompointe((0,0),(4,3),);
papierisom((0,0),(4,3),);
papierhexa((0,0),(4,3),);

end
