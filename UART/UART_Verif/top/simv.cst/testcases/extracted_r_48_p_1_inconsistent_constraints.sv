class c_48_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_48_1;
    c_48_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11zzz00zx1x0xxzxx0x01z10zxxz0z00zxxzxzzxxxzzzxzxzzzzzzzzxzzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
