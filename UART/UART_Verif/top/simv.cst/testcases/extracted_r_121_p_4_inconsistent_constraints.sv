class c_121_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_121_4;
    c_121_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x1111xzz0z1zx1x1100xxzx0z0101z1xxxxxxxxxxzzxxzxxzxzxxzzzxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
