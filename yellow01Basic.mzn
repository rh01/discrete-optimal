enum MOVES;
int: timeBound;
% array[MOVES] of int: power; % 威力
% array[MOVES] of int: duration;% 需时


array[MOVES] of 1..20: power; % 威力
array[MOVES] of 1..10: duration;% 需时


% array[MOVES] of var int: occur;

% array[MOVES] of var 0..1:occur;

array[MOVES] of var bool:occur;


% constraint forall(i in MOVES)(occur[i] >= 0);
% constraint forall(i in MOVES)(occur[i] <= 1);

constraint (sum( i in MOVES)(duration[i] * bool2int(occur[i]))) <= timeBound;

solve maximize sum(i in MOVES)(power[i] * bool2int(occur[i]))


% 布尔型数据转换为整型数据
% bool2int(false) = 0
% bool2int(true) = 1 