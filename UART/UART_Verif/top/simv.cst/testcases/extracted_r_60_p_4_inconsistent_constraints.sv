class c_60_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_60_4;
    c_60_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzzzzx0x1z0z110z10xzxz0z0010zx00zzxxxzzxzxxxzzzzzzxzzxxxzzzzzxxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
