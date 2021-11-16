#gawk helper for information.gnu
#based on information.gnu r1.3
#to run ./a.out | gawk -f information_filter.awk information_filter.out

#Modifications:
#WBL  2 Nov 2021 gather information on return values for information_return.gnu

(FNR==1){v = "$Revision: 1.4 $";
printf("#information_filter.awk %s %s %s\n",
       substr(v,2,length(v)-2),FILENAME,strftime());
}
($1==-1&& NF==5){LR1[$2,$5]++;LR2[$3,$5]++;LR3[$4,$5]++;next;}
($1==1 && NF==5){L11[$2,$5]++;L12[$3,$5]++;L13[$4,$5]++;next;}
($1==2 && NF==5){L21[$2,$5]++;L22[$3,$5]++;L23[$4,$5]++;next;}
($1==3 && NF==5){L31[$2,$5]++;L32[$3,$5]++;L33[$4,$5]++;next;}
function P(L,txt,  i,t){
  for(i in L){split(i,t,SUBSEP); print txt,t[1],t[2],L[i]}}
END{
P(LR1,"-1 side1");
P(LR2,"-1 side2");
P(LR3,"-1 side3");

P(L11,"1 side1");
P(L12,"1 side2");
P(L13,"1 side3");
P(L21,"2 side1");
P(L22,"2 side2");
P(L23,"2 side3");
P(L31,"3 side1");
P(L32,"3 side2");
P(L33,"3 side3");
}
