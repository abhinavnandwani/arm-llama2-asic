
/* 
    Author          : Abhinav Nandwani
    Filename        : systolic_mult.sv
    Description     : This is a 32x32 matrix mult unit for INT8, it can do 1K (=1024) MACs per cycle. 
                      Wait i clk cycles to input ith row element and j clk cycles to input jth row element 
*/

module systolic_mult(clk,rst_n,A_west,B_north,sum_out); 

    input clk,rst_n;
    input [15:0] A_west [0:31]; // matrix A, input from image memory, 32 rows 1 element from each at a time
    input [15:0] B_north [0:31]; //weights, kernals from weight buffer/memory 

    output [31:0] sum_out[0:31][0:31];

    logic [15:0] east_row_out[0:31][0:31];
    logic [15:0] south_col_out [0:31][0:31];
    logic [31:0] sum[0:31][0:31];
    logic [31:0] next_sum [0:31][0:31];


    assign sum_out = sum;
    
    // 32x32 reg file for sum 
    always_ff@(posedge clk, negedge rst_n)
        if(!rst_n)
            for(i=0;i<32;i++)
                for(j=0;j<32;j++)
                    sum[i][j] <= 0;
        else
            for (i=0;i<32;i++)
                for(j=0;j<32;j++) 
                    sum[i][j] <= next_sum[i][j];

    genvar i,j;
    generate
        for(i = 0;i<32;i++) begin //iterate through rows
            for(j = 0;j<32;j++) begin //iterate through cols

                //pe instantiation
                pe peDUT(
                    .clk(clk), 
                    .rst_n(rst_n), 
                    .west_row_in((j == 0)?A_west[i]:east_row_out[i][j-1]),  // conditional to decide for 1st element of each row
                    .north_col_in((i==0)?B_north[j]:south_col_out[i-1][j]), // conditional to decide for 1st element of each col
                    .east_row_out(east_row_out[i][j]), 
                    .south_col_out(south_col_out[i][j]),
                    .sum_in(sum[i][j]),
                    .sum_out(next_sum[i][j])
                );
            end
        end