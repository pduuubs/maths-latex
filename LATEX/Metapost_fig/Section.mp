prologues:=2;
verbatimtex
etex
vardef cube (expr depart,dimarete) = 
                save fig,cube,chemin; 
                pair sommetCube[]; 
                path chemin; 
                picture fig,cube; 
                fig=currentpicture; 
                currentpicture:=nullpicture; 
                sommetCube0=depart; 
                sommetCube1=sommetCube0 shifted (dimarete,0); 
                (sommetCube3-sommetCube0)=(sommetCube1-sommetCube0) scaled .5 rotated 35; 
                (sommetCube2-sommetCube1)=(sommetCube0-sommetCube1) scaled .5 rotated (-145);                
                for i:=0 upto 3 : 
                        sommetCube[i+4]=sommetCube[i] shifted (0,dimarete); 
                endfor 
                draw sommetCube0--sommetCube1--sommetCube2--sommetCube6-- 
                sommetCube5--sommetCube4--cycle; 
                draw sommetCube1--sommetCube5; 
                draw sommetCube0--sommetCube3--sommetCube7 dashed evenly; 
                draw sommetCube2--sommetCube3 dashed evenly; 
                draw sommetCube4--sommetCube7--sommetCube6; 
                cube=currentpicture; 
                currentpicture:=fig; 
                cube 
enddef; 

vardef nommecube = 
                label.llft(btex $A$ etex, sommetCube0); 
                label.lrt(btex $B$ etex, sommetCube1); 
                label.rt(btex $C$ etex, sommetCube2); 
                label.urt(btex $D$ etex, sommetCube3); 
                label.ulft(btex $E$ etex, sommetCube4); 
                label.top(btex $F$ etex, sommetCube5); 
                label.urt(btex $G$ etex, sommetCube6); 
                label.ulft(btex $H$ etex, sommetCube7); 
	      enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%TETRAEDRE
	      pickup pencircle scaled 0.8bp;
	     
	      vardef tetraedreABCD =
		u:=2cm;
		pair A,B,C,D;
		B:=(0,0); D:=(2*u,0); C:=(0.8*u,-0.8*u); A:=(1*u,1.2*u);
		draw A--C--B--A--D--C;
		draw B--D dashed evenly;
		label.top(btex $A$ etex, (1*u,1.2*u)); 
                label.llft(btex $B$ etex, (0,0)); 
                label.bot(btex $C$ etex, (0.8*u,-0.8*u)); 
                label.lrt(btex $D$ etex, (2*u,0)); 
	      enddef;
 %%%%%%%%%%
      beginfig(1); %% Un tétraedre.
	%pair I,J,K,M[];
		%pair A,B,C,D;
		%B:=(0,0); D:=(2*u,0); C:=(0.8*u,-0.8*u); A:=(1*u,1.2*u);
%tetraedre;
tetraedreABCD;
  	%I:=1/4[A,D];
	%J:=1/2[A,C];
	%K:=1/4[B,C];
	%dotlabel.urt(btex $I$ etex,I);
	%dotlabel.lrt(btex $J$ etex,J);
	%dotlabel.bot(btex $K$ etex,K);
      endfig;

   beginfig(2); 
        %Tracé de la section au 3
	pair I,J,K,M[];
		pair A,B,C,D;
		B:=(0,0); D:=(2*u,0); C:=(0.8*u,-0.8*u); A:=(1*u,1.2*u);
%tetraedre;
tetraedreABCD;
  	I:=1/4[A,D];
	J:=1/2[A,C];
	K:=1/3[B,C];
	dotlabel.urt(btex $I$ etex,I);
	dotlabel.lrt(btex $J$ etex,J);
	dotlabel.llft(btex $K$ etex,K);
      endfig;

beginfig(3); %Tracé de la section du 2.
	pair I,J,K,M[];
		pair A,B,C,D;
		B:=(0,0); D:=(2*u,0); C:=(0.8*u,-0.8*u); A:=(1*u,1.2*u);
%tetraedre;
tetraedreABCD;
  	I:=1/4[A,D];
	J:=1/2[A,C];
	K:=1/3[B,C];
	dotlabel.urt(btex $I$ etex,I);
	dotlabel.lrt(btex $J$ etex,J);
	dotlabel.llft(btex $K$ etex,K);
