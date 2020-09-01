class c_138_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_138_1;
    c_138_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "11xzz1zz1x0xz1zz1x00x0zzzzxxxzz1xxxzxzxxxzxxxxzzxxzzxzzzzzxxzzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
