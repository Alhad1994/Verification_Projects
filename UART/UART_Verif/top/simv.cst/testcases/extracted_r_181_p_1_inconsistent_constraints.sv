class c_181_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_181_1;
    c_181_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x1z1xx1zxz00zx10z1x0zx0zz0zzx1zzzxzxzzzzxzzzxzxxxxxxzxzxxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
