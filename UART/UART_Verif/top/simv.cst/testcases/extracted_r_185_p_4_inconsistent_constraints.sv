class c_185_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_185_4;
    c_185_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxxx10010z1z11xz101zx0z1zzzx01zxzzzxzxxzxxzxzzzxzxzxxzxzzzzzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
