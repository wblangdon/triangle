#WBL 27 Oct 2021 $Revision: 1.2 $
#4 7605851
#1 492450
#2 22200
#3 100

END{
  ;
  N[4] = 7605851;
  text[4] = "not_a_triangle";
  N[1] = 492450;
  text[1] = "Scalene";
  N[2] = 22200;
  text[2] = "Isosceles";
  N[3] = 100;
  text[3] = "Equilateral";
  for(i=1;i<=4;i++) total+=N[i];
  if(total != 201**3) exit 99;
  for(i=1;i<=4;i++) p[i] = N[i]/total;

  for(i=1;i<=4;i++) entropy += -p[i] * log2(p[i]);

  order[1]=3;
  order[2]=2;
  order[3]=4;
  order[4]=1;
  for(h=1;h<=4;h++) {
    i = order[h];
    printf("%-15s %d %7d %f %g\n",text[i],i,N[i],p[i], -p[i] * log2(p[i]));
  }
  print "";
  print "entropy in", log2(total), "    entropy out",entropy;
}

function log2(x){return log(x)/log(2)}
