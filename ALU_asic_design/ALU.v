// 
// Politecnico di Milano
// Code created using PandA - Version: PandA 0.9.7 - Revision 8b59b7ac7b9ab30cd20960921ab47ea5009163f1-main - Date 2026-02-22T19:26:07
// /tmp/.mount_bambu-FllZqR/usr/bin/bambu executed with: /tmp/.mount_bambu-FllZqR/usr/bin/bambu --top-fname=ALU ALU.c 
// 
// Send any bug to: panda-info@polimi.it
// ************************************************************************
// The following text holds for all the components tagged with PANDA_LGPLv3.
// They are all part of the BAMBU/PANDA IP LIBRARY.
// This library is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public
// License as published by the Free Software Foundation; either
// version 3 of the License, or (at your option) any later version.
// 
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
// Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public
// License along with the PandA framework; see the files COPYING.LIB
// If not, see <http://www.gnu.org/licenses/>.
// ************************************************************************

`ifdef __ICARUS__
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VERILATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef MODEL_TECH
  `define _SIM_HAVE_CLOG2
`endif
`ifdef VCS
  `define _SIM_HAVE_CLOG2
`endif
`ifdef NCVERILOG
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_SIMULATOR
  `define _SIM_HAVE_CLOG2
`endif
`ifdef XILINX_ISIM
  `define _SIM_HAVE_CLOG2
`endif

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module constant_value(out1);
  parameter BITSIZE_out1=1,
    value=1'b0;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = value;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module register_STD(clock,
  reset,
  in1,
  wenable,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input [BITSIZE_in1-1:0] in1;
  input wenable;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg [BITSIZE_out1-1:0] reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock)
    reg_out1 <= in1;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module IUdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){in1[BITSIZE_in1-1]}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module UIdata_converter_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
  if (BITSIZE_out1 <= BITSIZE_in1)
  begin
    assign out1 = in1[BITSIZE_out1-1:0];
  end
  else
  begin
    assign out1 = {{(BITSIZE_out1-BITSIZE_in1){1'b0}},in1};
  end
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2016-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lut_expr_FU(in1,
  in2,
  in3,
  in4,
  in5,
  in6,
  in7,
  in8,
  in9,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input in2;
  input in3;
  input in4;
  input in5;
  input in6;
  input in7;
  input in8;
  input in9;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  reg[7:0] cleaned_in0;
  wire [7:0] in0;
  wire[BITSIZE_in1-1:0] shifted_s;
  assign in0 = {in9, in8, in7, in6, in5, in4, in3, in2};
  generate
    genvar i0;
    for (i0=0; i0<8; i0=i0+1)
    begin : L0
          always @(*)
          begin
             if (in0[i0] == 1'b1)
                cleaned_in0[i0] = 1'b1;
             else
                cleaned_in0[i0] = 1'b0;
          end
    end
  endgenerate
  assign shifted_s = in1 >> cleaned_in0;
  assign out1[0] = shifted_s[0];
  generate
     if(BITSIZE_out1 > 1)
       assign out1[BITSIZE_out1-1:1] = 0;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module multi_read_cond_FU(in1,
  out1);
  parameter BITSIZE_in1=1, PORTSIZE_in1=2,
    BITSIZE_out1=1;
  // IN
  input [(PORTSIZE_in1*BITSIZE_in1)+(-1):0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_and_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 & in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_ior_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 | in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module bit_xor_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 ^ in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module cond_expr_FU(in1,
  in2,
  in3,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_in3=1,
    BITSIZE_out1=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  input signed [BITSIZE_in3-1:0] in3;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 != 0 ? in2 : in3;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module eq_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1 == in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module lshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 <<< in2[arg2_bitsize-1:0];
    else
      assign out1 = in1 <<< in2;
  endgenerate
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module minus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 - in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module mult_expr_FU(clock,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PIPE_PARAMETER=0;
  // IN
  input clock;
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  generate
    if(PIPE_PARAMETER==1)
    begin
      reg signed [BITSIZE_out1-1:0] out1_reg;
      assign out1 = out1_reg;
      always @(posedge clock)
      begin
        out1_reg <= in1 * in2;
      end
    end
    else if(PIPE_PARAMETER>1)
    begin
      reg signed [BITSIZE_in1-1:0] in1_in;
      reg signed [BITSIZE_in2-1:0] in2_in;
      wire signed [BITSIZE_out1-1:0] mult_res;
      reg signed [BITSIZE_out1-1:0] mul [PIPE_PARAMETER-2:0];
      integer i;
      assign mult_res = in1_in * in2_in;
      always @(posedge clock)
      begin
        in1_in <= in1;
        in2_in <= in2;
        mul[PIPE_PARAMETER-2] <= mult_res;
        for (i=0; i<PIPE_PARAMETER-2; i=i+1)
          mul[i] <= mul[i+1];
      end
      assign out1 = mul[0];
    end
    else
    begin
      assign out1 = in1 * in2;
    end
    endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module plus_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  input signed [BITSIZE_in2-1:0] in2;
  // OUT
  output signed [BITSIZE_out1-1:0] out1;
  assign out1 = in1 + in2;
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module ui_rshift_expr_FU(in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1,
    PRECISION=1;
  // IN
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  `ifndef _SIM_HAVE_CLOG2
    function integer log2;
       input integer value;
       integer temp_value;
      begin
        temp_value = value-1;
        for (log2=0; temp_value>0; log2=log2+1)
          temp_value = temp_value>>1;
      end
    endfunction
  `endif
  `ifdef _SIM_HAVE_CLOG2
    parameter arg2_bitsize = $clog2(PRECISION);
  `else
    parameter arg2_bitsize = log2(PRECISION);
  `endif
  generate
    if(BITSIZE_in2 > arg2_bitsize)
      assign out1 = in1 >> (in2[arg2_bitsize-1:0]);
    else
      assign out1 = in1 >> in2;
  endgenerate

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>, Christian Pilato <christian.pilato@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module MUX_GATE(sel,
  in1,
  in2,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_in2=1,
    BITSIZE_out1=1;
  // IN
  input sel;
  input [BITSIZE_in1-1:0] in1;
  input [BITSIZE_in2-1:0] in2;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = sel ? in1 : in2;
endmodule

// Datapath RTL description for ALU
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module datapath_ALU(clock,
  reset,
  in_port_x,
  in_port_y,
  in_port_select,
  return_port,
  selector_MUX_46_gimple_return_FU_13_i0_0_0_0,
  wrenable_reg_0,
  OUT_MULTIIF_ALU_33672_33854);
  // IN
  input clock;
  input reset;
  input signed [31:0] in_port_x;
  input signed [31:0] in_port_y;
  input signed [31:0] in_port_select;
  input selector_MUX_46_gimple_return_FU_13_i0_0_0_0;
  input wrenable_reg_0;
  // OUT
  output signed [31:0] return_port;
  output OUT_MULTIIF_ALU_33672_33854;
  // Component and signal declarations
  wire [31:0] out_IUdata_converter_FU_2_i0_fu_ALU_33672_33750;
  wire [31:0] out_MUX_46_gimple_return_FU_13_i0_0_0_0;
  wire signed [31:0] out_UIdata_converter_FU_3_i0_fu_ALU_33672_33752;
  wire signed [31:0] out_bit_and_expr_FU_32_32_32_14_i0_fu_ALU_33672_33726;
  wire signed [31:0] out_bit_ior_expr_FU_32_32_32_15_i0_fu_ALU_33672_33732;
  wire signed [31:0] out_bit_xor_expr_FU_32_32_32_16_i0_fu_ALU_33672_33738;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_17_i0_fu_ALU_33672_33866;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_17_i1_fu_ALU_33672_33869;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_17_i2_fu_ALU_33672_33872;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_17_i3_fu_ALU_33672_33875;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_17_i4_fu_ALU_33672_33878;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_17_i5_fu_ALU_33672_33881;
  wire signed [31:0] out_cond_expr_FU_32_32_32_32_17_i6_fu_ALU_33672_33884;
  wire out_const_0;
  wire [1:0] out_const_1;
  wire [3:0] out_const_10;
  wire [4:0] out_const_11;
  wire [6:0] out_const_12;
  wire [8:0] out_const_13;
  wire [16:0] out_const_14;
  wire [32:0] out_const_15;
  wire [2:0] out_const_2;
  wire [3:0] out_const_3;
  wire [3:0] out_const_4;
  wire [2:0] out_const_5;
  wire [3:0] out_const_6;
  wire [3:0] out_const_7;
  wire out_const_8;
  wire [2:0] out_const_9;
  wire out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779;
  wire out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781;
  wire out_eq_expr_FU_32_0_32_20_i0_fu_ALU_33672_33783;
  wire out_eq_expr_FU_32_0_32_21_i0_fu_ALU_33672_33785;
  wire out_eq_expr_FU_32_0_32_22_i0_fu_ALU_33672_33787;
  wire out_eq_expr_FU_32_0_32_23_i0_fu_ALU_33672_33789;
  wire out_eq_expr_FU_32_0_32_24_i0_fu_ALU_33672_33791;
  wire out_eq_expr_FU_32_0_32_25_i0_fu_ALU_33672_33793;
  wire signed [31:0] out_lshift_expr_FU_32_32_32_26_i0_fu_ALU_33672_33744;
  wire out_lut_expr_FU_10_i0_fu_ALU_33672_33853;
  wire out_lut_expr_FU_11_i0_fu_ALU_33672_33863;
  wire out_lut_expr_FU_4_i0_fu_ALU_33672_33803;
  wire out_lut_expr_FU_5_i0_fu_ALU_33672_33813;
  wire out_lut_expr_FU_6_i0_fu_ALU_33672_33823;
  wire out_lut_expr_FU_7_i0_fu_ALU_33672_33833;
  wire out_lut_expr_FU_8_i0_fu_ALU_33672_33843;
  wire out_lut_expr_FU_9_i0_fu_ALU_33672_33904;
  wire signed [31:0] out_minus_expr_FU_32_32_32_27_i0_fu_ALU_33672_33714;
  wire signed [31:0] out_mult_expr_FU_32_32_32_0_28_i0_fu_ALU_33672_33720;
  wire out_multi_read_cond_FU_12_i0_fu_ALU_33672_33854;
  wire signed [31:0] out_plus_expr_FU_32_32_32_29_i0_fu_ALU_33672_33702;
  wire [31:0] out_reg_0_reg_0;
  wire [31:0] out_ui_rshift_expr_FU_32_32_32_30_i0_fu_ALU_33672_33751;
  
  MUX_GATE #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) MUX_46_gimple_return_FU_13_i0_0_0_0 (.out1(out_MUX_46_gimple_return_FU_13_i0_0_0_0),
    .sel(selector_MUX_46_gimple_return_FU_13_i0_0_0_0),
    .in1(out_reg_0_reg_0),
    .in2(out_mult_expr_FU_32_32_32_0_28_i0_fu_ALU_33672_33720));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b0)) const_0 (.out1(out_const_0));
  constant_value #(.BITSIZE_out1(2),
    .value(2'b01)) const_1 (.out1(out_const_1));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b1000)) const_10 (.out1(out_const_10));
  constant_value #(.BITSIZE_out1(5),
    .value(5'b10000)) const_11 (.out1(out_const_11));
  constant_value #(.BITSIZE_out1(7),
    .value(7'b1000000)) const_12 (.out1(out_const_12));
  constant_value #(.BITSIZE_out1(9),
    .value(9'b100000000)) const_13 (.out1(out_const_13));
  constant_value #(.BITSIZE_out1(17),
    .value(17'b10000000000000000)) const_14 (.out1(out_const_14));
  constant_value #(.BITSIZE_out1(33),
    .value(33'b100000000000000000000000000000000)) const_15 (.out1(out_const_15));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b010)) const_2 (.out1(out_const_2));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0100)) const_3 (.out1(out_const_3));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0101)) const_4 (.out1(out_const_4));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b011)) const_5 (.out1(out_const_5));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0110)) const_6 (.out1(out_const_6));
  constant_value #(.BITSIZE_out1(4),
    .value(4'b0111)) const_7 (.out1(out_const_7));
  constant_value #(.BITSIZE_out1(1),
    .value(1'b1)) const_8 (.out1(out_const_8));
  constant_value #(.BITSIZE_out1(3),
    .value(3'b100)) const_9 (.out1(out_const_9));
  plus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33702 (.out1(out_plus_expr_FU_32_32_32_29_i0_fu_ALU_33672_33702),
    .in1(in_port_x),
    .in2(in_port_y));
  minus_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33714 (.out1(out_minus_expr_FU_32_32_32_27_i0_fu_ALU_33672_33714),
    .in1(in_port_x),
    .in2(in_port_y));
  mult_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PIPE_PARAMETER(0)) fu_ALU_33672_33720 (.out1(out_mult_expr_FU_32_32_32_0_28_i0_fu_ALU_33672_33720),
    .clock(clock),
    .in1(in_port_x),
    .in2(in_port_y));
  bit_and_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33726 (.out1(out_bit_and_expr_FU_32_32_32_14_i0_fu_ALU_33672_33726),
    .in1(in_port_x),
    .in2(in_port_y));
  bit_ior_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33732 (.out1(out_bit_ior_expr_FU_32_32_32_15_i0_fu_ALU_33672_33732),
    .in1(in_port_x),
    .in2(in_port_y));
  bit_xor_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33738 (.out1(out_bit_xor_expr_FU_32_32_32_16_i0_fu_ALU_33672_33738),
    .in1(in_port_x),
    .in2(in_port_y));
  lshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_ALU_33672_33744 (.out1(out_lshift_expr_FU_32_32_32_26_i0_fu_ALU_33672_33744),
    .in1(in_port_x),
    .in2(in_port_y));
  IUdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33750 (.out1(out_IUdata_converter_FU_2_i0_fu_ALU_33672_33750),
    .in1(in_port_x));
  ui_rshift_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(32),
    .BITSIZE_out1(32),
    .PRECISION(32)) fu_ALU_33672_33751 (.out1(out_ui_rshift_expr_FU_32_32_32_30_i0_fu_ALU_33672_33751),
    .in1(out_IUdata_converter_FU_2_i0_fu_ALU_33672_33750),
    .in2(in_port_y));
  UIdata_converter_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33752 (.out1(out_UIdata_converter_FU_3_i0_fu_ALU_33672_33752),
    .in1(out_ui_rshift_expr_FU_32_32_32_30_i0_fu_ALU_33672_33751));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(1),
    .BITSIZE_out1(1)) fu_ALU_33672_33779 (.out1(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in1(in_port_select),
    .in2(out_const_0));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(2),
    .BITSIZE_out1(1)) fu_ALU_33672_33781 (.out1(out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781),
    .in1(in_port_select),
    .in2(out_const_1));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_ALU_33672_33783 (.out1(out_eq_expr_FU_32_0_32_20_i0_fu_ALU_33672_33783),
    .in1(in_port_select),
    .in2(out_const_2));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(3),
    .BITSIZE_out1(1)) fu_ALU_33672_33785 (.out1(out_eq_expr_FU_32_0_32_21_i0_fu_ALU_33672_33785),
    .in1(in_port_select),
    .in2(out_const_5));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_ALU_33672_33787 (.out1(out_eq_expr_FU_32_0_32_22_i0_fu_ALU_33672_33787),
    .in1(in_port_select),
    .in2(out_const_3));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_ALU_33672_33789 (.out1(out_eq_expr_FU_32_0_32_23_i0_fu_ALU_33672_33789),
    .in1(in_port_select),
    .in2(out_const_4));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_ALU_33672_33791 (.out1(out_eq_expr_FU_32_0_32_24_i0_fu_ALU_33672_33791),
    .in1(in_port_select),
    .in2(out_const_6));
  eq_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_in2(4),
    .BITSIZE_out1(1)) fu_ALU_33672_33793 (.out1(out_eq_expr_FU_32_0_32_25_i0_fu_ALU_33672_33793),
    .in1(in_port_select),
    .in2(out_const_7));
  lut_expr_FU #(.BITSIZE_in1(3),
    .BITSIZE_out1(1)) fu_ALU_33672_33803 (.out1(out_lut_expr_FU_4_i0_fu_ALU_33672_33803),
    .in1(out_const_9),
    .in2(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in3(out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(5),
    .BITSIZE_out1(1)) fu_ALU_33672_33813 (.out1(out_lut_expr_FU_5_i0_fu_ALU_33672_33813),
    .in1(out_const_11),
    .in2(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in3(out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781),
    .in4(out_eq_expr_FU_32_0_32_20_i0_fu_ALU_33672_33783),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(9),
    .BITSIZE_out1(1)) fu_ALU_33672_33823 (.out1(out_lut_expr_FU_6_i0_fu_ALU_33672_33823),
    .in1(out_const_13),
    .in2(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in3(out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781),
    .in4(out_eq_expr_FU_32_0_32_20_i0_fu_ALU_33672_33783),
    .in5(out_eq_expr_FU_32_0_32_21_i0_fu_ALU_33672_33785),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(17),
    .BITSIZE_out1(1)) fu_ALU_33672_33833 (.out1(out_lut_expr_FU_7_i0_fu_ALU_33672_33833),
    .in1(out_const_14),
    .in2(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in3(out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781),
    .in4(out_eq_expr_FU_32_0_32_20_i0_fu_ALU_33672_33783),
    .in5(out_eq_expr_FU_32_0_32_21_i0_fu_ALU_33672_33785),
    .in6(out_eq_expr_FU_32_0_32_22_i0_fu_ALU_33672_33787),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(33),
    .BITSIZE_out1(1)) fu_ALU_33672_33843 (.out1(out_lut_expr_FU_8_i0_fu_ALU_33672_33843),
    .in1(out_const_15),
    .in2(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in3(out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781),
    .in4(out_eq_expr_FU_32_0_32_20_i0_fu_ALU_33672_33783),
    .in5(out_eq_expr_FU_32_0_32_21_i0_fu_ALU_33672_33785),
    .in6(out_eq_expr_FU_32_0_32_22_i0_fu_ALU_33672_33787),
    .in7(out_eq_expr_FU_32_0_32_23_i0_fu_ALU_33672_33789),
    .in8(1'b0),
    .in9(1'b0));
  lut_expr_FU #(.BITSIZE_in1(4),
    .BITSIZE_out1(1)) fu_ALU_33672_33853 (.out1(out_lut_expr_FU_10_i0_fu_ALU_33672_33853),
    .in1(out_const_10),
    .in2(out_eq_expr_FU_32_0_32_24_i0_fu_ALU_33672_33791),
    .in3(out_lut_expr_FU_9_i0_fu_ALU_33672_33904),
    .in4(1'b0),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  multi_read_cond_FU #(.BITSIZE_in1(1),
    .PORTSIZE_in1(1),
    .BITSIZE_out1(1)) fu_ALU_33672_33854 (.out1(out_multi_read_cond_FU_12_i0_fu_ALU_33672_33854),
    .in1({out_lut_expr_FU_5_i0_fu_ALU_33672_33813}));
  lut_expr_FU #(.BITSIZE_in1(7),
    .BITSIZE_out1(1)) fu_ALU_33672_33863 (.out1(out_lut_expr_FU_11_i0_fu_ALU_33672_33863),
    .in1(out_const_12),
    .in2(out_eq_expr_FU_32_0_32_24_i0_fu_ALU_33672_33791),
    .in3(out_eq_expr_FU_32_0_32_25_i0_fu_ALU_33672_33793),
    .in4(out_lut_expr_FU_9_i0_fu_ALU_33672_33904),
    .in5(1'b0),
    .in6(1'b0),
    .in7(1'b0),
    .in8(1'b0),
    .in9(1'b0));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(1),
    .BITSIZE_out1(32)) fu_ALU_33672_33866 (.out1(out_cond_expr_FU_32_32_32_32_17_i0_fu_ALU_33672_33866),
    .in1(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in2(out_plus_expr_FU_32_32_32_29_i0_fu_ALU_33672_33702),
    .in3(out_const_0));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33869 (.out1(out_cond_expr_FU_32_32_32_32_17_i1_fu_ALU_33672_33869),
    .in1(out_lut_expr_FU_4_i0_fu_ALU_33672_33803),
    .in2(out_minus_expr_FU_32_32_32_27_i0_fu_ALU_33672_33714),
    .in3(out_cond_expr_FU_32_32_32_32_17_i0_fu_ALU_33672_33866));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33872 (.out1(out_cond_expr_FU_32_32_32_32_17_i2_fu_ALU_33672_33872),
    .in1(out_lut_expr_FU_6_i0_fu_ALU_33672_33823),
    .in2(out_bit_and_expr_FU_32_32_32_14_i0_fu_ALU_33672_33726),
    .in3(out_cond_expr_FU_32_32_32_32_17_i1_fu_ALU_33672_33869));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33875 (.out1(out_cond_expr_FU_32_32_32_32_17_i3_fu_ALU_33672_33875),
    .in1(out_lut_expr_FU_7_i0_fu_ALU_33672_33833),
    .in2(out_bit_ior_expr_FU_32_32_32_15_i0_fu_ALU_33672_33732),
    .in3(out_cond_expr_FU_32_32_32_32_17_i2_fu_ALU_33672_33872));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33878 (.out1(out_cond_expr_FU_32_32_32_32_17_i4_fu_ALU_33672_33878),
    .in1(out_lut_expr_FU_8_i0_fu_ALU_33672_33843),
    .in2(out_bit_xor_expr_FU_32_32_32_16_i0_fu_ALU_33672_33738),
    .in3(out_cond_expr_FU_32_32_32_32_17_i3_fu_ALU_33672_33875));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33881 (.out1(out_cond_expr_FU_32_32_32_32_17_i5_fu_ALU_33672_33881),
    .in1(out_lut_expr_FU_10_i0_fu_ALU_33672_33853),
    .in2(out_lshift_expr_FU_32_32_32_26_i0_fu_ALU_33672_33744),
    .in3(out_cond_expr_FU_32_32_32_32_17_i4_fu_ALU_33672_33878));
  cond_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_in2(32),
    .BITSIZE_in3(32),
    .BITSIZE_out1(32)) fu_ALU_33672_33884 (.out1(out_cond_expr_FU_32_32_32_32_17_i6_fu_ALU_33672_33884),
    .in1(out_lut_expr_FU_11_i0_fu_ALU_33672_33863),
    .in2(out_UIdata_converter_FU_3_i0_fu_ALU_33672_33752),
    .in3(out_cond_expr_FU_32_32_32_32_17_i5_fu_ALU_33672_33881));
  lut_expr_FU #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) fu_ALU_33672_33904 (.out1(out_lut_expr_FU_9_i0_fu_ALU_33672_33904),
    .in1(out_const_8),
    .in2(out_eq_expr_FU_32_0_32_18_i0_fu_ALU_33672_33779),
    .in3(out_eq_expr_FU_32_0_32_19_i0_fu_ALU_33672_33781),
    .in4(out_eq_expr_FU_32_0_32_20_i0_fu_ALU_33672_33783),
    .in5(out_eq_expr_FU_32_0_32_21_i0_fu_ALU_33672_33785),
    .in6(out_eq_expr_FU_32_0_32_22_i0_fu_ALU_33672_33787),
    .in7(out_eq_expr_FU_32_0_32_23_i0_fu_ALU_33672_33789),
    .in8(1'b0),
    .in9(1'b0));
  register_STD #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) reg_0 (.out1(out_reg_0_reg_0),
    .clock(clock),
    .reset(reset),
    .in1(out_cond_expr_FU_32_32_32_32_17_i6_fu_ALU_33672_33884),
    .wenable(wrenable_reg_0));
  // io-signal post fix
  assign return_port = out_MUX_46_gimple_return_FU_13_i0_0_0_0;
  assign OUT_MULTIIF_ALU_33672_33854 = out_multi_read_cond_FU_12_i0_fu_ALU_33672_33854;

endmodule

// FSM based controller description for ALU
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module controller_ALU(done_port,
  selector_MUX_46_gimple_return_FU_13_i0_0_0_0,
  wrenable_reg_0,
  OUT_MULTIIF_ALU_33672_33854,
  clock,
  reset,
  start_port);
  // IN
  input OUT_MULTIIF_ALU_33672_33854;
  input clock;
  input reset;
  input start_port;
  // OUT
  output done_port;
  output selector_MUX_46_gimple_return_FU_13_i0_0_0_0;
  output wrenable_reg_0;
  parameter [2:0] S_0 = 3'b001,
    S_2 = 3'b100,
    S_1 = 3'b010;
  reg [2:0] _present_state=S_0, _next_state;
  reg done_port;
  reg selector_MUX_46_gimple_return_FU_13_i0_0_0_0;
  reg wrenable_reg_0;
  
  always @(posedge clock)
    if (reset == 1'b0) _present_state <= S_0;
    else _present_state <= _next_state;
  
  always @(*)
  begin
    done_port = 1'b0;
    selector_MUX_46_gimple_return_FU_13_i0_0_0_0 = 1'b0;
    wrenable_reg_0 = 1'b0;
    case (_present_state)
      S_0 :
        if(start_port == 1'b1)
        begin
          wrenable_reg_0 = 1'b1;
          casez (OUT_MULTIIF_ALU_33672_33854)
            1'b1 :
              begin
                _next_state = S_1;
                done_port = 1'b1;
                wrenable_reg_0 = 1'b0;
              end
            default:
              begin
                _next_state = S_2;
                done_port = 1'b1;
              end
          endcase
        end
        else
        begin
          _next_state = S_0;
        end
      S_2 :
        begin
          selector_MUX_46_gimple_return_FU_13_i0_0_0_0 = 1'b1;
          _next_state = S_0;
        end
      S_1 :
        begin
          _next_state = S_0;
        end
      default :
        begin
          _next_state = S_0;
        end
    endcase
  end
endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Marco Lattuada <marco.lattuada@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module flipflop_AR(clock,
  reset,
  in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input clock;
  input reset;
  input in1;
  // OUT
  output out1;
  
  reg reg_out1 =0;
  assign out1 = reg_out1;
  always @(posedge clock )
    if (reset == 1'b0)
      reg_out1 <= {BITSIZE_out1{1'b0}};
    else
      reg_out1 <= in1;
endmodule

// Top component for ALU
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module _ALU(clock,
  reset,
  start_port,
  done_port,
  x,
  y,
  select,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input signed [31:0] x;
  input signed [31:0] y;
  input signed [31:0] select;
  // OUT
  output done_port;
  output signed [31:0] return_port;
  // Component and signal declarations
  wire OUT_MULTIIF_ALU_33672_33854;
  wire done_delayed_REG_signal_in;
  wire done_delayed_REG_signal_out;
  wire selector_MUX_46_gimple_return_FU_13_i0_0_0_0;
  wire wrenable_reg_0;
  
  controller_ALU Controller_i (.done_port(done_delayed_REG_signal_in),
    .selector_MUX_46_gimple_return_FU_13_i0_0_0_0(selector_MUX_46_gimple_return_FU_13_i0_0_0_0),
    .wrenable_reg_0(wrenable_reg_0),
    .OUT_MULTIIF_ALU_33672_33854(OUT_MULTIIF_ALU_33672_33854),
    .clock(clock),
    .reset(reset),
    .start_port(start_port));
  datapath_ALU Datapath_i (.return_port(return_port),
    .OUT_MULTIIF_ALU_33672_33854(OUT_MULTIIF_ALU_33672_33854),
    .clock(clock),
    .reset(reset),
    .in_port_x(x),
    .in_port_y(y),
    .in_port_select(select),
    .selector_MUX_46_gimple_return_FU_13_i0_0_0_0(selector_MUX_46_gimple_return_FU_13_i0_0_0_0),
    .wrenable_reg_0(wrenable_reg_0));
  flipflop_AR #(.BITSIZE_in1(1),
    .BITSIZE_out1(1)) done_delayed_REG (.out1(done_delayed_REG_signal_out),
    .clock(clock),
    .reset(reset),
    .in1(done_delayed_REG_signal_in));
  // io-signal post fix
  assign done_port = done_delayed_REG_signal_out;

endmodule

// This component is part of the BAMBU/PANDA IP LIBRARY
// Copyright (C) 2004-2022 Politecnico di Milano
// Author(s): Fabrizio Ferrandi <fabrizio.ferrandi@polimi.it>
// License: PANDA_LGPLv3
`timescale 1ns / 1ps
module view_convert_expr_FU(in1,
  out1);
  parameter BITSIZE_in1=1,
    BITSIZE_out1=1;
  // IN
  input signed [BITSIZE_in1-1:0] in1;
  // OUT
  output [BITSIZE_out1-1:0] out1;
  assign out1 = in1;
endmodule

// Minimal interface for function: ALU
// This component has been derived from the input source code and so it does not fall under the copyright of PandA framework, but it follows the input source code copyright, and may be aggregated with components of the BAMBU/PANDA IP LIBRARY.
// Author(s): Component automatically generated by bambu
// License: THIS COMPONENT IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
`timescale 1ns / 1ps
module ALU(clock,
  reset,
  start_port,
  x,
  y,
  select,
  done_port,
  return_port);
  // IN
  input clock;
  input reset;
  input start_port;
  input [31:0] x;
  input [31:0] y;
  input [31:0] select;
  // OUT
  output done_port;
  output [31:0] return_port;
  // Component and signal declarations
  wire signed [31:0] out_return_port_view_convert_expr_FU;
  
  _ALU _ALU_i0 (.done_port(done_port),
    .return_port(out_return_port_view_convert_expr_FU),
    .clock(clock),
    .reset(reset),
    .start_port(start_port),
    .x(x),
    .y(y),
    .select(select));
  view_convert_expr_FU #(.BITSIZE_in1(32),
    .BITSIZE_out1(32)) return_port_view_convert_expr_FU (.out1(return_port),
    .in1(out_return_port_view_convert_expr_FU));

endmodule

