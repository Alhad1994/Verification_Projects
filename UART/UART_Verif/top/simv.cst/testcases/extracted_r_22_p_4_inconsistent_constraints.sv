class c_22_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_22_4;
    c_22_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11z1010xzxxzzxx1x0100xz001xxzzx1xxzxzxxzxxzxzzxxxzxzxxzzxxxxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
