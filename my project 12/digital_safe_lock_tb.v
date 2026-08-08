`timescale 1ns/1ps

module digital_safe_lock_tb;

reg clk;
reg reset;
reg [3:0] password;

wire unlock;

digital_safe_lock uut(
    .clk(clk),
    .reset(reset),
    .password(password),
    .unlock(unlock)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    password = 4'b0000;

    #10;

    reset = 0;

    // Wrong Password
    password = 4'b0011;

    #10;

    // Correct Password
    password = 4'b1010;

    #10;

    // Wrong Password
    password = 4'b1111;

    #10;

    // Correct Password
    password = 4'b1010;

    #10;

    $finish;
end

initial
begin
    $display("Time\tPassword\tUnlock");
    $monitor("%0t\t%b\t\t%b",
              $time,password,unlock);
end

endmodule