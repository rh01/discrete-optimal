% assignment 2
% select a set of raiding warrior
enum WARRIOR;
WARRIOR: dummy; 
enum CLAN; % the clan they belong too

int: l; % minimum raid party size
int: u; % maximum raid party size
int: m; % limit of hatreds

array[WARRIOR] of int: strength;
array[WARRIOR] of CLAN: clan;

array[CLAN,CLAN] of 0..1: hates;


%var set of WARRIOR: raid;
array[1..u] of var WARRIOR: raid;


constraint sum (i, j in raid where i <= j) ( hates[CLAN[clan[i]],CLAN[clan[j]]] ) <= m;
constraint forall (i in 1..u-1) ( raid[i] >= raid[i+1] + (raid[i] != dummy));

%constraint forall(i in 1..u) (raid[i] != dummy);

var int: obj;
constraint obj = sum([ strength[i] + (raid[i] = dummy) * min(strength)  | i in raid ]);


solve maximize obj ;


output ["raid = {"] ++ [if fix(raid[i]) != dummy then show(raid[i])
++ if i < u /\ fix(raid[i+1]) != dummy then ", " else "" endif
else "" endif | i in 1..u ] ++ ["};\nobj = \(obj)"]