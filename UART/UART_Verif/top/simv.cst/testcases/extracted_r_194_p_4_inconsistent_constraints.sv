class c_194_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_194_4;
    c_194_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xxz0xx001x01101x010010zzxzz0xx0xzzxxxzzzzzxzzzzxxzzxzzxzxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
