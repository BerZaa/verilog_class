/*
 * @Author: BerZaa 
 * @Date: 2021-10-25 09:26:57 
 * @Last Modified by: BerZaa
 * @Last Modified time: 2021-10-25 09:52:04
 */

module exp8_top (
    input  wire         clk         ,
    input  wire         rst_n       ,
    input  wire         key         ,
    input  wire         sw          ,
    output wire         led         ,
    output wire [3 : 0] state_count
);
    
    wire clk_1KHz;
    wire key_stable_temp, key_stable;

    divider divider_inst (
        .clk            (clk),
        .rst_n          (rst_n),
        .clk_1KHz       (clk_1KHz)
    );

    edge_detect edge_detect_inst (
        .clk            (clk),
        .rst_n          (rst_n),
        .signal         (key_stable_temp),
        .key_signal     (key_stable) 
    );

    key_filter key_filter_inst (
        .clk            (clk_1KHz),
        .rst_n          (rst_n),
        .key            (key),
        .key_stable     (key_stable_temp)   
    );

    queue_detect queue_detect_inst(
        .clk            (clk),
        .rst_n          (rst_n),
        .key_p          (key_stable),
        .sw             (sw),
        .led            (led),
        .state_count    (state_count)    
    );

endmodule