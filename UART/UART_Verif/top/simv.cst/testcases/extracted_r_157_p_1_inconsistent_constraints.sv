class c_157_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_157_1;
    c_157_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzz010x1xxx111z00zzx10x1111x11xxxxxzzzzxzzzxzzxzzzxzzzzxzzxxzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
