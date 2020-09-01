class c_66_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_66_1;
    c_66_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z10111xx1001xzzx0000zzxx0xzx1110xzzxzzzzzxzzzzxzxxxzzzxxxzzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
