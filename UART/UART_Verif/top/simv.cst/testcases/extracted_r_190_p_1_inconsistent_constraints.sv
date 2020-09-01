class c_190_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_190_1;
    c_190_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1010z0xx00xz1110zz0xz1xzxzz110zzxxzzxxzzxxxxxzzxxxxxzxzzxzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
