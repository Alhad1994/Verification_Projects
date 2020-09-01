class c_122_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_122_4;
    c_122_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxz0xzz1101zzzzxzz11z000x0100zz0xzxzxxzzxzzxxzxxzxzxxxxxxxxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
