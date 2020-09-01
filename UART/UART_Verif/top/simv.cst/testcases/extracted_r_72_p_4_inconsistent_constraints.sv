class c_72_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_72_4;
    c_72_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x110z1x0101011x01110z0xz000z11xxxzxzxzzxxzzxxxzzxzzzxxxzxzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
