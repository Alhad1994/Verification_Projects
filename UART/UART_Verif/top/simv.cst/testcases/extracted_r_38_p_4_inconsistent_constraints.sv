class c_38_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_38_4;
    c_38_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1xx100xx1xx1x11x0xzx1z0xx1x100zxzzzxxxxzxzxzxxzxxzzxxzxxxxzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
