class c_156_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_156_1;
    c_156_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zzxz0zx0xxz0111111x101x1xzxx01zzzzxxxzzxzzxxzxzzzxxzzxxzzxxzzxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
