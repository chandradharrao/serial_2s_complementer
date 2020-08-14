// Code your design here
module serial_2_comp(comp_reg, num, load, rst, carry, clk);
  output reg[3:0]comp_reg;			//register for storing final result
  output reg carry;					//register for storing internal carry
  input [3:0]num;					
  input load, rst, clk;
  
  always@(posedge clk, negedge rst) begin	//asynchronous reset 
    if(!rst) begin
      comp_reg <= 4'b0000;
      carry <= 1'b1;
    end
    else if(load) begin						//loadind no to be complimented	
      comp_reg <= num;
    end
    else begin								//behavioural design
      case({comp_reg[0], carry})
        2'b00: begin
          comp_reg[3:0] <= {1'b1, comp_reg[3:1]};
          carry <= 1'b0;
        end
        2'b01: begin
          comp_reg[3:0] <= {1'b0, comp_reg[3:1]};
          carry <= 1'b1;
        end
        2'b10: begin
          comp_reg[3:0] <= {1'b0, comp_reg[3:1]};
          carry <= 1'b0;
        end
        2'b11: begin
          comp_reg[3:0] <= {1'b1, comp_reg[3:1]};
          carry <= 1'b0;
        end
      endcase
    end
  end
endmodule