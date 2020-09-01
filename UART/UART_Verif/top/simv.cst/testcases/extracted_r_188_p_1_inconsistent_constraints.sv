class c_188_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_188_1;
    c_188_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0zx11x0z10000zxz1x0110z01xzx1zzxxxxxxxzxxzxxzzzzzxzzxzxzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
