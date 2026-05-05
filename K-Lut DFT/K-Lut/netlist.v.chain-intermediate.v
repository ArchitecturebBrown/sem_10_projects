

module BoundaryScanRegister_input
(
  din,
  dout,
  sin,
  sout,
  clock,
  reset,
  testing,
  shift
);

  input din;
  output dout;
  input sin;
  output sout;
  input clock;input reset;input testing;input shift;
  reg store;

  always @(posedge clock or posedge reset) begin
    if(reset) begin
      store <= 1'b0;
    end else begin
      store <= (shift)? sin : dout;
    end
  end

  assign sout = store;
  assign dout = (testing)? store : din;

endmodule



module BoundaryScanRegister_output
(
  din,
  dout,
  sin,
  sout,
  clock,
  reset,
  testing,
  shift
);

  input din;
  output dout;
  input sin;
  output sout;
  input clock;input reset;input testing;input shift;
  reg store;

  always @(posedge clock or posedge reset) begin
    if(reset) begin
      store <= 1'b0;
    end else begin
      store <= (shift)? sin : dout;
    end
  end

  assign sout = store;
  assign dout = din;

endmodule



module \Lut.original 
(
  a,
  b,
  clk,
  reset,
  s,
  sync,
  out,
  _114_,
  \_114_.d ,
  _115_,
  \_115_.d ,
  _116_,
  \_116_.d ,
  _117_,
  \_117_.d ,
  _118_,
  \_118_.d ,
  sin,
  shift,
  sout,
  tck,
  test
);

  input sin;
  output sout;
  input shift;
  input tck;
  input test;
  wire __clk_source__;
  wire __chain_0__;
  assign __chain_0__ = sin;
  input _114_;
  output \_114_.d ;
  input _115_;
  output \_115_.d ;
  input _116_;
  output \_116_.d ;
  input _117_;
  output \_117_.d ;
  input _118_;
  output \_118_.d ;
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  input [4:0] a;
  wire [4:0] a;
  input [4:0] b;
  wire [4:0] b;
  input clk;
  wire clk;
  output [4:0] out;
  wire [4:0] out;
  wire \out_reg[0] ;
  wire \out_reg[1] ;
  wire \out_reg[2] ;
  wire \out_reg[3] ;
  wire \out_reg[4] ;
  input reset;
  wire reset;
  input [1:0] s;
  wire [1:0] s;
  input sync;
  wire sync;
  wire \y[0] ;
  wire \y[1] ;
  wire \y[2] ;
  wire \y[3] ;
  wire \y[4] ;

  sky130_fd_sc_hd__clkinv_1
  _052_
  (
    .A(reset),
    .Y(_000_)
  );


  sky130_fd_sc_hd__clkinv_1
  _053_
  (
    .A(sync),
    .Y(_005_)
  );


  sky130_fd_sc_hd__nand2_1
  _054_
  (
    .A(b[0]),
    .B(a[0]),
    .Y(_006_)
  );


  sky130_fd_sc_hd__o22ai_1
  _055_
  (
    .A1(s[0]),
    .A2(s[1]),
    .B1(b[0]),
    .B2(a[0]),
    .Y(_007_)
  );


  sky130_fd_sc_hd__mux2i_1
  _056_
  (
    .A0(s[1]),
    .A1(_007_),
    .S(_006_),
    .Y(\y[0] )
  );


  sky130_fd_sc_hd__mux2_1
  _057_
  (
    .A0(\out_reg[0] ),
    .A1(\y[0] ),
    .S(_005_),
    .X(out[0])
  );


  sky130_fd_sc_hd__nor2_1
  _058_
  (
    .A(b[1]),
    .B(a[1]),
    .Y(_008_)
  );


  sky130_fd_sc_hd__nand2_1
  _059_
  (
    .A(b[1]),
    .B(a[1]),
    .Y(_009_)
  );


  sky130_fd_sc_hd__xor2_1
  _060_
  (
    .A(b[1]),
    .B(a[1]),
    .X(_010_)
  );


  sky130_fd_sc_hd__lpflow_isobufsrc_1
  _061_
  (
    .A(s[1]),
    .SLEEP(s[0]),
    .X(_011_)
  );


  sky130_fd_sc_hd__xnor2_1
  _062_
  (
    .A(_006_),
    .B(_010_),
    .Y(_012_)
  );


  sky130_fd_sc_hd__a21oi_1
  _063_
  (
    .A1(b[1]),
    .A2(a[1]),
    .B1(s[0]),
    .Y(_013_)
  );


  sky130_fd_sc_hd__nor3_1
  _064_
  (
    .A(s[1]),
    .B(_008_),
    .C(_013_),
    .Y(_014_)
  );


  sky130_fd_sc_hd__lpflow_isobufsrc_1
  _065_
  (
    .A(b[0]),
    .SLEEP(a[0]),
    .X(_015_)
  );


  sky130_fd_sc_hd__nand2_1
  _066_
  (
    .A(s[0]),
    .B(s[1]),
    .Y(_016_)
  );


  sky130_fd_sc_hd__nor2_1
  _067_
  (
    .A(_010_),
    .B(_015_),
    .Y(_017_)
  );


  sky130_fd_sc_hd__xnor2_1
  _068_
  (
    .A(_010_),
    .B(_015_),
    .Y(_018_)
  );


  sky130_fd_sc_hd__a21oi_1
  _069_
  (
    .A1(_011_),
    .A2(_012_),
    .B1(_014_),
    .Y(_019_)
  );


  sky130_fd_sc_hd__o21ai_0
  _070_
  (
    .A1(_016_),
    .A2(_018_),
    .B1(_019_),
    .Y(\y[1] )
  );


  sky130_fd_sc_hd__mux2_1
  _071_
  (
    .A0(\out_reg[1] ),
    .A1(\y[1] ),
    .S(_005_),
    .X(out[1])
  );


  sky130_fd_sc_hd__nor2_1
  _072_
  (
    .A(b[2]),
    .B(a[2]),
    .Y(_020_)
  );


  sky130_fd_sc_hd__xnor2_1
  _073_
  (
    .A(b[2]),
    .B(a[2]),
    .Y(_021_)
  );


  sky130_fd_sc_hd__o21ai_0
  _074_
  (
    .A1(_006_),
    .A2(_008_),
    .B1(_009_),
    .Y(_022_)
  );


  sky130_fd_sc_hd__xnor2_1
  _075_
  (
    .A(_021_),
    .B(_022_),
    .Y(_023_)
  );


  sky130_fd_sc_hd__a21oi_1
  _076_
  (
    .A1(b[2]),
    .A2(a[2]),
    .B1(s[0]),
    .Y(_024_)
  );


  sky130_fd_sc_hd__nor3_1
  _077_
  (
    .A(s[1]),
    .B(_020_),
    .C(_024_),
    .Y(_025_)
  );


  sky130_fd_sc_hd__lpflow_isobufsrc_1
  _078_
  (
    .A(a[1]),
    .SLEEP(b[1]),
    .X(_026_)
  );


  sky130_fd_sc_hd__o21a_1
  _079_
  (
    .A1(_017_),
    .A2(_026_),
    .B1(_021_),
    .X(_027_)
  );


  sky130_fd_sc_hd__nor3_1
  _080_
  (
    .A(_017_),
    .B(_021_),
    .C(_026_),
    .Y(_028_)
  );


  sky130_fd_sc_hd__nor3_1
  _081_
  (
    .A(_016_),
    .B(_027_),
    .C(_028_),
    .Y(_029_)
  );


  sky130_fd_sc_hd__a211o_1
  _082_
  (
    .A1(_011_),
    .A2(_023_),
    .B1(_025_),
    .C1(_029_),
    .X(\y[2] )
  );


  sky130_fd_sc_hd__mux2_1
  _083_
  (
    .A0(\out_reg[2] ),
    .A1(\y[2] ),
    .S(_005_),
    .X(out[2])
  );


  sky130_fd_sc_hd__nor2_1
  _084_
  (
    .A(b[3]),
    .B(a[3]),
    .Y(_030_)
  );


  sky130_fd_sc_hd__xnor2_1
  _085_
  (
    .A(b[3]),
    .B(a[3]),
    .Y(_031_)
  );


  sky130_fd_sc_hd__lpflow_isobufsrc_1
  _086_
  (
    .A(a[2]),
    .SLEEP(b[2]),
    .X(_032_)
  );


  sky130_fd_sc_hd__o21a_1
  _087_
  (
    .A1(_027_),
    .A2(_032_),
    .B1(_031_),
    .X(_033_)
  );


  sky130_fd_sc_hd__nor3_1
  _088_
  (
    .A(_027_),
    .B(_031_),
    .C(_032_),
    .Y(_034_)
  );


  sky130_fd_sc_hd__nor3_1
  _089_
  (
    .A(_016_),
    .B(_033_),
    .C(_034_),
    .Y(_035_)
  );


  sky130_fd_sc_hd__a21oi_1
  _090_
  (
    .A1(b[3]),
    .A2(a[3]),
    .B1(s[0]),
    .Y(_036_)
  );


  sky130_fd_sc_hd__nor3_1
  _091_
  (
    .A(s[1]),
    .B(_030_),
    .C(_036_),
    .Y(_037_)
  );


  sky130_fd_sc_hd__maj3_1
  _092_
  (
    .A(b[2]),
    .B(a[2]),
    .C(_022_),
    .X(_038_)
  );


  sky130_fd_sc_hd__xnor2_1
  _093_
  (
    .A(_031_),
    .B(_038_),
    .Y(_039_)
  );


  sky130_fd_sc_hd__a211o_1
  _094_
  (
    .A1(_011_),
    .A2(_039_),
    .B1(_037_),
    .C1(_035_),
    .X(\y[3] )
  );


  sky130_fd_sc_hd__mux2_1
  _095_
  (
    .A0(\out_reg[3] ),
    .A1(\y[3] ),
    .S(_005_),
    .X(out[3])
  );


  sky130_fd_sc_hd__nor2_1
  _096_
  (
    .A(b[4]),
    .B(a[4]),
    .Y(_040_)
  );


  sky130_fd_sc_hd__xnor2_1
  _097_
  (
    .A(b[4]),
    .B(a[4]),
    .Y(_041_)
  );


  sky130_fd_sc_hd__lpflow_isobufsrc_1
  _098_
  (
    .A(a[3]),
    .SLEEP(b[3]),
    .X(_042_)
  );


  sky130_fd_sc_hd__o21ai_0
  _099_
  (
    .A1(_033_),
    .A2(_042_),
    .B1(_041_),
    .Y(_043_)
  );


  sky130_fd_sc_hd__or3_1
  _100_
  (
    .A(_033_),
    .B(_041_),
    .C(_042_),
    .X(_044_)
  );


  sky130_fd_sc_hd__nand4_1
  _101_
  (
    .A(s[0]),
    .B(s[1]),
    .C(_043_),
    .D(_044_),
    .Y(_045_)
  );


  sky130_fd_sc_hd__maj3_1
  _102_
  (
    .A(b[3]),
    .B(a[3]),
    .C(_038_),
    .X(_046_)
  );


  sky130_fd_sc_hd__xnor2_1
  _103_
  (
    .A(_041_),
    .B(_046_),
    .Y(_047_)
  );


  sky130_fd_sc_hd__nand2_1
  _104_
  (
    .A(_011_),
    .B(_047_),
    .Y(_048_)
  );


  sky130_fd_sc_hd__a21oi_1
  _105_
  (
    .A1(b[4]),
    .A2(a[4]),
    .B1(s[0]),
    .Y(_049_)
  );


  sky130_fd_sc_hd__or3_1
  _106_
  (
    .A(s[1]),
    .B(_040_),
    .C(_049_),
    .X(_050_)
  );


  sky130_fd_sc_hd__nand3_1
  _107_
  (
    .A(_045_),
    .B(_048_),
    .C(_050_),
    .Y(\y[4] )
  );


  sky130_fd_sc_hd__nor2_1
  _108_
  (
    .A(_005_),
    .B(\out_reg[4] ),
    .Y(_051_)
  );


  sky130_fd_sc_hd__a41oi_1
  _109_
  (
    .A1(_005_),
    .A2(_045_),
    .A3(_048_),
    .A4(_050_),
    .B1(_051_),
    .Y(out[4])
  );


  sky130_fd_sc_hd__clkinv_1
  _110_
  (
    .A(reset),
    .Y(_001_)
  );


  sky130_fd_sc_hd__clkinv_1
  _111_
  (
    .A(reset),
    .Y(_002_)
  );


  sky130_fd_sc_hd__clkinv_1
  _112_
  (
    .A(reset),
    .Y(_003_)
  );


  sky130_fd_sc_hd__clkinv_1
  _113_
  (
    .A(reset),
    .Y(_004_)
  );

  assign \out_reg[0]  = _114_;
  assign \_114_.d  = \y[0] ;
  assign \out_reg[1]  = _115_;
  assign \_115_.d  = \y[1] ;
  assign \out_reg[2]  = _116_;
  assign \_116_.d  = \y[2] ;
  assign \out_reg[3]  = _117_;
  assign \_117_.d  = \y[3] ;
  assign \out_reg[4]  = _118_;
  assign \_118_.d  = \y[4] ;
  assign sout = __chain_0__;
  assign __clk_source__ = (test)? tck : clk;

