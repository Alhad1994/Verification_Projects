class c_92_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_92_4;
    c_92_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1x11z1011000x0xx0101x11x1x0zzx1xzzzzxzxxxzxzxxzxxzzzzxxxxxxxxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
