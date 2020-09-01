class c_5_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_5_1;
    c_5_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx1000z0x1z1z0zz0zx00x0110xxx001xxxxxxxzxzxzzzzzxxzzxxxxzxxxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
