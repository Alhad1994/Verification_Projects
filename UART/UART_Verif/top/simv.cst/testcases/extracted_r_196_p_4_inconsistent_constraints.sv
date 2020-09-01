class c_196_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_196_4;
    c_196_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11x0x01zxz11zz011z1xz0zxzz0zxxx1zxzxzzxxzxxzzzxxzxzzxzxxxzzzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
