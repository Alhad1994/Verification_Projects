class c_21_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_21_1;
    c_21_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "x0x010xxx0xzxz0000001xxz00001z11zzxzzxxxxzxzxzzxxxzzxzxzzzzxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
