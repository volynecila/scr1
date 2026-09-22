module scr1_tb_log_cmd();

always_ff @(posedge scr1_top_tb_ahb.i_top.i_imem_ahb.clk) begin
    if (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_resp == 2'b01) begin
        if (
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[6 : 0]   == 7'b0110011) &
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[14 : 12] == 3'b000)     &
            (scr1_top_tb_ahb.i_top.i_imem_ahb.imem_rdata[31 : 25] == 7'b0100000)
        ) begin
            $display("Detect SUB command");
            $display("PC = %h", scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.curr_pc);
            for (int i = 1; i < 32; i++) begin
                $display("x%0d = %h", i,
                    scr1_top_tb_ahb.i_top.i_core_top.i_pipe_top.i_pipe_mprf.mprf_int[i]);
            end
        end
    end
end

endmodule
