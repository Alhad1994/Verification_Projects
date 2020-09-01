class c_11_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_11_4;
    c_11_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zz11zz000x10zzz10zx00z0110100xxzzxzzxzzxzzzxzxzxzzzzxzzxxzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
