class c_35_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_35_4;
    c_35_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1zx010zx1zz0zxzxzzz010xxzx01z00xzxxxzxxzzxzzxzzzzxxxzxxzxzzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
