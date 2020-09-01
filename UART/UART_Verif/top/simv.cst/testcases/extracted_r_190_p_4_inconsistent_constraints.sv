class c_190_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_190_4;
    c_190_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x10zxzzzzx00xzz0xx1x000zx1110z1zzxzxxxxzxzzxxxxzxxxzzzzxzxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
