class c_58_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_58_1;
    c_58_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1z100x11zz0z0xx0z11000111x1001x0xxzzzzxzxzxxxzzzxzxxxzzxzxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
