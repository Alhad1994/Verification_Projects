class c_5_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_5_4;
    c_5_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0x11100010xz0zxzx1x01xz1xx0011x0zxxzzxxzxxzzzxzzxxzxzzzxxxxzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
