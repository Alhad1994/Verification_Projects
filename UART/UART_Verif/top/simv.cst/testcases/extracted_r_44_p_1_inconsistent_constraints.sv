class c_44_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_44_1;
    c_44_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1110zx0xz1x1z1x1110z01z0z0z11101xzxxxzxxzxzxxzzxzxxxzxzzxzxzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