%%%%%%%
%%  DEBUT section  %%
	M1=whatever[I,J]=whatever[C,D];
	M2=whatever[M1,K]=whatever[B,D];

	draw I--J--K withcolor red;
	draw K--M2--I withcolor red dashed evenly;
	
	draw K--M1--J dashed evenly scaled 0.5;
	draw M1--C dashed evenly scaled 0.5;

      endfig;
%%%%%%%%__________________________________________________________________
      
      beginfig(4);	%Tetraedre, tracé de la section au 5
	pair I,J,K,M[];
		pair A,B,C,D;
		B:=(0,0); D:=(2*u,0); C:=(0.8*u,-0.8*u); A:=(1*u,1.2*u);

tetraedreABCD;
  	I:=3/4[A,D];
	J:=1/3[A,C];
	K:=1/3[B,C];
	dotlabel.urt(btex $I$ etex,I);
	dotlabel.ulft(btex $J$ etex,J);
	dotlabel.llft(btex $K$ etex,K);
      endfig;
      %%%%%%%%__________________________________________________________________
      
      beginfig(5);
%Tracé de la section du 4
	pair I,J,K,M[];
		pair A,B,C,D;
		B:=(0,0); D:=(2*u,0); C:=(0.8*u,-0.8*u); A:=(1*u,1.2*u);
%tetraedre;
tetraedreABCD;
  	I:=3/4[A,D];
	J:=1/3[A,C];
	K:=1/3[B,C];
	dotlabel.urt(btex $I$ etex,I);
	dotlabel.ulft(btex $J$ etex,J);
	dotlabel.llft(btex $K$ etex,K);
%%%%%%%
%%  DEBUT section  %%
	M1=whatever[I,J]=whatever[C,D];
	M2=whatever[M1,K]=whatever[B,D];

	draw I--J--K withcolor red;
	draw K--M2--I withcolor red dashed evenly;
	
	draw I--M1--M2 dashed evenly scaled 0.5;
	draw M1--C dashed evenly scaled 0.5;
      endfig;
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 beginfig(6); %Pyramide, section corrigée au 7
      	pair I,J,K,M[];
		pair A,B,C,D,E;
		B:=(0,0); E:=(2.5*u,0); C:=(0.7*u,-0.8*u); A:=(1*u,1.2*u); D:=(1.8*u,-u);

	draw D--A--B--C--D--E--A--C;
	draw B--E dashed evenly;
	label.top(btex $A$ etex, A); 
	label.llft(btex $B$ etex, B); 
	label.bot(btex $C$ etex, C); 
	label.lrt(btex $D$ etex, D);
	label.lrt(btex $E$ etex, E);

	I:=4/10[A,B];
	J:=7/10[A,C];
	K:=4/5[A,E];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.urt(btex $J$ etex,J);
	dotlabel.urt(btex $K$ etex,K);
 endfig;
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      beginfig(7); %% Pyramide avec section du 6
      	pair I,J,K,M[];
		pair A,B,C,D,E;
		B:=(0,0); E:=(2.5*u,0); C:=(0.7*u,-0.8*u); A:=(1*u,1.2*u); D:=(1.8*u,-u);

	draw D--A--B--C--D--E--A--C;
	draw B--E dashed evenly;
	label.top(btex $A$ etex, A); 
	label.llft(btex $B$ etex, B); 
	label.bot(btex $C$ etex, C); 
	label.lrt(btex $D$ etex, D);
	label.lrt(btex $E$ etex, E);
	
  	I:=4/10[A,B];
	J:=7/10[A,C];
	K:=4/5[A,E];
	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.urt(btex $J$ etex,J);
	dotlabel.urt(btex $K$ etex,K);
