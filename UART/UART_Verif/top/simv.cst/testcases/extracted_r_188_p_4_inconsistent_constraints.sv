class c_188_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_188_4;
    c_188_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxz000z100zx0z00x11x0xzx0x0xx11xzzxxzzzxzxzxxzxxzzxzzxzzzxzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
