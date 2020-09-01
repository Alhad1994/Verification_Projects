class c_143_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_143_1;
    c_143_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zz0011110z1z01111zx0zx01z10z10zzxzzzzxzzxzxxzxxzxxxxxzzxxzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
