class c_25_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_25_1;
    c_25_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1zx001x1zzzxzz0x1zzx110xx000x01xzzzzxzzxxzxxxxzzxxxxzzxzzxxxzzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
