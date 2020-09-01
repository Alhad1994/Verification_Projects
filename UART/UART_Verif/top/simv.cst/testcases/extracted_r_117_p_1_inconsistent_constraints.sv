class c_117_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_117_1;
    c_117_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "010100100z10101xxx1zxzxxxz11z0x1zzzzxzxxxzzxxxzxzzzxxzxzzzxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
