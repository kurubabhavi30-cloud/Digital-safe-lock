module digital_safe_lock(
    input clk,
    input reset,
    input [3:0] password,
    output reg unlock
);

parameter CORRECT_PASSWORD = 4'b1010;

always @(posedge clk or posedge reset)
begin
    if(reset)
        unlock <= 0;
    else
    begin
        if(password == CORRECT_PASSWORD)
            unlock <= 1;
        else
            unlock <= 0;
    end
end

endmodule