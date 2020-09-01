class c_12_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_12_4;
    c_12_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01zzz111x1xz0x0zzxxxx11z0x1z1z01zxzxxzxzxzzzxxxzxxxzzzzzzzxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
