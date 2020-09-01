class c_99_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_99_4;
    c_99_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "011z0zx1x10x0zz00z01x1zz1zz10100xzzzzzzxxzxzxzxzxzzxzzxxzzzxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
