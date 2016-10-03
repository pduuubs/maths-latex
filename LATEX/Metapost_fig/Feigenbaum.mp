prologues:=2;
verbatimtex
etex

 %%%%%%%%%%%%%%%%%%%%%%%%%%

% beginfig(1)

%   numeric rmin, rmax, r, dr, n, ux, uy;
% rmin := 2.9; rmax := 3.9;
% r := rmin; n := 300; %175
% dr := (rmax - rmin)/n;
% ux := 8cm; uy := 8cm;
% for i = 1 upto (n/2):
%   x := 0.5; % our starting point
%   for j=1 upto 90: % initial iterations
%     x := r*x*(1-x);
%   endfor
%     for j=1 upto 20: % the next 20 iterations
%         x := r*x*(1-x);
%         draw (r*ux,x*uy) withpen pencircle scaled .3pt;
%     endfor
%     r := r+dr;
%   endfor;
  
%   for i = ((n/2) +1) upto n:
%   x := 0.5; % our starting point
%   for j=1 upto 80: % initial iterations
%     x := r*x*(1-x);
%   endfor
%     for j=1 upto 300: % the next 300 iterations
%         x := r*x*(1-x);
%         draw (r*ux,x*uy) withpen pencircle scaled .2pt;
%     endfor
%     r := r+dr;
% endfor;
% % draw axes and labels
% draw (rmin*ux,0) -- (rmax*ux,0);
% draw (rmin*ux,0) -- (rmin*ux,uy);
% labeloffset := 0.25cm;
% label.bot(decimal(rmin), (rmin*ux,0));
% label.bot(decimal((rmin+rmax)/2), ((rmin+rmax)/2*ux,0));
% label.bot(decimal(rmax), (rmax*ux,0));
% label.lft(decimal(0), (rmin*ux,0));
% label.lft(decimal(0.5), (rmin*ux,0.5*uy));
% label.lft(decimal(1), (rmin*ux,uy));
% label.bot(btex $r$ etex, ((rmax-0.2)*ux,0));
% label.lft(btex orbit etex rotated 90, (rmin*ux,0.75*uy));

  
% endfig;

% beginfig(2)

%   numeric rmin, rmax, r, dr, n, ux, uy;
% rmin := 3.5; rmax := 3.95;
% r := rmin; n := 200; %175
% dr := (rmax - rmin)/n;
% ux := 8cm; uy := 8cm;
% for i = 1 upto n:
%   x := 0.5; % our starting point
%   for j=1 upto 50: % initial iterations
%     x := r*x*(1-x);
%   endfor
%     for j=1 upto 250: % the next 300 iterations
%         x := r*x*(1-x);
%         draw (r*ux,x*uy) withpen pencircle scaled .3pt;
%     endfor
%     r := r+dr;
%   endfor;
  

% % draw axes and labels
% draw (rmin*ux,0) -- (rmax*ux,0);
% draw (rmin*ux,0) -- (rmin*ux,uy);
% labeloffset := 0.25cm;
% label.bot(decimal(rmin), (rmin*ux,0));
% label.bot(decimal((rmin+rmax)/2), ((rmin+rmax)/2*ux,0));
% label.bot(decimal(rmax), (rmax*ux,0));
% label.lft(decimal(0), (rmin*ux,0));
% label.lft(decimal(0.5), (rmin*ux,0.5*uy));
% label.lft(decimal(1), (rmin*ux,uy));
% label.bot(btex $r$ etex, ((rmax-0.2)*ux,0));
% label.lft(btex orbit etex rotated 90, (rmin*ux,0.75*uy));

  
% endfig;

% beginfig(3)

%   numeric rmin, rmax, r, dr, n, ux, uy;
% rmin := 3.8; rmax := 3.99;
% r := rmin; n := 180; %175
% dr := (rmax - rmin)/n;
% ux := 8cm; uy := 8cm;
% for i = 1 upto n:
%   x := 0.5; % our starting point
%   for j=1 upto 50: % initial iterations
%     x := r*x*(1-x);
%   endfor
%     for j=1 upto 300: % the next 300 iterations
%         x := r*x*(1-x);
%         draw (r*ux,x*uy) withpen pencircle scaled .2pt;
%     endfor
%     r := r+dr;
%   endfor;
  

% % draw axes and labels
% draw (rmin*ux,0) -- (rmax*ux,0);
% draw (rmin*ux,0) -- (rmin*ux,uy);
% labeloffset := 0.25cm;
% label.bot(decimal(rmin), (rmin*ux,0));
% %label.bot(decimal((rmin+rmax)/2), ((rmin+rmax)/2*ux,0));
% label.bot(decimal(rmax), (rmax*ux,0));
% label.lft(decimal(0), (rmin*ux,0));
% label.lft(decimal(0.5), (rmin*ux,0.5*uy));
% label.lft(decimal(1), (rmin*ux,uy));
% label.bot(btex $r$ etex, ((rmax-0.2)*ux,0));
% label.lft(btex orbit etex rotated 90, (rmin*ux,0.75*uy));

  
% endfig;

beginfig(4)

  numeric rmin, rmax, r, dr, n, ux, uy;
rmin :=0; rmax := 3.585;
r := rmin; n := 1000; %175
dr := (rmax - rmin)/n;
ux := 8cm; uy := 8cm;
for i = 1 upto 950:
  x := 0.5; % our starting point
  for j=1 upto 50: % initial iterations
    x := r*x*(1-x);
  endfor
    for j=1 upto 20: % the next 100 iterations
        x := r*x*(1-x);
        draw (r*ux,x*uy) withpen pencircle scaled .5pt;
    endfor
    r := r+dr;
  endfor;
  for i = 951 upto n:
  x := 0.5; % our starting point
  for j=1 upto 50: % initial iterations
    x := r*x*(1-x);
  endfor
    for j=1 upto 200: % the next 100 iterations
        x := r*x*(1-x);
        draw (r*ux,x*uy) withpen pencircle scaled .3pt;
    endfor
    r := r+dr;
  endfor;
  

% draw axes and labels
draw (rmin*ux,0) -- (rmax*ux,0);
draw (rmin*ux,0) -- (rmin*ux,uy);
labeloffset := 0.25cm;
label.bot(decimal(rmin), (rmin*ux,0));
label.bot(decimal((rmin+rmax)/2), ((rmin+rmax)/2*ux,0));
label.bot(decimal(rmax), (rmax*ux,0));
label.lft(decimal(0), (rmin*ux,0));
label.lft(decimal(0.5), (rmin*ux,0.5*uy));
label.lft(decimal(1), (rmin*ux,uy));
label.bot(btex $r$ etex, ((rmax-0.2)*ux,0));
label.lft(btex orbit etex rotated 90, (rmin*ux,0.75*uy));

  
endfig;

 end
