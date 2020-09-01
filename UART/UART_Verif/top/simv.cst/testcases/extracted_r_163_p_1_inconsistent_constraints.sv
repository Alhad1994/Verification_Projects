class c_163_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_163_1;
    c_163_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z10xz11x1z10xxzzxz1zx101zzxx0011xzxzxxzzxxxzxxzzzzzzxxzxzxxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
