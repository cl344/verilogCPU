module sadder(sub,in1,in2,out,ovf);

input sub;
input [31:0] in1,in2;
output [31:0] out;
output ovf;

wire [31:0] s0;
wire [31:0] c0;
wire [31:0] s1;
wire [31:0] c1;

wire [31:0] cin;
wire [31:0] in2a;

wire [3:0] ovft;
wire endn,nsub,nin1,nin2,nendn;

generate
genvar j;

for(j=0;j<32;j=j+1) begin:loop0

assign in2a[j] = sub ? ~in2[j]:in2[j];

end
endgenerate

adder a0 (in1[0 ],in2a[0 ],s0[0 ],c0[0 ],s1[0 ],c1[0 ]);
adder a1 (in1[1 ],in2a[1 ],s0[1 ],c0[1 ],s1[1 ],c1[1 ]);
adder a2 (in1[2 ],in2a[2 ],s0[2 ],c0[2 ],s1[2 ],c1[2 ]);
adder a3 (in1[3 ],in2a[3 ],s0[3 ],c0[3 ],s1[3 ],c1[3 ]);
adder a4 (in1[4 ],in2a[4 ],s0[4 ],c0[4 ],s1[4 ],c1[4 ]);
adder a5 (in1[5 ],in2a[5 ],s0[5 ],c0[5 ],s1[5 ],c1[5 ]);
adder a6 (in1[6 ],in2a[6 ],s0[6 ],c0[6 ],s1[6 ],c1[6 ]);
adder a7 (in1[7 ],in2a[7 ],s0[7 ],c0[7 ],s1[7 ],c1[7 ]);
adder a8 (in1[8 ],in2a[8 ],s0[8 ],c0[8 ],s1[8 ],c1[8 ]);
adder a9 (in1[9 ],in2a[9 ],s0[9 ],c0[9 ],s1[9 ],c1[9 ]);
adder a10(in1[10],in2a[10],s0[10],c0[10],s1[10],c1[10]);
adder a11(in1[11],in2a[11],s0[11],c0[11],s1[11],c1[11]);
adder a12(in1[12],in2a[12],s0[12],c0[12],s1[12],c1[12]);
adder a13(in1[13],in2a[13],s0[13],c0[13],s1[13],c1[13]);
adder a14(in1[14],in2a[14],s0[14],c0[14],s1[14],c1[14]);
adder a15(in1[15],in2a[15],s0[15],c0[15],s1[15],c1[15]);
adder a16(in1[16],in2a[16],s0[16],c0[16],s1[16],c1[16]);
adder a17(in1[17],in2a[17],s0[17],c0[17],s1[17],c1[17]);
adder a18(in1[18],in2a[18],s0[18],c0[18],s1[18],c1[18]);
adder a19(in1[19],in2a[19],s0[19],c0[19],s1[19],c1[19]);
adder a20(in1[20],in2a[20],s0[20],c0[20],s1[20],c1[20]);
adder a21(in1[21],in2a[21],s0[21],c0[21],s1[21],c1[21]);
adder a22(in1[22],in2a[22],s0[22],c0[22],s1[22],c1[22]);
adder a23(in1[23],in2a[23],s0[23],c0[23],s1[23],c1[23]);
adder a24(in1[24],in2a[24],s0[24],c0[24],s1[24],c1[24]);
adder a25(in1[25],in2a[25],s0[25],c0[25],s1[25],c1[25]);
adder a26(in1[26],in2a[26],s0[26],c0[26],s1[26],c1[26]);
adder a27(in1[27],in2a[27],s0[27],c0[27],s1[27],c1[27]);
adder a28(in1[28],in2a[28],s0[28],c0[28],s1[28],c1[28]);
adder a29(in1[29],in2a[29],s0[29],c0[29],s1[29],c1[29]);
adder a30(in1[30],in2a[30],s0[30],c0[30],s1[30],c1[30]);
adder a31(in1[31],in2a[31],s0[31],c0[31],s1[31],c1[31]);


assign out[0] = sub ? s1[0]:s0[0];
assign cin[0] = sub ? c1[0]:c0[0];

