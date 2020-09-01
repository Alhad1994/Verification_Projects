class c_64_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_64_1;
    c_64_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxx100zx1zzxzzxzxzx00x1zz1100zx1zzxxxxxzxzxzzxzzzzzzzxzzzxxxxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
