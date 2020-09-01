class c_40_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_40_4;
    c_40_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zz110x1x0zzzx0z10xzz0zxz1x0x10zxzxzxzxxxxzzxzxzxzxzzzzxzzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
