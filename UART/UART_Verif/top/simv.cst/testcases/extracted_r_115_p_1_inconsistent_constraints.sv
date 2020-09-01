class c_115_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_115_1;
    c_115_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "101xxxx1z1x010x0x0x1x10x11x1z1z1zzzzzzxzxzxzzzxxxzzxzzzzzzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
