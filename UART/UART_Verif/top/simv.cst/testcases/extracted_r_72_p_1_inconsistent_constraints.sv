class c_72_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_72_1;
    c_72_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zx010x10001x101100001z0x0x011xxzxzzxxxxzzzzzxzzzxxzzzzxxxxzzzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
