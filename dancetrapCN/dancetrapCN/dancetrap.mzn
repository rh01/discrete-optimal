% Beauty Trap
% Perform the most seductive dance
include "global_cardinality_low_up.mzn";
include "regular.mzn";

enum LEGS = {spin, leap, waltz, curtsey, prep, stand};
enum ARMS = {beckon, out, up, wrapped, neutral};
enum FACE = {smile, wink, batt, think, glow, blank};

int: maxlen;
set of int: STEP = 1..maxlen;
array[LEGS] of int: maxlegs;
array[ARMS] of int: maxarms;
array[FACE] of int: maxface;
constraint assert(maxlegs[stand] >= maxlen, "maxlegs[stand] smaller than maxlen");
constraint assert(maxarms[neutral] >= maxlen, "maxarms[neutral] smaller than maxlen");
constraint assert(maxface[blank] >= maxlen, "maxface[blank] smaller than maxlen");
array[LEGS,ARMS] of int: dance_value;
array[ARMS,FACE] of int: entice_value;
constraint assert(dance_value[stand,neutral] = 0, "incorrect dance_value array");
constraint assert(entice_value[neutral,blank] = 0, "incorrect entice_value array");
int: boredom; % how bored each step make the viewer

var STEP: len;
array[STEP] of var LEGS: legs;
array[STEP] of var ARMS: arms;
array[STEP] of var FACE: face;


constraint global_cardinality_low_up(legs , LEGS, [0,0,0,0,0,0], [maxlegs[i] | i in LEGS]) ;
constraint global_cardinality_low_up(arms , ARMS, [0,0,0,0,0,0], [maxarms[i] | i in ARMS]) ;
constraint global_cardinality_low_up(face , FACE, [0,0,0,0,0,0], [maxface[i] | i in FACE]) ;


constraint regular(legs, 7, 6, legs_transitions, 1, {7});
array[1..7, LEGS] of 0..7: legs_transitions = [| 2,0,4,5,6,7,
                                               | 0,0,0,5,6,7,
                                               | 2,0,4,0,0,7,
                                               | 2,0,4,0,0,7,
                                               | 2,0,4,0,0,0,
                                               | 0,3,0,0,0,0,
                                               | 2,0,4,0,0,7|];
constraint forall(s in 1..maxlen-3) ( legs[s] = waltz /\ legs[s+1] = waltz /\ legs[s+2] = waltz -> legs[s+3] != waltz);
constraint forall (i in 1..maxlen) ((legs[i] = waltz -> forall(j in i+1..len) (legs[j] = curtsey -> exists(k in i+1..j-1) (legs[k] = stand))));
constraint forall(i in 1..maxlen-1) (legs[i] = curtsey -> legs[i+1] != prep);

constraint forall(s in 1..maxlen) (s > len -> legs[s] = stand);
constraint forall(s in 1..maxlen) (s > len -> arms[s] = neutral);
constraint forall(s in 1..maxlen) (s > len -> face[s] = blank);
                                               
constraint regular(arms, 6, 5, arms_transitions, 1, {6});
array[1..6, ARMS] of 0..6: arms_transitions = [| 0,3,4,5,6,
                                               | 0,3,4,5,6,
                                               | 2,0,4,0,6,
                                               | 2,3,0,0,6,
                                               | 0,3,4,0,6,
                                               | 0,3,4,5,6|];
                                               
constraint regular(face, 7, 6, face_transitions, 1, {7});
array[1..7, FACE] of 0..7: face_transitions = [| 2,3,4,5,6,7,
                                               | 0,3,4,0,6,7,
                                               | 2,0,4,5,6,7,
                                               | 2,3,0,0,6,7,
                                               | 2,3,4,0,6,7,
                                               | 2,3,4,5,0,7,
                                               | 2,3,4,5,6,7|];                 
var int: obj;
constraint obj =sum(i in  1..maxlen) (dance_value[legs[i],arms[i]] + entice_value[arms[i], face[i]])
             - (boredom * len);


solve maximize obj;