class c_99_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_99_1;
    c_99_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "0zx11101z00x1011z01z0xzxx0xx0xz1xxzxzxzzxxxxzzxxzxzxxxxzzxzxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
