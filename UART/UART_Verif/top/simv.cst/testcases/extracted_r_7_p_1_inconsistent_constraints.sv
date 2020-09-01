class c_7_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_7_1;
    c_7_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx011x1xzxzzx01z00100zzxz0011xxzzzxzzxxzzzxxxxzzzxzzzxxzxxzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
