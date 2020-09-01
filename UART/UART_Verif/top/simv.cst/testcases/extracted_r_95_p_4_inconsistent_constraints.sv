class c_95_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_95_4;
    c_95_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xzz111x10z01z0011z0z1zxxzx0z00zxxxxxzzzzxzzzxxxxzxzxxxxxxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
