#gawk helper for main2.c $Revision: 1.6 $

#Modifications
#WBL  8 Nov 2021 Add mutual information for three sides together
#WBL  2 Nov 2021 r1.00 based on benford_muladd.awk r1.8 

#based on ~/cuda/sdk/projects/1000_mycoplasma/rem_low_entropy.awk r1.3

function entropy2(distribution,N,text,  i,p,S,total,diff) {
  if(N!=1) for(i in distribution) distribution[i] = distribution[i]/N;
  for(i in distribution) {
    p = distribution[i];
    total += p;
    S -= p * log2(p);
    #print text,X(i),p;
  }
  diff  = total - 1.0;
  if(abs(diff)>=0.0001) {
    print "entropy2(distribution,"N","text") total not 1",total,diff > "/dev/stderr";
    exit 98;}
  return S;
}
function check(distribution,text,  i,total,diff) {
  for(i in distribution) {
    total += distribution[i];
    #print text,X(i),distribution[i];
  }
  diff  = total - 1.0;
  if(abs(diff)>=0.0001) {
    print "check(,"text") total="total,"not 1, diff",diff > "/dev/stderr";
    exit 97;}
}
function information2(distribution,N,text,  i,ij,t,j,pi,pj,p1,p2,I) {
  for(i in distribution) distribution[i] = distribution[i]/N;
  #check(distribution,text);
  for(ij in distribution) {
    split(ij,t,SUBSEP);
    pi[t[1]] += distribution[ij];
    pj[t[2]] += distribution[ij];
  }
  check(pi,sprintf("%spi",text));
  check(pj,sprintf("%spj",text));
  for(ij in distribution) {
    split(ij,t,SUBSEP);
    p = distribution[ij];
    i = t[1];
    j = t[2];
    p1 = pi[i];
    p2 = pj[j];
    I += p * (log2(p)-log2(p1)-log2(p2));
#   if(N<1000) print "#\""text"\"",i,j,p,p1,p2,I;
#   print "#"text,X(ij),X(i),X(j),p,p1,p2,I;
  }
  return I;
}
function abs(x)  { return (x>=0)? x : -x }
function log2(r) { return log(r)/log(2); }
(NF==5){data[$0]++;Total++;}
END{
v = "$Revision: 1.6 $";
printf("#information.awk %s %s\n",
       substr(v,2,length(v)-2),strftime());

for(L=-1;L<=3;L++){
  N = 0;
  for(i in dist1) delete dist1[i];
  for(i in dist2) delete dist2[i];
  for(i in dist3) delete dist3[i];
  for(i in disto) delete disto[i];
  for(i in data){
    ;
    split(i,t); 
    if(t[1] == L){
      ;
      N                += data[i];
      dist1[t[2],t[5]] += data[i];
      dist2[t[3],t[5]] += data[i];
      dist3[t[4],t[5]] += data[i];
      disto[t[5]]      += data[i];
    }
  }#for data
  for(k=2;k<=4;k++){
    ;
    text2 = (L == -1)? "return" :sprintf("line%d",L);
    text  = sprintf("\"side%d %s\"",k-1,text2);
    print "examples",text,N;
    print "mutual information",text,
	(k==2)? information2(dist1,N,text) : (\
	(k==3)? information2(dist2,N,text) :
	        information2(dist3,N,text)   );
  }#for data
  print "entropy output",entropy2(disto,N,text2);
  print "";
}#for return/line

for(L=-1;L<=3;L++){
  N = 0;
  for(i in dist)  delete dist[i];
  for(i in disto) delete disto[i];
  for(i in data){
    ;
    split(i,t); 
    if(t[1] == L){
      ;
      N                += data[i];
      sidex = sprintf("%s_%s_%s",t[2],t[3],t[4]);
      dist[sidex,t[5]] += data[i];
      disto[t[5]]      += data[i];
    }
  }#for data

  text2 = (L == -1)? "return" :sprintf("line%d",L);
  text  = sprintf("\"sidex %s\"",text2);
  print "examples",text,N;
  print "mutual information",text,information2(dist,N,text);
  print "entropy input", entropy2(dist, 1,text2); #normalised by information2
  print "entropy output",entropy2(disto,N,text2);
  print "";
}#for return/line

}
