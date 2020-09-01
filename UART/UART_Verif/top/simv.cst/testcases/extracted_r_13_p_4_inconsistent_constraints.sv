class c_13_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_13_4;
    c_13_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx0x0x00x00zx10000xzx01010zxx11xxzxzxxxxzxxxzzzzxzzxxzzzxxzxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
