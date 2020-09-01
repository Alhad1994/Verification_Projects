class c_112_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_112_4;
    c_112_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxz101xxx0xz00xxz0zx01z0x010zz01xzxzzzxxxzxzxzxzxxzxzzxxxzxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
