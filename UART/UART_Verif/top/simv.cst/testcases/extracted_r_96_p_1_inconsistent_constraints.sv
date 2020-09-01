class c_96_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_96_1;
    c_96_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "10xzxz0xx110zzx000xz1011x011x1zxzxxxzzzzxzzxxzxzxzzzxxzzxzxzzzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
