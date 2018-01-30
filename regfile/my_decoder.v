module my_decoder(out,in, en);
intput en;
input [4:0] in; 
output [31:0] out;

wire Nota,Notb,Notc,Notd,Note;

not(Nota, in[4]);
not(Notb, in[3]);
not(Notc, in[2]);
not(Notd, in[1]);
not(Note, in[0]);

and(out[0],  Nota,Notb,Notc,Notd,Note,en); // 00000
and(out[1],  Nota,Notb,Notc,Notd,in[0],en); // 00001
and(out[2],  Nota,Notb,Notc,in[1],Note,en); //00010
and(out[3],  Nota,Notb,Notc,in[1],in[0],en);
and(out[4],  Nota,Notb,in[2],Notd,Note,en);
and(out[5],  Nota,Notb,in[2],Notd,in[0],en);
and(out[6],  Nota,Notb,in[2],in[1],Note,en);
and(out[7],  Nota,Notb,in[2],in[1],in[0],en);
and(out[8],  Nota,in[3],Notc,Notd,Note,en);
and(out[9],  Nota,in[3],Notc,Notd,in[0],en);
and(out[10],  Nota,in[3],Notc,in[1],Note,en);
and(out[11],  Nota,in[3],Notc,in[1],in[0],en);
and(out[12],  Nota,in[3],in[2],Notd,Note,en);
and(out[13],  Nota,in[3],in[2],Notd,in[0],en);
and(out[14],  Nota,in[3],in[2],in[1],Note,en);
and(out[15],  Nota,in[3],in[2],in[1],in[0],en);
and(out[16],  in[4],Notb,Notc,Notd,Note,en);
and(out[17],  in[4],Notb,Notc,Notd,in[0],en);
and(out[18],  in[4],Notb,Notc,in[1],Note,en);
and(out[19],  in[4],Notb,Notc,in[1],in[0],en);
and(out[20],  in[4],Notb,in[2],Notd,Note,en);
and(out[21],  in[4],Notb,in[2],Notd,in[0],en);
and(out[22],  in[4],Notb,in[2],in[1],Note,en);
and(out[23],  in[4],Notb,in[2],in[1],in[0],en);
and(out[24],  in[4],in[3],Notc,Notd,Note,en);
and(out[25],  in[4],in[3],Notc,Notd,in[0],en);
and(out[26],  in[4],in[3],Notc,in[1],Note,en);
and(out[27],  in[4],in[3],Notc,in[1],in[0],en);
and(out[28],  in[4],in[3],in[2],Notd,Note,en);
and(out[29],  in[4],in[3],in[2],Notd,in[0],en);
and(out[30],  in[4],in[3],in[2],in[1],Note,en);
and(out[31],  in[4],in[3],in[2],in[1],in[0],en); // 11111
endmodule