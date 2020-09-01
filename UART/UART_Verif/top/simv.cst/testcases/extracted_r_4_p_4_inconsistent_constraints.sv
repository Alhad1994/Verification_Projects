class c_4_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_4_4;
    c_4_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz1x001zzzz0zzxzx00z10101z1x11zzzzxxxzxxzzzxzzzxxxxzxxzzzzxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
