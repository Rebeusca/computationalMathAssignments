% Funções a serem integradas
f_poly = @(x) x.^4 - 2*x.^2 + 1;
f_trig = @(x) sin(x);
f_exp = @(x) exp(x);

a = 0;
b = 1;

n_vals = 2:2:100;
n_vals_38 = n_vals(mod(n_vals, 3) == 0);

% Cálculo da integral com alta precisão
I_poly = integral(f_poly, a, b);
I_trig = integral(f_trig, a, b);
I_exp = integral(f_exp, a, b);

% Inicialização dos vetores de erro
erro_13_poly = [];
erro_13_trig = [];
erro_13_exp  = [];

erro_38_poly = [];
erro_38_trig = [];
erro_38_exp  = [];

% Simpson 1/3
for n = n_vals
    h = (b - a)/n;
    x = a:h:b;
    y_poly = f_poly(x);
    y_trig = f_trig(x);
    y_exp  = f_exp(x);

    S13_poly = h/3 * (y_poly(1) + 2*sum(y_poly(3:2:end-2)) + 4*sum(y_poly(2:2:end)) + y_poly(end));
    S13_trig = h/3 * (y_trig(1) + 2*sum(y_trig(3:2:end-2)) + 4*sum(y_trig(2:2:end)) + y_trig(end));
    S13_exp  = h/3 * (y_exp(1)  + 2*sum(y_exp(3:2:end-2))  + 4*sum(y_exp(2:2:end))  + y_exp(end));

    erro_13_poly(end+1) = abs(S13_poly - I_poly);
    erro_13_trig(end+1) = abs(S13_trig - I_trig);
    erro_13_exp(end+1)  = abs(S13_exp  - I_exp);
end

% Simpson 3/8
for n = n_vals_38
    h = (b - a)/n;
    x = a:h:b;
    y_poly = f_poly(x);
    y_trig = f_trig(x);
    y_exp  = f_exp(x);

    S38_poly = 3*h/8 * (y_poly(1) + 2*sum(y_poly(4:3:end-3)) + 3*sum(y_poly(2:end-1)) - 3*sum(y_poly(4:3:end-3)) + y_poly(end));
    S38_trig = 3*h/8 * (y_trig(1) + 2*sum(y_trig(4:3:end-3)) + 3*sum(y_trig(2:end-1)) - 3*sum(y_trig(4:3:end-3)) + y_trig(end));
    S38_exp  = 3*h/8 * (y_exp(1)  + 2*sum(y_exp(4:3:end-3))  + 3*sum(y_exp(2:end-1))  - 3*sum(y_exp(4:3:end-3))  + y_exp(end));

    erro_38_poly(end+1) = abs(S38_poly - I_poly);
    erro_38_trig(end+1) = abs(S38_trig - I_trig);
    erro_38_exp(end+1)  = abs(S38_exp  - I_exp);
end

% Gráficos
figure;
semilogy(n_vals, erro_13_poly, '-o', 'DisplayName', 'Simpson 1/3');
hold on;
semilogy(n_vals_38, erro_38_poly, '--x', 'DisplayName', 'Simpson 3/8');
title('Erro para f(x) = x^4 - 2x^2 + 1');
xlabel('n');
ylabel('Erro absoluto');
legend();
grid on;

figure;
semilogy(n_vals, erro_13_trig, '-o', 'DisplayName', 'Simpson 1/3');
hold on;
semilogy(n_vals_38, erro_38_trig, '--x', 'DisplayName', 'Simpson 3/8');
title('Erro para f(x) = sin(x)');
xlabel('n');
ylabel('Erro absoluto');
legend();
grid on;

figure;
semilogy(n_vals, erro_13_exp, '-o', 'DisplayName', 'Simpson 1/3');
hold on;
semilogy(n_vals_38, erro_38_exp, '--x', 'DisplayName', 'Simpson 3/8');
title('Erro para f(x) = e^x');
xlabel('n');
ylabel('Erro absoluto');
legend();
grid on;