%%%%%%%
%%  DEBUT section  %%
	M1=whatever[I,J]=whatever[C,B];
	M2=whatever[I,K]=whatever[B,E];
	M3=whatever[M1,M2]=whatever[E,D];
	M4=whatever[M1,M2]=whatever[C,D];

	%draw C--M1--M2--E dashed evenly scaled 0.5;
	draw C--M1--M4 dashed evenly scaled 0.5;
	draw M3--M2--E dashed evenly scaled 0.5;
	draw M1--J dashed evenly scaled 0.5;
	draw M2--K dashed evenly scaled 0.5;
	
	draw I--J--M4 withcolor red;
	draw K--M3 withcolor red;
	draw K--I withcolor red dashed evenly;
	draw M3--M4 withcolor red dashed evenly;
      endfig;

       beginfig(8); %Section corrigée au 9
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,K,D, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2; 
        %pickup pencircle scaled 2bp;
	I=1/4[E,H];
	J=1/2[A,B];
	K=1/4[G,F];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.lrt(btex $K$ etex,K);

      endfig;
      
       beginfig(9); %Solution du 8
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2; 
        %pickup pencircle scaled 2bp;
	I=1/4[E,H];
	J=1/2[A,B];
	K=1/4[G,F];
	%draw I;
	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.lrt(btex $K$ etex,K);
%%%%%% Tracé de la section:
	M1=whatever[I,K]=whatever[E,F];
	%M2=whatever[I,K]=whatever[H,G];
	draw M1--I dashed evenly scaled 0.5;
	draw M1--E dashed evenly scaled 0.5;
	%draw M2--G dashed evenly scaled 0.5;
	M3=whatever[M1,J]=whatever[E,A];
	draw M1--M3 dashed evenly scaled 0.5;
	M4=whatever[M3,J]=whatever[B,F];
	M5=whatever[M4,K]=whatever[B,C];
	draw J--M4--B dashed evenly scaled 0.5;
	draw M4--M5 dashed evenly scaled 0.5;
	%polygone de section en rouge
	draw J--M3 withcolor red;
	draw I--K--M5 withcolor red;
	draw M3--I withcolor red dashed evenly;
	draw M5--J withcolor red dashed evenly;
      endfig;

beginfig(10); %Section corrigée au 11
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=2/3[E,H];
	J=1/2[A,B];
	K=3/4[G,F];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.top(btex $K$ etex,K);
      endfig;
      
       beginfig(11); %Solution du 10
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=2/3[E,H];
	J=1/2[A,B];
	K=3/4[G,F];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.top(btex $K$ etex,K);
%%%%%% Tracé de la section:
	M1=whatever[I,K]=whatever[E,F];
	%M2=whatever[I,K]=whatever[H,G];
	draw M1--K dashed evenly scaled 0.5;
	draw M1--F dashed evenly scaled 0.5;
	%draw M2--G dashed evenly scaled 0.5;
	M3=whatever[M1,J]=whatever[F,B];
	draw M1--M3 dashed evenly scaled 0.5;
	M4=whatever[M3,J]=whatever[E,A];
	M5=whatever[M4,I]=whatever[A,D];
	draw J--M4 dashed evenly scaled 0.5;
	draw M4--M5 dashed evenly scaled 0.5;
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--K--M3--J withcolor red;
	draw J--M5--I withcolor red dashed evenly;
	%draw M5--J withcolor red dashed evenly;
%pour repérer les points de construction:
	
%for i:=3 upto 5:
	 % dotlabel(btex $X$ etex,M[i]);
	  %endfor;
      endfig;
      beginfig(12); %solution au 13
	 picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=2/3[E,H];
	J=1/2[A,B];
	K=2/3[B,C];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.bot(btex $K$ etex,K);
	endfig;
       beginfig(13); %Solution du 12
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=2/3[E,H];
	J=1/2[A,B];
	K=2/3[B,C];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.bot(btex $K$ etex,K);
%%%%%% Tracé de la section:
	M1=whatever[J,K]=whatever[D,C];
	M2=whatever[J,K]=whatever[A,D];
	M3=whatever[M2,I]=whatever[A,E];

	draw K--M1--C dashed evenly scaled 0.5;
	draw A--M2--J dashed evenly scaled 0.5;
	draw M2--M3 dashed evenly scaled 0.5;
	
	M4=whatever[M3,I]=whatever[H,D];
	draw I--M4--H dashed evenly scaled 0.5;
		
	M5=whatever[M4,M1]=whatever[H,G];
	M6=whatever[M4,M1]=whatever[C,G];
	draw M4--M5 dashed evenly scaled 0.5;
	draw M1--M6 dashed evenly scaled 0.5;
	
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--M3--J withcolor red;
	draw I--M5 withcolor red;
	draw K--M6 withcolor red;
	draw J--K withcolor red dashed evenly;
	draw J--M3 withcolor red dashed evenly;
	
	draw M5--M6 withcolor red dashed evenly;
