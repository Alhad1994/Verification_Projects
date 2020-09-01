class c_131_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_131_1;
    c_131_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx00110x1x1zzxzx1xzxx01z0zxzz00xzzzzxzxzxxxxzxzxxxzxxzxzxzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
