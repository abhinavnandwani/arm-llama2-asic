
/* 
    Author          : Abhinav Nandwani
    Filename        : systolic_mult.sv
    Description     : This is a 32x32 matrix mult unit for INT8, it can do 1K (=1024) MACs per cycle
*/

module systolic_mult(); 

    input 