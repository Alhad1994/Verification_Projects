class c_197_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_197_1;
    c_197_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00xxz11zz0xz00z010100000xxxzxxx0zxzxxzxxzxzxzzxxxxzxzzxzzxzxzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
