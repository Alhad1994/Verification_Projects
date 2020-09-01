class c_130_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_130_1;
    c_130_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zz1x000xz01z10z1zz1zxzzz0zz0zz1zzxzxxzzxxzxxxxzzxxzxxxxxzzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
