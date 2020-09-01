class c_46_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_46_4;
    c_46_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1110xxx01zzxx10z0zzx1100z1zx0x0zzzxzxzzzzzxzzzxzzzxzzzzxzxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
