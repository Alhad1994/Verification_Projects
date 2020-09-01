class c_14_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_14_4;
    c_14_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zx0z1zx0z1zx1zzxz1011z10z0xxz01zxxzzzzzxxxxxzxxxxxzxxxzzxxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
