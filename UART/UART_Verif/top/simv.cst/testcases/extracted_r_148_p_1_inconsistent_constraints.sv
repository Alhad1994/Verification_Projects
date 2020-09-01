class c_148_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_148_1;
    c_148_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx11zxzxzzzxx10zzx1z101z11z0zx1xxxzzxzzxzxxzzzxxxxzxxzzxxzzzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
