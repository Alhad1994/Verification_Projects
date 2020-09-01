class c_56_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_56_4;
    c_56_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0z0z00x10110z11z00xxxz1z10xz0xzzxxxxzzzxxzzxzzzzzzzxzxzxzzxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
