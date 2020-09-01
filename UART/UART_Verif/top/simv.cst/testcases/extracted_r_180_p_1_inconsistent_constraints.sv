class c_180_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_180_1;
    c_180_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z10010xzxx0z1110xzzx100101x01z0xxxxzxxxzxxxzzxzxxzxzzzxzxzzzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
