class c_11_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_11_1;
    c_11_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "010000zzzx10001z0zz0101zzzz0z1z0xzxxzxxzxzxxxzzzxxxzxzxxzxzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
