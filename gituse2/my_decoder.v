module my_decoder(out,in, en);

input en;
input [4:0] in; 
output [31:0] out;

wire Nota,Notb,Notc,Notd,Note;

not n1(Nota, in[4]);
not n2(Notb, in[3]);
not n3(Notc, in[2]);
not n4(Notd, in[1]);
not n5(Note, in[0]);

and a1   (out[0],  Nota,Notb,Notc,Notd,Note,en); // 00000
and a2   (out[1],  Nota,Notb,Notc,Notd,in[0],en); // 00001
and a3   (out[2],  Nota,Notb,Notc,in[1],Note,en); //00010
and a4   (out[3],  Nota,Notb,Notc,in[1],in[0],en);
and a5   (out[4],  Nota,Notb,in[2],Notd,Note,en);
and a6   (out[5],  Nota,Notb,in[2],Notd,in[0],en);
and a7   (out[6],  Nota,Notb,in[2],in[1],Note,en);
and a8   (out[7],  Nota,Notb,in[2],in[1],in[0],en);
and a9   (out[8],  Nota,in[3],Notc,Notd,Note,en);
and a10  (out[9],  Nota,in[3],Notc,Notd,in[0],en);
and a11  (out[10],  Nota,in[3],Notc,in[1],Note,en);
and a12  (out[11],  Nota,in[3],Notc,in[1],in[0],en);
and a13  (out[12],  Nota,in[3],in[2],Notd,Note,en);
and a14  (out[13],  Nota,in[3],in[2],Notd,in[0],en);
and a15  (out[14],  Nota,in[3],in[2],in[1],Note,en);
and a16  (out[15],  Nota,in[3],in[2],in[1],in[0],en);
and a17  (out[16],  in[4],Notb,Notc,Notd,Note,en);
and a18  (out[17],  in[4],Notb,Notc,Notd,in[0],en);
and a19  (out[18],  in[4],Notb,Notc,in[1],Note,en);
and a20  (out[19],  in[4],Notb,Notc,in[1],in[0],en);
and a21  (out[20],  in[4],Notb,in[2],Notd,Note,en);
and a22  (out[21],  in[4],Notb,in[2],Notd,in[0],en);
and a23  (out[22],  in[4],Notb,in[2],in[1],Note,en);
and a24  (out[23],  in[4],Notb,in[2],in[1],in[0],en);
and a25  (out[24],  in[4],in[3],Notc,Notd,Note,en);
and a26  (out[25],  in[4],in[3],Notc,Notd,in[0],en);
and a27  (out[26],  in[4],in[3],Notc,in[1],Note,en);
and a28  (out[27],  in[4],in[3],Notc,in[1],in[0],en);
and a29  (out[28],  in[4],in[3],in[2],Notd,Note,en);
and a30  (out[29],  in[4],in[3],in[2],Notd,in[0],en);
and a31  (out[30],  in[4],in[3],in[2],in[1],Note,en);
and a32  (out[31],  in[4],in[3],in[2],in[1],in[0],en); // 11111
endmodule
