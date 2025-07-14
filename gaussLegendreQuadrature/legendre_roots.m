function roots = legendre_roots(n)
    roots = zeros(1, n);
    tol = 1e-14;
    max_iter = 100;

    for k = 1:n
        x = cos(pi * (k - 0.25)/(n + 0.5));
        for iter = 1:max_iter
        P = legendre_poly(n, x);
        dP = (legendre_poly(n, x + 1e-8) - legendre_poly(n, x - 1e-8)) / (2e-8);
        dx = -P / dP;
        x = x + dx;
        if abs(dx) < tol
            break;
        end
        end
        roots(k) = x;
    end

    roots = sort(roots);
end
