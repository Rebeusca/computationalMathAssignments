c = [-30; -40];

A = [
    3 2;
    2 4;
    4 3
];
b = [240; 320; 360];
ctype = repmat("U", 3, 1);

lb = [0; 0];
ub = [];

vartype = repmat("C", 2, 1);

[xopt, zopt, status, extra] = glpk(c, A, b, ctype, vartype, lb, ub, 1);

disp("Quantidade ótima de Produto A e Produto B:")
disp(xopt)
disp("Lucro máximo:")
disp(-zopt)

