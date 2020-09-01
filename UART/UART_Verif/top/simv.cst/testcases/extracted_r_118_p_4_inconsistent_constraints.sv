class c_118_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_118_4;
    c_118_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0xzz0zzxzxxzzzzzz1xzz0x1z10xxx1xxxzxzxzzzxzzzxxxxxzxzzxxxzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
