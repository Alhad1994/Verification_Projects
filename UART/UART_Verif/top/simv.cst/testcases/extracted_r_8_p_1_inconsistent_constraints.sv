class c_8_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_8_1;
    c_8_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110zz1x110xxx10zx0zxx0zz10x01001xzzzzxzxxzzzzxxzxxzxzxxzzxxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
