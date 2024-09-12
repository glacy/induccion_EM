import graph3;
import three;
import math;

pen vpen=linewidth(0.45mm);
pen p=linewidth(0.2mm);
pen c1=rgb(0,39,87);
pen c2=rgb(255,64,0);
pen e=linewidth(0.1mm)+gray+opacity(1);

size(200);

triple O = (0,0,0);
triple iv = (1,0,0);
triple jv = (0,1,0);
triple kv = (0,0,1);

triple v = .5*iv;
triple B = .5*jv;

currentprojection=orthographic(0,-1,0,up=Z);
currentlight=light((1,0,1),(-1.5,0,-1));
currentlight.background=white;

int aS=1;
draw(Label("$x$",EndPoint),-aS*X--1.25*aS*X,p+gray,Arrow3);
draw(Label("$y$",EndPoint),-aS*Y--aS*Y,p+gray,Arrow3);
draw(Label("$z$",EndPoint),-aS*Z--aS*Z,p+gray,Arrow3);

for (int i=-2*aS; i < 2*aS+1; ++i){
  for (int j=-aS; j < aS+1; ++j){
 	draw("",shift(i/3,0,j/3)*(O--B),p+c2,Arrow3); 
 //dot((i/3,0,j/3)) ;
    draw(shift(i/3,0,j/3)*rotate(90,X)*scale(0.05, 0.05, 1)*unitdisk, surfacepen=material(c2+opacity(.1), shininess=0.3));
  	label(scale(1, 1, 1)*rotate(90,X)*"$\times$",(i/3,0,j/3),c2,Embedded);
  }
}

for (int i=-2*aS; i < 2*aS+1; ++i){
  for (int j=-aS; j < aS+1; ++j){
 draw("",shift(i/3,1,j/3)*(O--B),p+c2,Arrow3); 
 //dot((i/3,1,j/3));
    draw(shift(i/3,1,j/3)*rotate(90,X)*scale(0.05, 0.05, 1)*unitdisk, surfacepen=material(c2+opacity(.1), shininess=0.3));
    label(scale(1, 1, 1)*rotate(90,X)*"$\times$",(i/3,1,j/3),c2,Embedded);
  }
}

for (int i=-2*aS; i < 2*aS+1; ++i){
  for (int j=-aS; j < aS+1; ++j){
 draw("",shift(i/3,-1,j/3)*(O--B),p+c2,Arrow3); 
 draw(shift(i/3,-1,j/3)*rotate(90,X)*scale(0.05, 0.05, 1)*unitdisk, surfacepen=material(c2+opacity(.5), shininess=0.3));
    label(scale(1, 1, 1)*rotate(90,X)*"$\times$",(i/3,-1,j/3),c2,Embedded);
  }
}

draw("$\vec{\mathbf{v}}$",shift(.5,0,0)*(O--v),vpen+c1,Arrow3);
draw("$\vec{\mathbf{B}}$",(-aS/2.,aS/2.,aS/2),2NW,p+c2,Arrow3);

triple[] z=new triple[10];

z[0]=(0,0,0); z[1]=(1,0,0); z[2]=(1,0,.5);

z[3]=(0,0,.5);

path3 p=z[0]--z[1]---z[2]--z[3]--z[0];

draw(shift(-.5,0,-.25)*p,grey+linewidth(1mm),currentlight);