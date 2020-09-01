class c_149_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_149_4;
    c_149_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xx1zx01z1001zxzzxzz0xxzxzxx1zz0xxzzzxzzzzxzzxzxzxzzzzxxxxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
