class c_127_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_127_4;
    c_127_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzzzxx0xx11101x00xxz1zz01x01xz11xxzzxxxzzzxzxzxxxxzzzzzxxzzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