%pour repérer les points de construction:
	
%for i:=3 upto 5:
	 % dotlabel(btex $X$ etex,M[i]);
	  %endfor;
      endfig;
beginfig(14); %%corrigé au 15
picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=2/7[E,F];  %1/4
	J=5/7[A,B]; %mettre 5/7 pour le suivant
	K=1/3[B,C];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.bot(btex $K$ etex,K);
   endfig;
      beginfig(15); %Solution du 14
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=2/7[E,F];  %1/4
	J=5/7[A,B]; %mettre 5/7 pour le suivant
	K=1/3[B,C];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.bot(btex $K$ etex,K);
%%%%%% Tracé de la section:
	M1=whatever[J,I]=whatever[B,F];
	M2=whatever[M1,K]=whatever[F,G];
	%M3=whatever[J,I]=whatever[B,F];
%
	draw B--M1 dashed evenly scaled 0.5;
	draw K--M1--J dashed evenly scaled 0.5;
	%draw M2--M3 dashed evenly scaled 0.5;
	
	%M4=whatever[M3,I]=whatever[H,D];
	%draw I--M4--H dashed evenly scaled 0.5;
		
	%M5=whatever[M4,M1]=whatever[H,G];
	%M6=whatever[M4,M1]=whatever[C,G];
	%draw M4--M5 dashed evenly scaled 0.5;
	%draw M1--M6 dashed evenly scaled 0.5;
	
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--J withcolor red;
	draw I--M2 withcolor red;
	draw K--M2 withcolor red;
	draw J--K withcolor red dashed evenly;
	%draw J--M3 withcolor red dashed evenly;
	
	%draw M5--M6 withcolor red dashed evenly;
%pour repérer les points de construction:
	
%for i:=3 upto 5:
	 % dotlabel(btex $X$ etex,M[i]);
	  %endfor;
      endfig;
 beginfig(16); %Solution au 17
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=1/4[E,F];  %1/4
	J=5/7[A,B]; 
	K=2/3[B,C];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.bot(btex $K$ etex,K);
      endfig;
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       beginfig(17); %Solution du 16
        picture lecube; 
        pair A,B,H,F,C,I,E,G,J,D,K, M[]; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	G:=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	D:=sommetCube3;
        %pickup pencircle scaled 2bp;
	I=1/4[E,F];  %1/4
	J=5/7[A,B]; 
	K=2/3[B,C];

	dotlabel.ulft(btex $I$ etex,I);
	dotlabel.bot(btex $J$ etex,J);
	dotlabel.bot(btex $K$ etex,K);
%%%%%% Tracé de la section:
	M1=whatever[J,I]=whatever[B,F];
	M2=whatever[M1,K]=whatever[F,G];
	M3=whatever[M1,K]=whatever[C,G];
	M4=whatever[M2,I]=whatever[H,G];
	draw B--M1 dashed evenly scaled 0.5;
	draw K--M1--J dashed evenly scaled 0.5;
	draw B--M1 dashed evenly scaled 0.5;
	draw M2--M3 dashed evenly scaled 0.5;
	draw G--M2 dashed evenly scaled 0.5;
	draw M2--M4 dashed evenly scaled 0.5;
	%
	%draw I--M4--H dashed evenly scaled 0.5;
		
	%M5=whatever[M4,M1]=whatever[H,G];
	%M6=whatever[M4,M1]=whatever[C,G];
	%draw M4--M5 dashed evenly scaled 0.5;
	%draw M1--M6 dashed evenl scaled 0.5;
	
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--J withcolor red;
	draw I--M4 withcolor red;
	draw K--M3 withcolor red;
	draw J--K withcolor red dashed evenly;
	draw M4--M3 withcolor red dashed evenly;
	
	%draw M5--M6 withcolor red dashed evenly;
%pour repérer les points de construction:
	
%for i:=3 upto 5:
	 % dotlabel(btex $X$ etex,M[i]);
	  %endfor;
      endfig;
      beginfig(18); %Simple pyramide à base quadrilatère qq.