assign out[1] = cin[0] ? s1[1]:s0[1];
assign cin[1] = cin[0] ? c1[1]:c0[1];
assign out[2] = cin[1] ? s1[2]:s0[2];
assign cin[2] = cin[1] ? c1[2]:c0[2];
assign out[3] = cin[2] ? s1[3]:s0[3];
assign cin[3] = cin[2] ? c1[3]:c0[3];
assign out[4] = cin[3] ? s1[4]:s0[4];
assign cin[4] = cin[3] ? c1[4]:c0[4];
assign out[5] = cin[4] ? s1[5]:s0[5];
assign cin[5] = cin[4] ? c1[5]:c0[5];
assign out[6] = cin[5] ? s1[6]:s0[6];
assign cin[6] = cin[5] ? c1[6]:c0[6];
assign out[7] = cin[6] ? s1[7]:s0[7];
assign cin[7] = cin[6] ? c1[7]:c0[7];
assign out[8] = cin[7] ? s1[8]:s0[8];
assign cin[8] = cin[7] ? c1[8]:c0[8];
assign out[9] = cin[8] ? s1[9]:s0[9];
assign cin[9] = cin[8] ? c1[9]:c0[9];
assign out[10] = cin[9] ? s1[10]:s0[10];
assign cin[10] = cin[9] ? c1[10]:c0[10];
assign out[11] = cin[10] ? s1[11]:s0[11];
assign cin[11] = cin[10] ? c1[11]:c0[11];
assign out[12] = cin[11] ? s1[12]:s0[12];
assign cin[12] = cin[11] ? c1[12]:c0[12];
assign out[13] = cin[12] ? s1[13]:s0[13];
assign cin[13] = cin[12] ? c1[13]:c0[13];
assign out[14] = cin[13] ? s1[14]:s0[14];
assign cin[14] = cin[13] ? c1[14]:c0[14];
assign out[15] = cin[14] ? s1[15]:s0[15];
assign cin[15] = cin[14] ? c1[15]:c0[15];
assign out[16] = cin[15] ? s1[16]:s0[16];
assign cin[16] = cin[15] ? c1[16]:c0[16];
assign out[17] = cin[16] ? s1[17]:s0[17];
assign cin[17] = cin[16] ? c1[17]:c0[17];
assign out[18] = cin[17] ? s1[18]:s0[18];
assign cin[18] = cin[17] ? c1[18]:c0[18];
assign out[19] = cin[18] ? s1[19]:s0[19];
assign cin[19] = cin[18] ? c1[19]:c0[19];
assign out[20] = cin[19] ? s1[20]:s0[20];
assign cin[20] = cin[19] ? c1[20]:c0[20];
assign out[21] = cin[20] ? s1[21]:s0[21];
assign cin[21] = cin[20] ? c1[21]:c0[21];
assign out[22] = cin[21] ? s1[22]:s0[22];
assign cin[22] = cin[21] ? c1[22]:c0[22];
assign out[23] = cin[22] ? s1[23]:s0[23];
assign cin[23] = cin[22] ? c1[23]:c0[23];
assign out[24] = cin[23] ? s1[24]:s0[24];
assign cin[24] = cin[23] ? c1[24]:c0[24];
assign out[25] = cin[24] ? s1[25]:s0[25];
assign cin[25] = cin[24] ? c1[25]:c0[25];
assign out[26] = cin[25] ? s1[26]:s0[26];
assign cin[26] = cin[25] ? c1[26]:c0[26];
assign out[27] = cin[26] ? s1[27]:s0[27];
assign cin[27] = cin[26] ? c1[27]:c0[27];
assign out[28] = cin[27] ? s1[28]:s0[28];
assign cin[28] = cin[27] ? c1[28]:c0[28];
assign out[29] = cin[28] ? s1[29]:s0[29];
assign cin[29] = cin[28] ? c1[29]:c0[29];
assign out[30] = cin[29] ? s1[30]:s0[30];
assign cin[30] = cin[29] ? c1[30]:c0[30];

assign endn = cin[30] ? s1[31]:s0[31];
assign out[31] = endn;
assign cin[31] = cin[30] ? c1[31]:s0[31];



not nn1(nsub,sub);
not nn2(nin1,in1[31]);
not nn3(nin2,in2[31]);
not nn4(nendn,endn);

and an1(ovft[0],nsub,nin1,nin2,endn);
and an2(ovft[1],nsub,in1[31],in2[31],nendn);
and an3(ovft[2],sub,in1[31],nin2,nendn);
and an4(ovft[3],sub,nin1,in2[31],endn);

or o1(ovf,ovft[0],ovft[1],ovft[2],ovft[3]);

endmodule

