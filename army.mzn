% solve maximize 6*F + 10*L + 8*Z + 40*J; 

% int:budget = 10000;
% constraint 13*F +21*L + 17*Z + 100*J <= budget;

% var 0..1000: F;
% var 0..400: L;
% var 0..500: Z;
% var 0..150: J;

% output["F = \(F), L = \(L), Z = \(Z), J = \(J)"];

% Other Version
% Author: Shen Heng

% @parameters:budget資金 define
int:budget = 10000; 
% @decision variables define
var 0..1000: F;
var 0..400: L;
var 0..500: Z;
var 0..150: J;
%constraint（約束） 表達式
constraint 13*F +21*L + 17*Z + 100*J <= budget;
%目標函數
solve maximize 6*F + 10*L + 8*Z + 40*J; 
%解的形式
output["F = \(F), L = \(L), Z = \(Z), J = \(J)"];

% 兩種變量
% 1.參數
% 必須被賦值，且只能一次
% 聲明某一類型
% 可以(在聲明中)添上par
% 2.決策變量
% 與數學上的變量相似
% 用var加上一個類型（或者一個範圍/集合）
% 也可以用具有固定值的表達式來賦值
% 3.範圍：寫作 1..u
% 4.約束：基於標準的算術關係操作符
% constraint <約束表達式>
% 一個輸出項具有以下形式：
% output <字符串列表>
% show(v)
% \(v)
% "" ++ ""
