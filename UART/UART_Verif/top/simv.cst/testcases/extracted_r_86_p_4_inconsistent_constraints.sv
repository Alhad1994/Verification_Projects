class c_86_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_86_4;
    c_86_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01xz1000xz1xxzzxx1z1xzxxxx10x0xxxxzzxzxzzxxzzxzxxzxxxzxxxzxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
