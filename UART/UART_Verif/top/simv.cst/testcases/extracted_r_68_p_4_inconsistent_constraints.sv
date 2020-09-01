class c_68_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_68_4;
    c_68_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx1xzz0x0zx101x0xz10xzxzx011zz0xzzzzzxxzxxzxxzxxzzzxzzxxxzzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
