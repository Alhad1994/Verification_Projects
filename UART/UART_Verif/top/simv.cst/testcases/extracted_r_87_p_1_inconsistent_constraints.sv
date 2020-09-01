class c_87_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_87_1;
    c_87_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001z0111zzz0000x11x01z1xz11z1x1xxzzxxzxxxxzxzxxzzzxxzzzxxxzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
