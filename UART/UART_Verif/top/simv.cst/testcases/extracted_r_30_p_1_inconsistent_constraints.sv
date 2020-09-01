class c_30_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_30_1;
    c_30_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "00x1z0zzxz01xx111z1xxzz1zz1x0x01xxzxzxxxxzzzxxzxxzxzzxxzxxzzzzzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
