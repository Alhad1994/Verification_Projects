class c_139_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_139_1;
    c_139_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xz0xx0x0zzx0zz1x01x1x0x0100x10xxzzzzxxzzzzzxzxxzxxzzxxxxxzxxzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
