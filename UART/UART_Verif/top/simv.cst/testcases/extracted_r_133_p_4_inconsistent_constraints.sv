class c_133_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_133_4;
    c_133_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1111xzzxzzxzx00z1x0000zxx10x0x0xzxzxzzxzxzzzzzxxzxzzzxxxzxxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
