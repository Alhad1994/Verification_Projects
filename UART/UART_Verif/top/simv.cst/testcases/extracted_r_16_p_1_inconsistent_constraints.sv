class c_16_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_16_1;
    c_16_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0zz0xxzz10zx0x1zz1z1z1011zxx0xxxzzxzzxxzzxxxzxxzxzxzxxzzzzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
