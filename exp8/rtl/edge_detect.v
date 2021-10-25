/*
 * @Author: BerZaa 
 * @Date: 2021-10-25 09:27:02 
 * @Last Modified by: BerZaa
 * @Last Modified time: 2021-10-25 09:33:08
 */

module edge_detect (
    input  wire clk         ,
    input  wire rst_n       ,
    input  wire signal      ,
    output wire key_signal  
);
    
    reg [1 : 0] ff_q;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            ff_q <= 2'b11;
        end
        else begin
            ff_q <= {ff_q[0], signal};
        end
    end

    assign key_signal = ff_q[0] & (!ff_q[1]);

endmodule