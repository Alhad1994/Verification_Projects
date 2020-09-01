class c_47_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_47_4;
    c_47_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z00000zz010z0z1xzx01xxzzz10xx0x1zxzzzzxzxzxzzxzzzxxxxxxxxzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
