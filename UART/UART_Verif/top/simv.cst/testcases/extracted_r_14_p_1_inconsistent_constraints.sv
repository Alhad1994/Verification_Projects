class c_14_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_14_1;
    c_14_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1xzz010z11x110zxz11zzzxxz0x110zxxxxxzzzzzxzxxzxzzxxzxzxzzxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
