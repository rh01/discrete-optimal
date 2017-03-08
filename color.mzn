enum COLOR = {GREEN, BLUE, PINK}; %枚舉類型數據

var COLOR: Si;
var COLOR: Yan;
var COLOR: Yu;
var COLOR: Xu;
var COLOR: Qing;
var COLOR: Ji;
var COLOR: You;
var COLOR: Bing;
var COLOR: Yong;
var COLOR: Liang;
var COLOR: Yi;
var COLOR: Jing;
var COLOR: Yang;
var COLOR: Jiao;

constraint Liang != Yong;
constraint Yong != Yi;
constraint Yong != Jing;
constraint Yong != Si;
constraint Yi != Jing;
constraint Yi != Jiao;
constraint Jiao != Jing;
constraint Jiao != Yang;
constraint Jing != Yang;
constraint Jing != Yong;
constraint Jing != Si;
constraint Jing != Yu;
constraint Yang != Yu;
constraint Yang != Xu;
constraint Yu != Si;
constraint Yu != Yan;
constraint Yu != Xu;
constraint Xu != Yan;
constraint Xu != Qing;
constraint Yan != Si;
constraint Yan != Ji;
constraint Yan != Ji;
constraint Yan != Qing;
constraint Qing != Ji;
constraint Ji != You;
constraint Ji != Bing;
constraint Ji != Si;
constraint You != Bing;
constraint Bing != Si;
solve satisfy;

% 枚举类型（enums）定义一个具有有限对象的集合
% 决策变量和参数可以是枚举类型
% 数组下标（之后介绍）可以是枚举类型
% 集合（之后介绍）可以基于枚举类型来定义
% 枚举类型可以如下声明
% enum 枚举类型名
% 枚举类型可以由一个标识符集合来定义
% 枚举类型名 = { id1, …, idn } ;
% 我们可以使用枚举类型名来声明变量
% [var] 枚举类型名: 变量名

% 图（地图）着色问题
% 一个经典的图论问题
% 在寄存器分配，时间表问题都有应用
% 纯图着色问题最好用专门的算法来解决