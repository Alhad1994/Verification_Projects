class c_71_4;
    bit[25:0] clk_freq = 26'hf4240;

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_71_4;
    c_71_4 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xx101z110xz110011z1x100z00x11zzxzzzzzzxxxzzxzzxzzzxzzzzxzxxxxxzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
