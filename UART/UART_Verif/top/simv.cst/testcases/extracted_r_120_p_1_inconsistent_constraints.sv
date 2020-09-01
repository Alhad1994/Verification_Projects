class c_120_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_120_1;
    c_120_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x010z11z10z0zzz010110xzxzz1x1101xxxzzzxzxxzzzxxzzxzxxzxzxzxxzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
