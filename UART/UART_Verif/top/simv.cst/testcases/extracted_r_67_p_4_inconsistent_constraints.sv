class c_67_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_67_4;
    c_67_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1010z1zxx10z011z00001z1xzx00z0xzzzzxxzzxzzzxzxxxxxxzxxzzzzzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
