#WBL 27 Oct 2021 $Revision: 1.11 $
#Can we make splot/movie/ of triangle program input and output space
#show location of entropy loss regions
#relationship with seeded mutations

#Modifications:
#WBL 28 Oct 2021 tidy and send to David via teams

set title "Triangle Program, 8120601 possible inputs, Entropy in=22.95 Entropy out=0.357"

#using copy of ~/sebase/re_gp/triangle2/triangle.c
#return 4 not a triangle
#return 3 equilateral
#return 2 isosceles
#return 3 scalene

#equilateral output=3 100
#isosceles output=2 
#gawk 'END{print 3*(50*49+50*99) }' /dev/null
#22200

#./a.out | grep -v ' 4$' > triangle.out
#./a.out | gawk '{c[$4]++}END{for(i in c)print i,c[i]}'
#4 7605851
#1 492450
#2 22200
#3 100

#100 = number 1 to 100
#22200 = 3 * [(sum for i=1 to 50 of 2*(i-2)) + (99 * number 51 to 100)]
#for scalene third number (call it z) cannot exceed x+y AND it cannot
#be less than |x-y|
#Then subtract off those triples that are either equilateral or isosceles
#continuous approximation for isosceles:
#Each plane is a triangle of sides 101, 101*sqrt(2) and 101*sqrt(3). 
#However to cope with fact that int points are exactly on edges
#increase to 103, 103*sqrt(2) and 103*sqrt(3). 
#Hero's formula gives
#gawk 'END{l=103;a=l;b=l*sqrt(2);c=l*sqrt(3); s=(a+b+c)/2;print a,b,c,a=sqrt(s*(s-a)*(s-b)*(s-c))}' /dev/null
#103 145.664 178.401 7501.7


#http://www.gnuplot.info/docs_4.2/node212.html
set parametric
set trange [-100:100]
set urange [-100:100]
set vrange [-100:100]

set xlabel "side1"
set ylabel "side2"
set zlabel "side3"

equilateral(z) = (z>0)? z : 0/0;

isosceles(x,y) = (x>0 && y>0 && (x+y)<2*x)? x : 0/0;

#select scalene and reduce data volume
#!gawk '(($1%5)==0 &&($2%5)==0 &&($3%5)==0 && $4==1)' triangle.out > /tmp/triangle.scalene

set key left \
title    "not plotted return 4, 7605851"


set view 50,20

set ticslevel 0

#https://stackoverflow.com/questions/24909408/how-can-i-draw-a-plane-in-gnuplot-when-it-is-parallel-to-one-of-the-coordinate

splot \
"triangle.scalene" title        "Scalene return 1,     492450" w d lc 6,\
u,isosceles(u,v),v title "side1 == side2 return 2,       7400" w l lc 2,\
isosceles(v,u),u,v title "side1 == side3 return 2,       7400" w l lc 3,\
u,v,isosceles(v,u) title "side2 == side3 return 2,       7400" w l lc 4,\
u,u,equilateral(u) title    "equilateral return 3,        100" w linespoint lc 1

pause -1
quit
