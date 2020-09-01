class c_15_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_15_1;
    c_15_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01100x10zzxz0zxzx01z1zzzz101x1z1zxxzzxxxzzzxxxxxxxxxzzzzxxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
