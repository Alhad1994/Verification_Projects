class c_199_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_199_1;
    c_199_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz10z1000zz0z1100x0zzz1zx0111xzzxzxzzzxzxxzxzxzxxzxzzxzzxzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
