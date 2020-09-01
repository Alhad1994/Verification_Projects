class c_155_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_155_1;
    c_155_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00011x111110z00xz11xx0xx0xxzxxzzxzzxzxxzzzzzzxzzxxxxxxzxzzxzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
