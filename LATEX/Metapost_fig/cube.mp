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
beginfig(1); %avec un t�traedre
        picture lecube; 
        pair A,H,F,C,E; 
        lecube=cube(origin,5cm); 
        draw lecube; 
        nommecube; 
        A=sommetCube0;
	E=sommetCube4; 
        H=sommetCube7; 
        F=sommetCube5; 
        C=sommetCube2; 
        pickup pencircle scaled 0.8bp; 
        draw A--F--C; 
        draw H--F; 
        draw A--H--C--cycle dashed evenly;
	
      endfig;

   beginfig(2); 
        picture lecube; 
        pair A,B,H,F,C,I,E,G; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	 G=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2; 
        pickup pencircle scaled 2bp;
	%I=1/3[H,E];
	%draw I;
	dotlabel.ulft(btex $I$ etex,1/3[E,H]);
	dotlabel.bot(btex $J$ etex,1/3[A,B]);
	dotlabel.bot(btex $K$ etex,1/3[G,F]);
	       % draw A--F--C; 
       % draw H--F; 
       % draw A--H--C--cycle dashed evenly; 
      endfig;

       beginfig(3); %%Un t�traedre seul
        picture lecube; 
        pair A,B,H,F,C,I,E,G; 
        lecube:=cube(origin,4cm);
	pickup pencircle scaled 0.8bp;
       
      
	       %  label.llft("A", sommetCube0); 
%                 label.rt("C", sommetCube2); 
                
                
%                 label.urt("F", sommetCube5); 
                
%                 label.ulft("H", sommetCube7);
		label.llft(btex $A$ etex, sommetCube0); 
                
                label.rt(btex $C$ etex, sommetCube2); 
                
                
                label.top(btex $F$ etex, sommetCube5); 
                
                label.ulft(btex $H$ etex, sommetCube7); 
    
		 

	
        A:=sommetCube0;
	%B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	%G=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;

draw A--F--H--cycle;
		draw A--C--F--cycle; 
       %draw H--F; 
       draw H--C dashed evenly;
	
        pickup pencircle scaled 2bp;
	%I=1/3[H,E];
	%draw I;
	dotlabel.ulft(btex $I$ etex,2/5[A,H]);
	dotlabel.bot(btex $J$ etex,2/5[F,A]);
	dotlabel.top(btex $K$ etex,1/3[H,C]);
      endfig;
%%%%%%%%__________________________________________________________________
      
      beginfig(4); %%Un t�traedre seul
	u=6cm;
        picture lecube; 
        pair A,B,H,F,C,I,E,G; 
        lecube:=cube(origin,u);
	pickup pencircle scaled 0.8bp;
       	        % label.llft("A", sommetCube0); 
%                 label.rt("C", sommetCube2); 
                       
%                 label.urt("F", sommetCube5); 
                
%                 label.ulft("H", sommetCube7);
		label.llft(btex $A$ etex, sommetCube0); 
                
                label.rt(btex $C$ etex, sommetCube2); 
                
                
                label.top(btex $F$ etex, sommetCube5); 
                
                label.ulft(btex $H$ etex, sommetCube7); 
    
	
        A:=sommetCube0;
	%B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	%G=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	

draw A--F--H--cycle;
		draw A--C--F--cycle; 
       %draw H--F; 
       draw H--C dashed evenly;
	
        pickup pencircle scaled 2bp;


	
	dotlabel.ulft(btex $I$ etex,H shifted (0.1*u,-0.5*u));
	dotlabel.ulft(btex $J$ etex,H shifted (0.45*u,-0.35*u));
	dotlabel.top(btex $K$ etex,H shifted (0.2*u,-1.1*u));
	%dotlabel.bot(btex $J$ etex,2/5[H,F]-C/4 );
	%dotlabel.top(btex $K$ etex,1/3[H,C]);
      endfig;
      %%%%%%%%__________________________________________________________________
      
      beginfig(5); %%Un t�traedre seul
	u:=6cm;
        picture lecube; 
        pair A,B,H,F,C,I,E,G; 
        lecube:=cube(origin,u);
	pickup pencircle scaled 0.8bp;

		label.llft(btex $A$ etex, sommetCube0); 
                
                label.rt(btex $C$ etex, sommetCube2); 
                
                
                label.top(btex $F$ etex, sommetCube5); 
                
                label.ulft(btex $H$ etex, sommetCube7); 
       	        
	
        A:=sommetCube0;
	%B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	%G=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2;
	

draw A--F--H--cycle;
		draw A--C--F--cycle; 
       %draw H--F; 
       draw H--C dashed evenly;
	
        pickup pencircle scaled 2bp;


	
	dotlabel.ulft(btex $I$ etex,H shifted (0.1*u,-0.5*u));
	dotlabel.ulft(btex $J$ etex,H shifted (0.05*u,-0.15*u));
	dotlabel.top(btex $K$ etex,H shifted (0.35*u,-0.7*u));
	%dotlabel.bot(btex $J$ etex,2/5[H,F]-C/4 );
	%dotlabel.top(btex $K$ etex,1/3[H,C]);
      endfig;
      
      beginfig(6); % Un cube simple
        picture lecube; 
        pair A,B,H,F,C,D,I,E,G; 
