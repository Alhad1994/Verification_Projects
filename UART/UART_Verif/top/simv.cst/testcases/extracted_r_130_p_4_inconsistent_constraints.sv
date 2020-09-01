class c_130_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_130_4;
    c_130_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x0xzxzz0xx10xz1z010z0xx1xx1x010zxzzzxzzzzzzzzzxxzzzxxxxxxzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
