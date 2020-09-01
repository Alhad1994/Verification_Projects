class c_92_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_92_1;
    c_92_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z1zzx1x011111110z01z1z1zzxz0xxzzzxzzxzzxzxxzxzzzxxxxzzxxzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
