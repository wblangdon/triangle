int gettri(int side1, int side2, int side3)
{
    
     int triang ;
    
    if( side1 <= 0 || side2 <= 0 || side3 <= 0){
        return 4;
    }
  
    triang = 0;

    if(side1 == side2){
        triang = triang + 1;
    }
    if(side1 == side3){
        triang = triang + 2;
    }
    if(side2 == side3){
        triang = triang + 3;
    }
        
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
