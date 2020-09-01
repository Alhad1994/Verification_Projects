class c_132_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_132_1;
    c_132_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xzxx0z01zx111010zzz1xzzx01zzz01xzxxzzzxxxzxzzxzxxzxxzxzzxzxzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
