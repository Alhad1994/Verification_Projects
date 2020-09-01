class c_192_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_192_4;
    c_192_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x011z0001xzxz0z1zzz111z0zxzzz0zxzzxxxzxzxzxzzxxxzzxxzxxxxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
