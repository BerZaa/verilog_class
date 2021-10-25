/*
 * @Author: BerZaa 
 * @Date: 2021-10-25 09:27:13 
 * @Last Modified by: BerZaa
 * @Last Modified time: 2021-10-25 09:33:03
 */

`timescale 1ns/1ns

module exp8_tb ();

    reg          clk         ;
    reg          rst_n       ;
    reg          key         ;
    reg          sw          ;
    wire         key_stable  ;
    wire [3 : 0] state_count ;
    wire         led         ;

    parameter ONE_MS = 1_000_000;

    exp8_top exp8_top_inst (
        .clk         (clk),
        .rst_n       (rst_n),
        .key         (key),
        .sw          (sw),
        .led         (led),
        .state_count (state_count)
    );

    initial begin
        clk     = 1'b0;

        rst_n   = 1'b0;
        #10
        rst_n   = 1'b1;

        key     = 1'b0;
        sw      = 1'b1;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);

        key     = 1'b0;
        sw      = 1'b1;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);

        key     = 1'b0;
        sw      = 1'b0;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);

        key     = 1'b0;
        sw      = 1'b1;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);

        key     = 1'b0;
        sw      = 1'b0;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);

        key     = 1'b0;
        sw      = 1'b1;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);

        key     = 1'b0;
        sw      = 1'b0;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);

        key     = 1'b0;
        sw      = 1'b1;
        #(ONE_MS * 30);
        key     = 1'b1;
        #(ONE_MS *  2);    

        $finish;
    end

    initial
    begin            
        $dumpfile("wave.vcd");        
        $dumpvars(0, exp8_tb); 
    end


    always #10 clk <= ~clk;

endmodule