%Demander l'intersection de (ABC)et (ADE)
	u:=2cm;
      	pair A,B,C,D,E;
		B:=(0,0); E:=(2.5*u,0); C:=(0.7*u,-0.8*u); A:=(1*u,1.2*u); D:=(1.8*u,-u);

	draw D--A--B--C--D--E--A--C;
	draw B--E dashed evenly;
	label.top(btex $A$ etex, A); 
	label.llft(btex $B$ etex, B); 
	label.bot(btex $C$ etex, C); 
	label.lrt(btex $D$ etex, D);
	label.lrt(btex $E$ etex, E);
      endfig;
       beginfig(19); %Simple pyramide à base quadrilatère qq.
         %Demander l'intersection de (ABC)et (ADE)
	u:=2cm;
      	pair A,B,C,D,E,M[];
		B:=(0,0); E:=(2.5*u,0); C:=(0.7*u,-0.8*u); A:=(1*u,1.2*u); D:=(1.8*u,-u);

	draw D--A--B--C--D--E--A--C;
	draw B--E dashed evenly;
	label.top(btex $A$ etex, A); 
	label.llft(btex $B$ etex, B); 
	label.bot(btex $C$ etex, C); 
	label.lrt(btex $D$ etex, D);
	label.lrt(btex $E$ etex, E);

	%% DEBUT intersection %%
	M1=whatever[B,C]=whatever[D,E];
	
	draw C--M1--D dashed evenly scaled 0.5;
		
	draw A--M1 withcolor red;
	
      endfig;

      beginfig(20); %% Pyramide avec section au 21
      	pair I,J,K,M[];
		pair A,B,C,D,E;
		B:=(0,0); E:=(2.5*u,0); C:=(0.7*u,-0.8*u); A:=(1*u,1.2*u); D:=(1.8*u,-u);

	draw D--A--B--C--D--E--A--C;
	draw B--E dashed evenly;
	label.top(btex $A$ etex, A); 
	label.llft(btex $B$ etex, B); 
	label.bot(btex $C$ etex, C); 
	label.lrt(btex $D$ etex, D);
	label.lrt(btex $E$ etex, E);
	
  	I:=3/10[A,B];
	J:=7/10[A,C];
	K:=7/10[A,E];
	dotlabel.ulft(btex $I$ etex,I);
	%dotlabel.urt(btex $J$ etex,J);
	dotlabel.urt(btex $K$ etex,K);
%%%%%%%
%%  DEBUT section  %%
	M1=whatever[I,J]=whatever[C,B];
	M2=whatever[I,K]=whatever[B,E];
	M3=whatever[M1,M2]=whatever[E,D];
	M4=whatever[M1,M2]=whatever[C,D];


	dotlabel.bot(btex $J$ etex,M4);
      endfig;


beginfig(21); %% Pyramide avec section du 20
      	pair I,J,K,M[];
		pair A,B,C,D,E;
		B:=(0,0); E:=(2.5*u,0); C:=(0.7*u,-0.8*u); A:=(1*u,1.2*u); D:=(1.8*u,-u);

	draw D--A--B--C--D--E--A--C;
	draw B--E dashed evenly;
	label.top(btex $A$ etex, A); 
	label.llft(btex $B$ etex, B); 
	label.bot(btex $C$ etex, C); 
	label.lrt(btex $D$ etex, D);
	label.lrt(btex $E$ etex, E);
	
  	I:=3/10[A,B];
	J:=7/10[A,C];
	K:=7/10[A,E];
	dotlabel.ulft(btex $I$ etex,I);
	%dotlabel.urt(btex $J$ etex,J);
	dotlabel.urt(btex $K$ etex,K);
%%%%%%%
%%  DEBUT section  %%
	M1=whatever[I,J]=whatever[C,B];
	M2=whatever[I,K]=whatever[B,E];
	M3=whatever[M1,M2]=whatever[E,D];
	M4=whatever[M1,M2]=whatever[C,D];

	%draw C--M1--M2--E dashed evenly scaled 0.5;
	draw C--M1--M4 dashed evenly scaled 0.5;
	draw M3--M2--E dashed evenly scaled 0.5;
	draw M1--J dashed evenly scaled 0.5;
	draw M2--K dashed evenly scaled 0.5;
	
	draw I--J--M4 withcolor red;
	draw K--M3 withcolor red;
	draw K--I withcolor red dashed evenly;
	draw M3--M4 withcolor red dashed evenly;
	dotlabel.bot(btex $J$ etex,M4);
      endfig;

end 

