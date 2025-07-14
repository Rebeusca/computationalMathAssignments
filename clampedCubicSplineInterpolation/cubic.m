function cubic(X, Y, m1, m2)
    n = length(X);
    N_eq = 4*(n-1);
    A = zeros(N_eq, N_eq);
    b = zeros(N_eq, 1);

    row = 1;

    for i = 1:n-1
        xi = X(i);
        xi1 = X(i+1);

        A(row, 4*(i-1)+(1:4)) = model(xi, xi, 'value');
        b(row) = Y(i);
        row++;

        A(row, 4*(i-1)+(1:4)) = model(xi, xi1, 'value');
        b(row) = Y(i+1);
        row++;
    endfor

    for i = 1:n-2
        xi = X(i+1);
        A(row, 4*(i-1)+(1:4)) = model(X(i), xi, 'deriv1');
        A(row, 4*i+(1:4))     = -model(X(i+1), xi, 'deriv1');
        b(row) = 0;
        row++;
    endfor

    for i = 1:n-2
        xi = X(i+1);
        A(row, 4*(i-1)+(1:4)) = model(X(i), xi, 'deriv2');
        A(row, 4*i+(1:4))     = -model(X(i+1), xi, 'deriv2');
        b(row) = 0;
        row++;
    endfor

    A(row, 1:4) = model(X(1), X(1), 'deriv1');
    b(row) = m1;
    row++;

    A(row, end-3:end) = model(X(end-1), X(end), 'deriv1');
    b(row) = m2;

    coeffs = A \ b;

    hold on;
    for i = 1:n-1
        xi = X(i);
        xx = linspace(X(i), X(i+1), 100);
        a = coeffs(4*(i-1)+1);
        b1 = coeffs(4*(i-1)+2);
        c = coeffs(4*(i-1)+3);
        d = coeffs(4*(i-1)+4);
        yy = a*(xx - xi).^3 + b1*(xx - xi).^2 + c*(xx - xi) + d;
        plot(xx, yy, 'b-');
    endfor
    plot(X, Y, 'ro');
    title('Spline cúbica clamped genérica');
    grid on;
    pause();
endfunction