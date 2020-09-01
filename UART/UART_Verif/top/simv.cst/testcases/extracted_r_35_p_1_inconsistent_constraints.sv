class c_35_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_35_1;
    c_35_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xzx10z01z0z11x10z01zz00xzxzz00xxxxzxzxzxxzxxzxzzzxxzzxxzzxzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
