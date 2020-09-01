class c_126_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_126_4;
    c_126_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "101x01x1z0z0000x11zzx0xz0z1xxxzzzzxzxzxzzzzxzxxxxxxzxzxxxzzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
