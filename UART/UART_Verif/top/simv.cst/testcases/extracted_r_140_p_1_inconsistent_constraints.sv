class c_140_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_140_1;
    c_140_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "01xxzzxz1z1z1z10111z00xz1x01x1zzzzxxzzzxxxxzxxzxzzxzxzzxzzxxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
