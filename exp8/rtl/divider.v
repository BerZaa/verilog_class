/*
 * @Author: BerZaa 
 * @Date: 2021-10-25 09:27:01 
 * @Last Modified by: BerZaa
 * @Last Modified time: 2021-10-25 09:33:11
 */

module divider (
    input  wire clk     ,
    input  wire rst_n   ,
    output wire clk_1KHz
);
    
    parameter CNT_MAX = 50_000;

    reg [29 :0] cnt;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            cnt <= 30'd0;
        end
        else if(cnt == CNT_MAX - 30'd1) begin
            cnt <= 30'd0;
        end
        else begin
            cnt <= cnt + 30'd1;
        end
    end

    assign clk_1KHz = (cnt < (CNT_MAX / 2)) ? 1'b0 : 1'b1;

endmodule