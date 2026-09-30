module fsm (
    input x,
    clk,
    rst,
    output reg y
);
  reg [2:0] state;
  localparam s0 = 3'b000;
  localparam s1 = 3'b001;
  localparam s2 = 3'b010;
  localparam s3 = 3'b011;
  localparam s4 = 3'b100;

  always @(posedge clk) begin
    y <= 1'b0;

    if (rst) begin
      state <= s0;
    end else
      case (state)
        s0: begin
          if (x) state <= s1;
          else state <= s0;
        end
        s1: begin
          if (x) state <= s1;
          else state <= s2;
        end
        s2: begin
          if (x) state <= s3;
          else state <= s0;
        end
        s3: begin
          if (x) begin
            state <= s4;
            y <= 1'b1;
          end else state <= s2;

        end
        s4: begin
          if (x) state <= s1;
          else state <= s2;

        end

        default: state <= s0;
      endcase

  end

endmodule
