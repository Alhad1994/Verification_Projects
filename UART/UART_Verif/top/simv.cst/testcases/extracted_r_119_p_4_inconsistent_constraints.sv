class c_119_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_119_4;
    c_119_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0111x001zz0x1z0000xzzz0x110xxxzzxzxzxzzzxxxzzxxzzzzzzxxxxzzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
