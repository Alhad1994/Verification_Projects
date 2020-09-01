class c_128_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_128_4;
    c_128_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x1000zxx11x0xzxzx11z1zx10z0x1111xzxzxxzxxzxzxzzxxzxxxzxxzxxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
