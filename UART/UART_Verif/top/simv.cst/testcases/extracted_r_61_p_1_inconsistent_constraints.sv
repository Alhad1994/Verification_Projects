class c_61_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_61_1;
    c_61_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "xxzz1zzx0xz1x001z1zx1zxxz10xz11zxxxzxzxzxxzxxxzzxxxzzxxzxzxxxzxz";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
