#WBL 27 Oct 2021 $Revision: 1.3 $
#Three dimensional plot of triangle program input and output space

set title "Triangle Program"

#http://www.gnuplot.info/docs_4.2/node212.html
set parametric
set trange [-100:100]
set urange [-100:100]
set vrange [-100:100]

set xlabel "side1"
set ylabel "side2"
set zlabel "side3"


#return 4 not a triangle, not plotted
#return 3 equilateral, red
#return 2 isosceles
#return 1 scalene, not plotted


equilateral(z) = (z>0)? z : 0/0;
#similar(x,y)  = abs(x-y)<3;     #may help debugging...
isosceles(x)   = (x>0)? x : 0/0;

set ticslevel 0

#https://stackoverflow.com/questions/24909408/how-can-i-draw-a-plane-in-gnuplot-when-it-is-parallel-to-one-of-the-coordinate

splot \
u,isosceles(u),v title "side1 == side2" w l lc 2,\
isosceles(v),u,v title "side1 == side3" w l lc 3,\
u,v,isosceles(v) title "side2 == side3" w l lc 4,\
u,u,equilateral(u) title "equilateral" w linespoint lc 1

pause -1
quit
