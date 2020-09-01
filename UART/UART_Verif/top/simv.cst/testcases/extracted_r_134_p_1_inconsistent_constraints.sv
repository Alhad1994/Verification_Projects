class c_134_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_134_1;
    c_134_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "100x10zxzx1zxxx100100xx1xzzx1z1zxxxzxxxxxxzxxxxzxzxzxxxxxzzzxxzz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
