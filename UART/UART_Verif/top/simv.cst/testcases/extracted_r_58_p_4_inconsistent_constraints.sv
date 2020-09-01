class c_58_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_58_4;
    c_58_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1xxzz000xz01x100000z0x00x101z10xxzxzxxxzzxxzzzxxxzxxzxxzxzzxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
