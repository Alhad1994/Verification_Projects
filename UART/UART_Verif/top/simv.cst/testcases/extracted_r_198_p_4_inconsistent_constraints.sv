class c_198_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_198_4;
    c_198_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x01z0z00x01z0z111xz100zz01110x0zzxxxxxxzxzxxzxzzzzxxxzxxxzxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
