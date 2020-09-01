class c_16_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_16_4;
    c_16_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0z10xxzxz011xz0110x00xx0x0xz0xxzzxzzxxxxzzzzzxxxzxxxzzzzxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
