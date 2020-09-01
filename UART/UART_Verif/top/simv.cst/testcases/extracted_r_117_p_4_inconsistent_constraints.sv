class c_117_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_117_4;
    c_117_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1011x0x100xz0x0z00110xxx11000011zxzxxzzxxxzzzxxxzxzzxxzxzxxxzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
