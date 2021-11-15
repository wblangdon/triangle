/*WBL 28 Oct 2021 noddy C program to extract data frequencies from triangle.c $Revision: 1.2 $
update ~/sebase/re_gp/triangle2/triangle.c 
*/
/*Compile: gcc main2.c #via include triang.c
 */
/*Modifications:
WBL 2 Nov 2021 add piping inputs for information.awk
*/

#include <stdio.h>
#include "triang.c"

int main() {
  int i,j,k;
  for(i = -100;i<=100;i++){
  for(j = -100;j<=100;j++){
  for(k = -100;k<=100;k++){
    const int c =  gettri(i,j,k);
    record(-1, i,j,k, c);
  }}}
  Print();
  return 0;
}
