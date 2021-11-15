/*instrumented version of ~/sebase/re_gp/triangle2/triangle.c $Revision: 1.5 $ */
/*Modifications:
WBL 2 Nov 2021 add piping inputs for information.awk
*/

#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
int* data=NULL;
#define stride 7
void Print(){
  int i, v;
  for(i=0;i<4;i++){
    int total = 0;
    for(v=0;v<stride;v++){
      int d = data[i*stride+v];
      if(d){
	printf("%d %3d %7d\n",i,v,d);
	total += d;
      }
    }
    printf("%d tot %7d\n",i, total);
    assert(total == 100*100*100);
  }
}
inline void record(const int line, 
		   const int side1, const int side2, const int side3,
		   const int value){
  printf("%d %3d %3d %3d %d\n",line,side1,side2,side3,value);
  if(line<0) return;
  if(data==NULL) data = calloc(4*stride,sizeof(int));
  assert(line >=0 && line <4);
  assert(value>=0 && value<stride);
  assert(line*stride+value<4*stride);
  data[line*stride+value]++;
}


int gettri(int side1, int side2, int side3)
{
    
     int triang ;
    
    if( side1 <= 0 || side2 <= 0 || side3 <= 0){
        return 4;
    }
  
    triang = 0;
    record(0, side1,side2,side3, triang);

    if(side1 == side2){
        triang = triang + 1;
    }
    record(1, side1,side2,side3, triang);
    if(side1 == side3){
        triang = triang + 2;
    }
    record(2, side1,side2,side3, triang);
    if(side2 == side3){
        triang = triang + 3;
    }
    record(3, side1,side2,side3, triang);
        
    if(triang == 0){
        if(side1 + side2 < side3 || side2 + side3 < side1 || side1 + side3 < side2){
            return 4;
        }
        else {
            return 1;
        }
	
    }          

    if(triang > 3){
        return 3;
    }
    else if ( triang == 1 && side1 + side2 > side3) {
        return 2;
    }
    else if (triang == 2 && side1 + side3 > side2){
        return 2;
    }
    else if (triang == 3 && side2 + side3 > side1){
        return 2;
    }
    
    return 4;
}

/*calculate entropy for triang variable line 21 in orginal code (record(3,*)

gawk 'function log2(x){return log(x)/log(2)}($1==3 && $2!="tot"){p[++I]=$3/1e6;h[I]=-p[I]*log2(p[I]);print I,p[I],h[I],$0}END{for(i in p){P+=p[i];H+=h[i]}print P,H}' t

*/
