costs = [
    8 6 10 9;
    9 12 13 7;
    14 9 16 5
];

c = reshape(costs', [], 1);

supply = [100; 120; 80];

demand = [80; 70; 60; 90];

A_supply = kron(eye(3), ones(1,4));

A_demand = kron(ones(1,3), eye(4));

A = [A_supply; A_demand];
b = [supply; demand];

ctype = ['U'; 'U'; 'U'; 'S'; 'S'; 'S'; 'S'];

vartype = repmat('C', 12, 1);

lb = zeros(12, 1);
ub = [];

c = double(c);
A = double(A);
b = double(b);
lb = double(lb);


[x, z, status, extra] = glpk(c, A, b, ctype, vartype, lb, ub, 1);

disp("Distribuição ótima (linha = centro, coluna = comunidade):");
disp(reshape(x, 4, 3)')
disp("Custo total mínimo:");
disp(z)

