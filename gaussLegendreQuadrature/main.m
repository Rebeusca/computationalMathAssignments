f = @(x) x.^2;
a = -1;
b = 1;
n = 3;

I = gauss_quad(f, a, b, n);
printf("Integral aproximada: %.10f\n", I);
printf("Valor exato: %.10f\n", 2/3);
