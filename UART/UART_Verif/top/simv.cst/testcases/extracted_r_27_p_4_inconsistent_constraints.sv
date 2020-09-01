class c_27_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_27_4;
    c_27_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x10z11zz11x0xz1zx1zzxx101z00xxzxzxzxzzzzzzzzzxzzzxzxzxzxxxxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
