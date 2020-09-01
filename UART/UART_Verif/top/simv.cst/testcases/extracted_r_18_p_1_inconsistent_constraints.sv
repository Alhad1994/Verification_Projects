class c_18_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_18_1;
    c_18_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "001z1zx0z0z001z1x11xzxx111101111xxxxxxzzzzzzzxzxzxzxxxzxzzxxxxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
