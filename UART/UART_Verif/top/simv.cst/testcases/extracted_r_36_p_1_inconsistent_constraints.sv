class c_36_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_36_1;
    c_36_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0xx0zxzxzx001zx1z1zzz11z00zx0xz0zzzzxzxxxzzxzzxzxxzzzxzzxxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
