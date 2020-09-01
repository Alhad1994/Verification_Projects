class c_177_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_177_1;
    c_177_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx0z1xxx0zzz1zzxzx1xx100z10xz110xxxxzxxxzxzzxzxzxxzxxzxzxzxzxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
