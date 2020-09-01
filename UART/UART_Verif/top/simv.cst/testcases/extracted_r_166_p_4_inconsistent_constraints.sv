class c_166_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_166_4;
    c_166_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx0x1x1zz11zx101x111z0zz0z0z11zxzxzzxxzzzxzzxxzxxxxxzzxxzzxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
