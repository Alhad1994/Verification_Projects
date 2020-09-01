class c_145_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_145_1;
    c_145_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "z1z001z0x1001zz1010x110xzz0z010zxxzxxzzxzxzxzxxxxzxzzxzxzxzzzxxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