endmodule



module Lut
(
  a,
  b,
  clk,
  reset,
  s,
  sync,
  out,
  _114_,
  \_114_.d ,
  _115_,
  \_115_.d ,
  _116_,
  \_116_.d ,
  _117_,
  \_117_.d ,
  _118_,
  \_118_.d ,
  sin,
  shift,
  sout,
  tck,
  test
);

  input sin;
  output sout;
  input reset;
  input shift;
  input tck;
  input test;
  input clk;
  wire __chain_0__;
  assign __chain_0__ = sin;
  input [4:0] a;
  wire [4:0] a__dout;
  wire __chain_1__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__0__
  (
    .din(a[0]),
    .dout(a__dout[0]),
    .sin(__chain_0__),
    .sout(__chain_1__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_2__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__1__
  (
    .din(a[1]),
    .dout(a__dout[1]),
    .sin(__chain_1__),
    .sout(__chain_2__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_3__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__2__
  (
    .din(a[2]),
    .dout(a__dout[2]),
    .sin(__chain_2__),
    .sout(__chain_3__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_4__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__3__
  (
    .din(a[3]),
    .dout(a__dout[3]),
    .sin(__chain_3__),
    .sout(__chain_4__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_5__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__4__
  (
    .din(a[4]),
    .dout(a__dout[4]),
    .sin(__chain_4__),
    .sout(__chain_5__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input [4:0] b;
  wire [4:0] b__dout;
  wire __chain_6__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__5__
  (
    .din(b[0]),
    .dout(b__dout[0]),
    .sin(__chain_5__),
    .sout(__chain_6__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_7__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__6__
  (
    .din(b[1]),
    .dout(b__dout[1]),
    .sin(__chain_6__),
    .sout(__chain_7__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_8__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__7__
  (
    .din(b[2]),
    .dout(b__dout[2]),
    .sin(__chain_7__),
    .sout(__chain_8__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_9__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__8__
  (
    .din(b[3]),
    .dout(b__dout[3]),
    .sin(__chain_8__),
    .sout(__chain_9__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_10__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__9__
  (
    .din(b[4]),
    .dout(b__dout[4]),
    .sin(__chain_9__),
    .sout(__chain_10__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input [1:0] s;
  wire [1:0] s__dout;
  wire __chain_11__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__10__
  (
    .din(s[0]),
    .dout(s__dout[0]),
    .sin(__chain_10__),
    .sout(__chain_11__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_12__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__11__
  (
    .din(s[1]),
    .dout(s__dout[1]),
    .sin(__chain_11__),
    .sout(__chain_12__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input sync;
  wire sync__dout;
  wire __chain_13__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__12__
  (
    .din(sync),
    .dout(sync__dout),
    .sin(__chain_12__),
    .sout(__chain_13__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input _114_;
  wire _114___dout;
  wire __chain_14__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__13__
  (
    .din(_114_),
    .dout(_114___dout),
    .sin(__chain_13__),
    .sout(__chain_14__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input _115_;
  wire _115___dout;
  wire __chain_15__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__14__
  (
    .din(_115_),
    .dout(_115___dout),
    .sin(__chain_14__),
    .sout(__chain_15__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input _116_;
  wire _116___dout;
  wire __chain_16__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__15__
  (
    .din(_116_),
    .dout(_116___dout),
    .sin(__chain_15__),
    .sout(__chain_16__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input _117_;
  wire _117___dout;
  wire __chain_17__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__16__
  (
    .din(_117_),
    .dout(_117___dout),
    .sin(__chain_16__),
    .sout(__chain_17__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  input _118_;
  wire _118___dout;
  wire __chain_18__;

  BoundaryScanRegister_input
  __BoundaryScanRegister_input__17__
  (
    .din(_118_),
    .dout(_118___dout),
    .sin(__chain_17__),
    .sout(__chain_18__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_19__;
  output [4:0] out;
  wire [4:0] out_din;
  wire __chain_20__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__18__
  (
    .din(out_din[0]),
    .dout(out[0]),
    .sin(__chain_19__),
    .sout(__chain_20__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_21__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__19__
  (
    .din(out_din[1]),
    .dout(out[1]),
    .sin(__chain_20__),
    .sout(__chain_21__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_22__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__20__
  (
    .din(out_din[2]),
    .dout(out[2]),
    .sin(__chain_21__),
    .sout(__chain_22__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_23__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__21__
  (
    .din(out_din[3]),
    .dout(out[3]),
    .sin(__chain_22__),
    .sout(__chain_23__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  wire __chain_24__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__22__
  (
    .din(out_din[4]),
    .dout(out[4]),
    .sin(__chain_23__),
    .sout(__chain_24__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  output \_114_.d ;
  wire \_114_.d_din ;
  wire __chain_25__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__23__
  (
    .din(\_114_.d_din ),
    .dout(\_114_.d ),
    .sin(__chain_24__),
    .sout(__chain_25__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  output \_115_.d ;
  wire \_115_.d_din ;
  wire __chain_26__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__24__
  (
    .din(\_115_.d_din ),
    .dout(\_115_.d ),
    .sin(__chain_25__),
    .sout(__chain_26__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  output \_116_.d ;
  wire \_116_.d_din ;
  wire __chain_27__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__25__
  (
    .din(\_116_.d_din ),
    .dout(\_116_.d ),
    .sin(__chain_26__),
    .sout(__chain_27__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  output \_117_.d ;
  wire \_117_.d_din ;
  wire __chain_28__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__26__
  (
    .din(\_117_.d_din ),
    .dout(\_117_.d ),
    .sin(__chain_27__),
    .sout(__chain_28__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );

  output \_118_.d ;
  wire \_118_.d_din ;
  wire __chain_29__;

  BoundaryScanRegister_output
  __BoundaryScanRegister_output__27__
  (
    .din(\_118_.d_din ),
    .dout(\_118_.d ),
    .sin(__chain_28__),
    .sout(__chain_29__),
    .clock(tck),
    .reset(reset),
    .testing(test),
    .shift(shift)
  );


  \Lut.original 
  __uuf__
  (
    .a(a__dout),
    .b(b__dout),
    .clk(clk),
    .reset(reset),
    .s(s__dout),
    .sync(sync__dout),
    ._114_(_114___dout),
    ._115_(_115___dout),
    ._116_(_116___dout),
    ._117_(_117___dout),
    ._118_(_118___dout),
    .shift(shift),
    .tck(tck),
    .test(test),
    .sin(__chain_18__),
    .sout(__chain_19__),
    .out(out_din),
    .\_114_.d (\_114_.d_din ),
    .\_115_.d (\_115_.d_din ),
    .\_116_.d (\_116_.d_din ),
    .\_117_.d (\_117_.d_din ),
    .\_118_.d (\_118_.d_din )
  );

  assign sout = __chain_29__;

endmodule


