#WBL 2 Nov 2021 $Revision: 1.2 $
#Plot to show why (with 8120601 tests) inside triangle.c mutual information is zero

#Modifications:
#WBL  2 Nov 2021 based on information.gnu 1.5

set title "Mutual Information = 0.0750628 (with 8120601 tests).\nNB side1 side2 and side3 have same distribution wrt triangle output" \
offset 0,1

!gawk '($1==-1 && $2=="side1" && (($3+200)%10)<11)' information.out > /tmp/t

set key left #offset -2
set xlabel "side 1,2,3"
set ylabel "output value"
set zlabel "count" offset -1

set yrange [-0.5:4.5]
set log z

set ticslevel 0
set view 70,55

p(x,y) = (x==y)? x : 0/0;

splot \
"/tmp/t" u 3:(p($4,1)):5:4 title        "Scalene return 1",\
"/tmp/t" u 3:(p($4,2)):5:4 title      "isosceles return 2",\
"/tmp/t" u 3:(p($4,3)):5:4 title    "equilateral return 3",\
"/tmp/t" u 3:(p($4,4)):5:4 title "not a triangle return 4"


pause -1
quit
