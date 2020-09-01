class c_119_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_119_1;
    c_119_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "100zxzzzz0z1zx1zxx0z0x11zx1zzxzzzxzzzzzxxxxxxxzxzzzxzxzzzzxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
