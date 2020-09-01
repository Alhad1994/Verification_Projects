class c_129_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_129_4;
    c_129_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx0zzxzxx10xxxzz011000x1xzxxx01zxxzxxzxxxxxzxzxzzzzzzzxxxzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
