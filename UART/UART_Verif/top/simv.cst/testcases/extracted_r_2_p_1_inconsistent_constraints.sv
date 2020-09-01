class c_2_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_2_1;
    c_2_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0000z111xzxx1zz1zx0z011110xx0x1zzzxxzzzzzzxzzzxxzxzxzxxzzzzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
