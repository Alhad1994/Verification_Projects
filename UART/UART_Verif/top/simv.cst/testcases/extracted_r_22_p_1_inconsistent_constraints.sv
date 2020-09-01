class c_22_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_22_1;
    c_22_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xzxzz0x0z01zx11xz1zzzxzx01010zzzzzxxzzzzzzxxzxxzzxzzxxxxxzxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
