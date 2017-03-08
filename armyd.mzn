% @parameters:budget資金 define
int:budget; 
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