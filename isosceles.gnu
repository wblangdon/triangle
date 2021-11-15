#WBL 27 Oct 2021 $Revision: 1.2 $
#Can we make splot/movie/ of triangle program input and output space
#show location of entropy loss regions
#relationship with seeded mutations

set title "Triangle Program"

#http://www.gnuplot.info/docs_4.2/node212.html
set parametric
set trange [-100:100]
set urange [-100:100]
set vrange [-100:100]

set xlabel "side1"
set ylabel "side2"
set zlabel "side3"


#return 4 not a triangle, not coloured
#return 3 equilateral, red
#return 2 isosceles, blue
#return 3 scalene, green


equilateral3(z) = (z>0)? z : 0/0;
#isosceles1(x,y) = (x==y)? x : 0/0;

#similar(x,y)     = abs(x-y)<3;
#isosceles1(x,y) = similar(x,y)? x : 0/0;
isosceles(x) = (x>0)? x : 0/0;



set ticslevel 0

#https://stackoverflow.com/questions/24909408/how-can-i-draw-a-plane-in-gnuplot-when-it-is-parallel-to-one-of-the-coordinate

splot \
u,isosceles(u),v title "side1 == side2" w l lc 2,\
isosceles(v),u,v title "side1 == side3" w l lc 3,\
u,v,isosceles(v) title "side2 == side3" w l lc 4,\
u,u,equilateral3(u) title "equilateral" w linespoint lc 1




pause -1
quit
