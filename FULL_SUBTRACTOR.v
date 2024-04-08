`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.01.2024 14:44:43
// Design Name: 
// Module Name: FULL_SUBTRACTOR
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


 module full_subtractor(
    input A, // Minuend
    input B, // Subtrahend
    input Cin, // Borrow input
    output Diff, // Difference
    output Bout // Borrow output
    );

    wire D1, B1, B2;
    
    // First half subtractor
    half_subtractor HS1(.A(A), .B(B), .Diff(D1), .Borrow(B1));
    
    // Second half subtractor
    half_subtractor HS2(.A(D1), .B(Cin), .Diff(Diff), .Borrow(B2));
    
    // OR gate to compute final borrow output
    assign Bout = B1 | B2;
    endmodule
