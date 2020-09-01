class c_157_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_157_4;
    c_157_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x11z0xz1z0xzz0zxx1x10x1xzx010x0zzzzxxxzxxzzzxzzzzxzxxzxxxzzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
