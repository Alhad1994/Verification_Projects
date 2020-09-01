class c_88_1;
    rand bit[25:0] clk_freq; // rand_mode = ON 

    constraint freq_this    // (constraint_mode = ON) (./../seq/uart_tr.sv:27)
    {
       ((clk_freq[25]) == ((clk_freq[25]) + 5));
    }
endclass

program p_88_1;
    c_88_1 obj;
    string randState;

    initial
        begin
            obj = new;
            randState = "zxxx01xx1zxz0010z0xx0zxz0zxxz00xxzzzzxzxzzxzzxxxzzzzxzzxzzxxxzzx";
            obj.set_randstate(randState);
            obj.randomize();
        end
endprogram
