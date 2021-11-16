#WBL 2 Nov 2021 $Revision: 1.5 $
#Plot to show why (with 8120601 tests) inside triangle.c mutual information is zero


set title "Mutual Information = 0 (with 8120601 tests).\nNB side1 side2 and side3 have same distribution wrt triang"

set xlabel "side 1,2,3"
set ylabel "triang"
set zlabel "count" offset -1

set xrange [1:100]
set yrange [-0.5:6.5]
set log z

set ticslevel 0
set view 
set view 70,55

splot \
"<grep '^1 side1 .7' information_filter.out" u 3:4:5:1 title "line 15" w p pt 1 lc 1 ,\
"<grep '^2 side1 .4' information_filter.out" u 3:4:5:1 title "line 18" w p pt 2 lc 3 ,\
"<grep '^3 side1 .1' information_filter.out" u 3:4:5:1 title "line 21" w p pt 4 lc 4 ,\


pause -1
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
