//======================================================================
//
// Copyright (c) 2018, NORDUnet A/S All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
// - Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
//
// - Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the distribution.
//
// - Neither the name of the NORDUnet nor the names of its contributors may
//   be used to endorse or promote products derived from this software
//   without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
// IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
// TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
// NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

localparam integer UOP_ADDR_WIDTH    = 9;    // 2 ^ 9 = max 512 instructions

localparam integer UOP_DATA_WIDTH = 6 + 1 + 3 * 6;  // opcode + banks + 3 * operand (2 * src + dst)

localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_PREPARE                 = 9'd000;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_DOUBLE            = 9'd004;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_ADD               = 9'd025;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_ADD_AT_INFINITY   = 9'd053;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_ADD_SAME_X_SAME_Y = 9'd057;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_ADD_SAME_X        = 9'd061;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_ADD_REGULAR       = 9'd065;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_K0                = 9'd069;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CYCLE_K1                = 9'd073;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CONVERT                 = 9'd077;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CONVERT_AT_INFINITY     = 9'd081;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_CONVERT_REGULAR         = 9'd084;
localparam [UOP_ADDR_WIDTH-1:0] UOP_OFFSET_INVERT                  = 9'd087;

localparam [5:0] UOP_OPCODE_CMPZ    = 6'b000001;
localparam [5:0] UOP_OPCODE_COPY    = 6'b000010;
localparam [5:0] UOP_OPCODE_ADD     = 6'b000100;
localparam [5:0] UOP_OPCODE_SUB     = 6'b001000;
localparam [5:0] UOP_OPCODE_MUL     = 6'b010000;
localparam [5:0] UOP_OPCODE_STOP    = 6'b100000;

localparam UOP_BANKS_LO2HI  = 1'b0;
localparam UOP_BANKS_HI2LO  = 1'b1;
localparam UOP_BANKS_DUMMY  = 1'bX;

localparam [5:0] UOP_OPERAND_CONST_ZERO     = 6'd00;
localparam [5:0] UOP_OPERAND_CONST_ONE      = 6'd01;
localparam [5:0] UOP_OPERAND_CONST_DELTA    = 6'd02;

localparam [5:0] UOP_OPERAND_CONST_GX       = 6'd03;
localparam [5:0] UOP_OPERAND_CONST_GY       = 6'd04;

localparam [5:0] UOP_OPERAND_CONST_HX       = 6'd05;
localparam [5:0] UOP_OPERAND_CONST_HY       = 6'd06;

localparam [5:0] UOP_OPERAND_CYCLE_RX       = 6'd07;
localparam [5:0] UOP_OPERAND_CYCLE_RY       = 6'd08;
localparam [5:0] UOP_OPERAND_CYCLE_RZ       = 6'd09;

localparam [5:0] UOP_OPERAND_CYCLE_SX       = 6'd10;
localparam [5:0] UOP_OPERAND_CYCLE_SY       = 6'd11;
localparam [5:0] UOP_OPERAND_CYCLE_SZ       = 6'd12;

localparam [5:0] UOP_OPERAND_CYCLE_A        = 6'd13;
localparam [5:0] UOP_OPERAND_CYCLE_A2       = 6'd14;
localparam [5:0] UOP_OPERAND_CYCLE_B        = 6'd15;
localparam [5:0] UOP_OPERAND_CYCLE_C        = 6'd16;
localparam [5:0] UOP_OPERAND_CYCLE_C2       = 6'd17;
localparam [5:0] UOP_OPERAND_CYCLE_C2_2     = 6'd18;
localparam [5:0] UOP_OPERAND_CYCLE_D        = 6'd19;
localparam [5:0] UOP_OPERAND_CYCLE_E        = 6'd20;
localparam [5:0] UOP_OPERAND_CYCLE_F        = 6'd21;
localparam [5:0] UOP_OPERAND_CYCLE_G        = 6'd22;
localparam [5:0] UOP_OPERAND_CYCLE_H        = 6'd23;
localparam [5:0] UOP_OPERAND_CYCLE_J        = 6'd24;

localparam [5:0] UOP_OPERAND_CYCLE_Z2       = 6'd25;

localparam [5:0] UOP_OPERAND_CYCLE_T1       = 6'd26;
localparam [5:0] UOP_OPERAND_CYCLE_T2       = 6'd27;
localparam [5:0] UOP_OPERAND_CYCLE_T3       = 6'd28;
localparam [5:0] UOP_OPERAND_CYCLE_T4       = 6'd29;

localparam [5:0] UOP_OPERAND_INVERT_R1      = 6'd30;
localparam [5:0] UOP_OPERAND_INVERT_R2      = 6'd31;

localparam [5:0] UOP_OPERAND_INVERT_X2      = 6'd32;
localparam [5:0] UOP_OPERAND_INVERT_X3      = 6'd33;
localparam [5:0] UOP_OPERAND_INVERT_X6      = 6'd34;
localparam [5:0] UOP_OPERAND_INVERT_X12     = 6'd35;
localparam [5:0] UOP_OPERAND_INVERT_X15     = 6'd36;
localparam [5:0] UOP_OPERAND_INVERT_X30     = 6'd37;
localparam [5:0] UOP_OPERAND_INVERT_X32     = 6'd38;
localparam [5:0] UOP_OPERAND_INVERT_X60     = 6'd39;
localparam [5:0] UOP_OPERAND_INVERT_X120    = 6'd40;

localparam [5:0] UOP_OPERAND_INVERT_A2      = 6'd41;
localparam [5:0] UOP_OPERAND_INVERT_A3      = 6'd42;

localparam [5:0] UOP_OPERAND_DONTCARE       = 6'dX;


//------------------------------------------------------------------------------
// End-of-File
//------------------------------------------------------------------------------
