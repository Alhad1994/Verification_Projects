class c_7_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_7_4;
    c_7_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x10x1111zxz1z110xx11zz00xz001x0zxxxxzzxzzzzxxxzxxzxzzxzzxzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
