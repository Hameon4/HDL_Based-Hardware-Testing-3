module fcn2 (X, Y , A , B , C , D) ;

  input A , B , C , D;
  output X , Y;
  wire w1 , w2 , w3 , w4 , w5 ;

  nor G1 (w1 , C , B) ;
  not G2 (w2 , w1 );
  not G3 (w3 , A) ;
  nand G4 (w4 , w3 , w2 );
  nor G5 (w5 , D , B) ;
  xor G6 (X , w5 , w4 );
  and G7 (Y , D , w4 );

endmodule

//Tesbench
module tb;
  reg A, B, C, D;
  wire X, Y;
  //integer i;

  fcn2 uut (.X(X), .Y(Y), .A(A), .B(B), .C(C), .D(D));

  initial begin
    assign A = 0;
    		B = 0;
    		C = 0;
    		D = 0;

    #10 assign A = 1;
    		B = 1;
    		C = 1;
    		D = 1;

    #10 assign A = 0;
    		B = 0;
    		C = 1;
    		D = 1;

    #10 assign A = 1;
    		B = 1;
    		C = 0;
    		D = 0;

    #10 assign A = 1;
    		B = 0;
    		C = 1;
    		D = 0;

    #10 assign A = 0;
    		B = 1;
    		C = 0;
    		D = 1;


    //initial begin
      //for (i = 0; i <= 5; i++) begin
       // {A, B, C, D}  = i[3:0];
       // #5;
       // $display ("T=%3d: in=%2b, out=%1b", $time, {A, B, C, D}, y);
      //  #5;
     // end
   // end
  end

  initial begin
    $dumpfile("fcn2.vcd");
    $dumpvars(0, tb);
  end
endmodule
