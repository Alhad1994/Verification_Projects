class c_42_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_42_1;
    c_42_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "1xzzx1zx11111zx0zx0zzx0xx00x1xx1xxzxxxxxzxzzzzzzzzzxxxzzzzxxxzxx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
