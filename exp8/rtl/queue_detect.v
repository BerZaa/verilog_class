/*
 * @Author: BerZaa 
 * @Date: 2021-10-25 10:24:11 
 * @Last Modified by:   BerZaa 
 * @Last Modified time: 2021-10-25 10:24:11 
 */

module queue_detect (
    input  wire         clk             ,
    input  wire         rst_n           ,
    input  wire         key_p           ,
    input  wire         sw              ,
    output reg          led             ,
    output wire [3 : 0] state_count
);

    parameter   IDLE    = 4'b0000,
                STATE_0 = 4'b0001,
                STATE_1 = 4'b0010,
                STATE_2 = 4'b0100,
                STATE_3 = 4'b1000;

    reg [3 : 0] state;

    always @(posedge clk, negedge rst_n) begin
        if(!rst_n) begin
            state <= IDLE;
            led   <= 1'b0;
        end
        else begin
            case (state)
                IDLE : 
                    if(key_p) begin
                        if(sw == 1'b1) begin
                            state <= STATE_0;
                            led   <= 1'b0;
                        end
                        else begin
                            state <= IDLE;
                        end
                    end
                    else begin
                        state <= state;
                    end
                STATE_0 : 
                    if(key_p) begin
                        if(sw == 1'b1) begin
                            state <= STATE_1;
							led   <= 1'b0;
                        end
                        else begin
                            state <= STATE_0;
                        end
                    end
                    else begin
                        state <= state;
                    end
                STATE_1 :
                    if(key_p) begin
                        if(sw == 1'b0) begin
                            state <= STATE_2;
							led   <= 1'b0;
                        end
                        else begin
                            state <= STATE_1;
                        end
                    end
                    else begin
                        state <= STATE_1;
                    end
                STATE_2 :
                    if(key_p) begin
                        if(sw == 1'b1) begin
                            state <= STATE_3;
							led   <= 1'b1;
                        end
                        else begin
                            state <= IDLE;
                        end
                    end
                    else begin
                        state <= state;
                    end
                STATE_3 :
                    if(key_p) begin
                        if(sw == 1'b1) begin
                            state <= STATE_0;
							led   <= 1'b0;
                        end
                        else begin
                            state <= IDLE;
                        end
                    end
                    else begin
                        state <= state;  
                    end              
                default :  state <= IDLE;
            endcase
        end
    end

    assign state_count = state;

endmodule