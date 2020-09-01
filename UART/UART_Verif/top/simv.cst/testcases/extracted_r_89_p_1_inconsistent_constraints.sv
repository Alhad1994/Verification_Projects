class c_89_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_89_1;
    c_89_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zz1xz01zxxx0zzzzx000xz0z0001zz0xzxzxzxzxxxzzxxzzzxzxzxzzzzxzzxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
