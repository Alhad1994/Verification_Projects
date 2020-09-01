class c_74_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_74_1;
    c_74_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xz0z1zxxzxz0111xxz11x000xzxxx111xxxxxzzxzxzxxxzxzxzxzzzzzxxzzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
