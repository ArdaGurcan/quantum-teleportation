OPENQASM 2.0;
include "qelib1.inc";
gate multiplex1_dg q0 { rz(0.12972609) q0; }
gate multiplex1_reverse_dg q0 { ry(0.21284709) q0; }
gate disentangler_dg q0 { multiplex1_reverse_dg q0; multiplex1_dg q0; }
gate initialize(param0,param1) q0 { reset q0; disentangler_dg q0; }
qreg anne[2];
qreg bob[2];
qreg clara[1];
creg bob_c[2];
initialize(-0.96061934-0.25676295j,-0.098209634-0.040473992j) bob[0];
barrier anne[0],anne[1],bob[0],bob[1],clara[0];
h anne[0];
cx anne[0],anne[1];
barrier anne[0],anne[1],bob[0],bob[1],clara[0];
swap anne[0],bob[1];
swap anne[1],clara[0];
cx bob[0],bob[1];
h bob[0];
barrier anne[0],anne[1],bob[0],bob[1],clara[0];
measure bob[1] -> bob_c[1];
measure bob[0] -> bob_c[0];
barrier anne[0],anne[1],bob[0],bob[1],clara[0];
x clara[0];
z clara[0];