pickup pencircle scaled 0.8bp;
	lecube:=cube(origin,4cm);
	
        draw lecube; 
        nommecube;
	
        A:=sommetCube0;
	B=sommetCube1;
	E:=sommetCube4; 
        H:=sommetCube7;
	 G=sommetCube6; 
        F:=sommetCube5; 
        C:=sommetCube2; 
      endfig;
      
      beginfig(7); %Tourn�
        picture zecube;
        
	%nommecube; 
        zecube=cube(origin,5cm)  slanted -0.2 rotated 15; 
        draw zecube; 
      endfig;

       beginfig(8); %Section corrig�e au 9
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
	%draw I;
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
%%%%%% Trac� de la section:
	M1=whatever[I,K]=whatever[E,F];
	%M2=whatever[I,K]=whatever[H,G];
	draw M1--I dashed withdots scaled 0.5;
	draw M1--E dashed withdots scaled 0.5;
	%draw M2--G dashed withdots scaled 0.5;
	M3=whatever[M1,J]=whatever[E,A];
	draw M1--M3 dashed withdots scaled 0.5;
	M4=whatever[M3,J]=whatever[B,F];
	M5=whatever[M4,K]=whatever[B,C];
	draw J--M4--B dashed withdots scaled 0.5;
	draw M4--M5 dashed withdots scaled 0.5;
	%polygone de section en rouge
	draw J--M3 withcolor red;
	draw I--K--M5 withcolor red;
	draw M3--I withcolor red dashed evenly;
	draw M5--J withcolor red dashed evenly;
      endfig;

beginfig(10); %Section corrig�e au 11
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
%%%%%% Trac� de la section:
	M1=whatever[I,K]=whatever[E,F];
	%M2=whatever[I,K]=whatever[H,G];
	draw M1--K dashed withdots scaled 0.5;
	draw M1--F dashed withdots scaled 0.5;
	%draw M2--G dashed withdots scaled 0.5;
	M3=whatever[M1,J]=whatever[F,B];
	draw M1--M3 dashed withdots scaled 0.5;
	M4=whatever[M3,J]=whatever[E,A];
	M5=whatever[M4,I]=whatever[A,D];
	draw J--M4 dashed withdots scaled 0.5;
	draw M4--M5 dashed withdots scaled 0.5;
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--K--M3--J withcolor red;
	draw J--M5--I withcolor red dashed evenly;
	%draw M5--J withcolor red dashed evenly;
%pour rep�rer les points de construction:
	
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
%%%%%% Trac� de la section:
	M1=whatever[J,K]=whatever[D,C];
	M2=whatever[J,K]=whatever[A,D];
	M3=whatever[M2,I]=whatever[A,E];

	draw K--M1--C dashed withdots scaled 0.5;
	draw A--M2--J dashed withdots scaled 0.5;
	draw M2--M3 dashed withdots scaled 0.5;
	
	M4=whatever[M3,I]=whatever[H,D];
	draw I--M4--H dashed withdots scaled 0.5;
		
	M5=whatever[M4,M1]=whatever[H,G];
	M6=whatever[M4,M1]=whatever[C,G];
	draw M4--M5 dashed withdots scaled 0.5;
	draw M1--M6 dashed withdots scaled 0.5;
	
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--M3--J withcolor red;
	draw I--M5 withcolor red;
	draw K--M6 withcolor red;
	draw J--K withcolor red dashed evenly;
	draw J--M3 withcolor red dashed evenly;
	
	draw M5--M6 withcolor red dashed evenly;
%pour rep�rer les points de construction:
	
%for i:=3 upto 5:
	 % dotlabel(btex $X$ etex,M[i]);
	  %endfor;
      endfig;
beginfig(14); %%corrig� au 15
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
%%%%%% Trac� de la section:
	M1=whatever[J,I]=whatever[B,F];
	M2=whatever[M1,K]=whatever[F,G];
	%M3=whatever[J,I]=whatever[B,F];
%
	draw B--M1 dashed withdots scaled 0.5;
	draw K--M1--J dashed withdots scaled 0.5;
	%draw M2--M3 dashed withdots scaled 0.5;
	
	%M4=whatever[M3,I]=whatever[H,D];
	%draw I--M4--H dashed withdots scaled 0.5;
		
	%M5=whatever[M4,M1]=whatever[H,G];
	%M6=whatever[M4,M1]=whatever[C,G];
	%draw M4--M5 dashed withdots scaled 0.5;
	%draw M1--M6 dashed withdots scaled 0.5;
	
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--J withcolor red;
	draw I--M2 withcolor red;
	draw K--M2 withcolor red;
	draw J--K withcolor red dashed evenly;
	%draw J--M3 withcolor red dashed evenly;
	
	%draw M5--M6 withcolor red dashed evenly;
%pour rep�rer les points de construction:
	
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
%%%%%% Trac� de la section:
	M1=whatever[J,I]=whatever[B,F];
	M2=whatever[M1,K]=whatever[F,G];
	M3=whatever[M1,K]=whatever[C,G];
	M4=whatever[M2,I]=whatever[H,G];
	draw B--M1 dashed withdots scaled 0.5;
	draw K--M1--J dashed withdots scaled 0.5;
	draw B--M1 dashed withdots scaled 0.5;
	draw M2--M3 dashed withdots scaled 0.5;
	draw G--M2 dashed withdots scaled 0.5;
	draw M2--M4 dashed withdots scaled 0.5;
	%
	%draw I--M4--H dashed withdots scaled 0.5;
		
	%M5=whatever[M4,M1]=whatever[H,G];
	%M6=whatever[M4,M1]=whatever[C,G];
	%draw M4--M5 dashed withdots scaled 0.5;
	%draw M1--M6 dashed withdots scaled 0.5;
	
	%polygone de section en rouge
	%draw J--M3 withcolor red;
	draw I--J withcolor red;
	draw I--M4 withcolor red;
	draw K--M3 withcolor red;
	draw J--K withcolor red dashed evenly;
	draw M4--M3 withcolor red dashed evenly;
	
	%draw M5--M6 withcolor red dashed evenly;
%pour rep�rer les points de construction:
	
%for i:=3 upto 5:
	 % dotlabel(btex $X$ etex,M[i]);
	  %endfor;
      endfig;
      
end 

