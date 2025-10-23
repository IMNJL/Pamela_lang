int cur_st = 0;
bool o=1, qr=0, d=0, tr_v=0, g=0, v=0, m=0, c=0, tr_input=0;

inline sts(cur_st){
if
::(cur_st == 0) -> atomic {o=1; qr=0; d=0; tr_v=0; g=0; v=0; m=0; c=0; tr_input=0;}
::(cur_st == 1) -> atomic {o=0; qr=0; d=0; tr_v=0; g=0; v=0; m=1; c=0; tr_input=0;}
::(cur_st == 2) -> atomic {o=0; qr=1; d=0; tr_v=0; g=0; v=0; m=0; c=0; tr_input=0;}
::(cur_st == 3) -> atomic {o=0; qr=0; d=0; tr_v=0; g=0; v=0; m=0; c=1; tr_input=0;}
::(cur_st == 4) -> atomic {o=0; qr=0; d=1; tr_v=0; g=0; v=0; m=0; c=0; tr_input=0;}
::(cur_st == 5) -> atomic {o=0; qr=0; d=0; tr_v=0; g=1; v=0; m=0; c=0; tr_input=0;}
::(cur_st == 6) -> atomic {o=0; qr=0; d=0; tr_v=0; g=0; v=1; m=0; c=0; tr_input=0;}
::(cur_st == 7) -> atomic {o=0; qr=0; d=0; tr_v=0; g=0; v=0; m=0; c=0; tr_input=1;}
::(cur_st == 8) -> atomic {o=0; qr=0; d=0; tr_v=1; g=0; v=0; m=0; c=0; tr_input=0;}
fi
}

active proctype Model(){
do
::printf("Current state: %d\n", cur_st);
sts(cur_st);
if
::(cur_st == 0) -> {cur_st=2}  // o -> qr
::(cur_st == 2) -> {cur_st=4}  // qr -> d
::(cur_st == 4) -> {cur_st=8}  // d -> tr_v
::(cur_st == 8) -> {cur_st=0}  // tr_v -> o
::(cur_st == 0) -> {cur_st=2}  // o -> qr
::(cur_st == 2) -> {cur_st=4}  // qr -> d
::(cur_st == 4) -> {cur_st=5}  // d -> g
::(cur_st == 5) -> {cur_st=6}  // g -> v
::(cur_st == 6) -> {cur_st=0}  // v -> o
::else -> break;
fi
od
}