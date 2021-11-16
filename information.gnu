#WBL 2 Nov 2021 $Revision: 1.7 $
#Plot to show why (with 8120601 tests) inside triangle.c mutual information is zero

#Modifications:
#WBL  6 Nov 2021 generate gif for release of slides

#50ms between frames (20fps) loop forever
set terminal gif transparent animate delay 5 loop 0 optimize
set output "information.gif"

set title "Mutual Information = 0 (with 8120601 tests).\nNB side1 side2 and side3 have same distribution wrt triang" \
  offset 0,1

#animation will "jump" but need zlabel
set xlabel "side 1,2,3"
set ylabel "triang"
set zlabel "count" offset 4,7

set xrange [1:100]
set yrange [-0.5:6.5]
set ytics (0,1,2,3,6)
set log z

set key at screen 0.95,0.15

set ticslevel 0
n = 100
do for [i=1:n] {
   r = 55+i*360/n;
   r = (r<=360)? r : r-360;
   set view 70, r

splot \
"<grep '^1 side1 .7' information_filter.out" u 3:4:5:1 title "line 15" w p pt 1 lc 1 ,\
"<grep '^2 side1 .4' information_filter.out" u 3:4:5:1 title "line 18" w p pt 2 lc 3 ,\
"<grep '^3 side1 .1' information_filter.out" u 3:4:5:1 title "line 21" w p pt 4 lc 4
}

#pause -1
quit

#show mutual information does not always help

print "show side1 side2 and side3 have same distribution wrt triang"
!gawk '(index($0,"1 side1")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t1
!gawk '(index($0,"1 side2")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t2
!wc   /tmp/t1 /tmp/t2
!diff /tmp/t1 /tmp/t2 | wc
!gawk '(index($0,"1 side3")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t2
!wc   /tmp/t1 /tmp/t2
!diff /tmp/t1 /tmp/t2 | wc

!gawk '(index($0,"2 side1")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t1
!gawk '(index($0,"2 side2")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t2
!wc   /tmp/t1 /tmp/t2
!diff /tmp/t1 /tmp/t2 | wc
!gawk '(index($0,"2 side3")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t2
!wc   /tmp/t1 /tmp/t2
!diff /tmp/t1 /tmp/t2 | wc

!gawk '(index($0,"3 side1")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t1
!gawk '(index($0,"3 side2")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t2
!wc   /tmp/t1 /tmp/t2
!diff /tmp/t1 /tmp/t2 | wc
!gawk '(index($0,"3 side3")==1){print $3,$4,$5}' t3.dat2 | sort > /tmp/t2
!wc   /tmp/t1 /tmp/t2
!diff /tmp/t1 /tmp/t2 | wc

#quit
