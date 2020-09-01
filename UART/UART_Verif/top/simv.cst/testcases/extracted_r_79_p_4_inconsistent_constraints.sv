class c_79_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_79_4;
    c_79_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "110x100zx0zxzzzx1z010010z111z0x1xxxzzzxzzzzxzxzzxzzzxzxzzzxzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
