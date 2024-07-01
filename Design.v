// Code your design here
module ALU(input bit clk,rst,input logic [7:0]A,B,input logic [3:0]ALU_Sel,output logic [15:0]ALU_out,output bit carryout);
  
  reg [8:0] tmp;
  reg [15:0] ALU_result;
  reg [15:0] ALU_out;
  
  always@(posedge clk) begin
    if(rst) begin
      ALU_out <= 16'd0;
      carryout <= 1'd0;
    end else begin
      ALU_out <= ALU_result;
      carryout <= tmp[8];
    end
  end
  
  always @(*) begin
    case(ALU_Sel)
      4'b0000:ALU_result = A +B;
      4'b0001:ALU_result = A - B;
      4'b0010:ALU_result = A * B;
      4'b0011:ALU_result = A/B;
      default:ALU_result = 8'hAC;
    endcase
  end
endmodule
      