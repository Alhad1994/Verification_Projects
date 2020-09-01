class c_124_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_124_1;
    c_124_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z0x11z01xxx00zxxx0010x1xxx1zx1xzxxxxxzzxxxzzxzzzxzxzxxxxxzzzxxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
