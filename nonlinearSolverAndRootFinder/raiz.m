function res = raiz(X)
    % Chute inicial
    r = X / 2;

    % Critério de parada
    tol = 1e-6;
    max_iter = 100;
    iter = 0;

    while iter < max_iter
        f = r^2 - X;
        df = 2 * r;
        r_new = r - f / df;

        if abs(r_new - r) < tol
            break;
        end

        r = r_new;
        iter = iter + 1;
    end

    res = r;
end
