% 数据
int: nSpots; %有多少门
set of int: SPOT = 1..nSpots; % 构建10道门的一个超集
array[SPOT] of int: damage; % 每道门被攻击后造成的伤害
enum SYMB; % 八卦
array[SYMB] of set of SPOT: group;

% 决策变量
var set of SPOT: attacks; % 选择多少门攻击

% 交集最多只有一个元素
constraint forall(s in SYMB)(card(attacks intersect group[s]) <= 1);

% 目标

var int: totalDamages =sum(p in attacks)(damage[p]);
solve maximize (totalDamages);

% in（集合中的元素 例如： x in s）
% subset, superset（子集，超集）
% intersect（交集）
% union（并集）
% card（集合势）
% diff（差运算，例如：x diff y = x \ y）
% symdiff（对称差）
% % • 例如： {1, 2, 5, 6} symdiff {2, 3, 4, 5} = {1, 3, 4, 6}