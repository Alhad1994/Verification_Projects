class c_198_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_198_1;
    c_198_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x11111z0zxx0x0111x01001zxxzz0111zxzzzxxzzxzxxzxxzxzxzzxxzzzxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
