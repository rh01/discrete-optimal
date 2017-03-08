%创建一个枚举类型为对象命名
enum DISH;
int: capacity; % capacity 来代表我们桌子的大小的容量

% 参数数组声明
array[DISH] of int: satisf; % 享受程度
array[DISH] of int: size; % 占地大小
% 变量数组声明
array[DISH] of var int: amt; % 盘数

% 数组查找
% sum就是把每一道菜 i 它的大小跟它的盘数的乘积呢 加起来
constraint forall(i in DISH)(amt[i] >= 0);
constraint sum(i in DISH)(size[i] * amt[i]) <= capacity;
solve maximize sum(i in DISH)(satisf[i] * amt[i]);

output ["Amount = ", show(amt), "\n"]

% 该桃园宴会问题是背包问题的变形

% 新特性
% l..u (l,u为整数)或
% 枚举类型

% 参数个变量数组
% array[范围] of 变量声明

% 数组查找
% 数组名[下标表达式]

% 生成器表达式
% forall(i in 范围)(布尔表达式)

% 对于范围内的所有的i,对应布尔表达式都为真

% sum(i in 范围)(布尔表达式)

% 对范围内的所有i对应的表达式累加


