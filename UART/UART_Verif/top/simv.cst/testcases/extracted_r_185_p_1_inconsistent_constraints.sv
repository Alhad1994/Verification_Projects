class c_185_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_185_1;
    c_185_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxx00xz0x0z1xzx0x10x1x10x111xz0zzzxzzxxxzzzzxxxxxxzzzxzzxxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
