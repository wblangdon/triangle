#WBL 2 Nov 2021 $Revision: 1.3 $
#Plot to show why (with 8120601 tests) inside triangle.c mutual information is zero

#Modifications:
#WBL  6 Nov 2021 generate gif for release of slides, bugfix key (return 4)
#WBL  2 Nov 2021 based on information.gnu 1.5

#50ms between frames (20fps) loop forever
set terminal gif transparent animate delay 5 loop 0 optimize
set output "information_return.gif"

set title "Mutual Information = 0.0750628 (with 8120601 tests).\nNB side1 side2 and side3 have same distribution wrt triangle output" \
offset 0,1

!gawk '($1==-1 && $2=="side1" && (($3+200)%10)<11)' information.out > /tmp/t

#animation will "jump" but need zlabel
set key left #offset -2
set xlabel "side 1,2,3"
set ylabel "output value"
set zlabel "count" offset 4,7

set yrange [-0.5:4.5]
set log z

set key at screen 0.95,0.15

set ticslevel 0
#set view 70,55

p(x,y) = (x==y)? x : 0/0;

n = 100
do for [i=1:n] {
   r = 55+i*360/n;
   r = (r<=360)? r : r-360;
   set view 70, r

splot \
"/tmp/t" u 3:(p($4,1)):5:4 title        "Scalene return 1",\
"/tmp/t" u 3:(p($4,2)):5:4 title      "isosceles return 2",\
"/tmp/t" u 3:(p($4,3)):5:4 title    "equilateral return 3",\
"/tmp/t" u 3:(p($4,4)):5:4 title "not a triangle return 4"

}

#pause -1
quit
