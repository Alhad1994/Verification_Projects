class c_186_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_186_1;
    c_186_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00010xz0xx0z1x011010xz110x111110xzxxzxzxzzzxzxzzzzzxxzxzxzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
