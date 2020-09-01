class c_152_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_152_4;
    c_152_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0z1xzz10zz010zz0011111110xz010xxxzxzxzxxzxzzzzzzxxxzzxzxxxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
