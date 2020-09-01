class c_167_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_167_4;
    c_167_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "111xxzzx100xxxz1xzx0zz11x1xz0z1xzxzzzxzxzxzxxxzzxxzzxzxxzzxzxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
