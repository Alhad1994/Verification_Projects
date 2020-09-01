class c_107_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_107_4;
    c_107_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxzzx00z10zz000x101zzz011xzzx10xzzxxxzzzxzxzxxzxzzzzzxxzzzzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
