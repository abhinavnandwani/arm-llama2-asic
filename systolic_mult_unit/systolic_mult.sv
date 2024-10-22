
/* 
    Author          : Abhinav Nandwani
    Filename        : systolic_mult.sv
    Description     : This is a 32x32 matrix mult unit for INT8, it can do 1K (=1024) MACs per cycle
*/

module systolic_mult(); 

    input [15:0] A_west [0:31]; // matrix A, input from image memory, 32 rows 1 element from each at a time
    input [15:0] B_north [0:31]; //weights, kernals from weight buffer/memory 
    


    genvar i,j;
    generate
        for(i = 0;i<32;i++) begin //iterate through rows
            for(j = 0;j<32;j++) begin //iterate through cols

                //pe instantiation
                pe peDUT(.clk(clk), .rst_n(rst_n), .west_row_in((j == 0)?A_west[i]:east_row_out[i-1]), .north_col_in(), .east_row_out(), .south_col_out());
                
            end
        end