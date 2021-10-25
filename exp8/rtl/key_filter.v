/*
 * @Author: BerZaa 
 * @Date: 2021-10-25 09:27:07 
 * @Last Modified by: BerZaa
 * @Last Modified time: 2021-10-25 09:33:05
 */

module key_filter (
    input  wire clk         ,
    input  wire rst_n       ,
    input  wire key         ,
    output wire key_stable  
);

    reg [19 : 0]ff_q;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            ff_q <= 20'b11111_11111_11111_11111;
        end
        else begin
            ff_q <= {ff_q[18 : 0], key};
        end
    end

    assign key_stable = ~(|ff_q);

endmodule