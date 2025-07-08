function res = adapte()
    % Supondo que há uma segunda equação:
    x = 3;
    y = 2;
    tol = 1e-6;
    max_iter = 100;

    for k = 1:max_iter
        f1 = x^2*y - x*y^2 - 6;
        f2 = x + y - 3;

        J = [
            2*x*y - y^2, x^2 - 2*x*y;
            1, 1
        ];

        F = [-f1; -f2];

        delta = J \ F;

        x = x + delta(1);
        y = y + delta(2);

        if norm(delta) < tol
            break;
        end
    end

    res = [x, y];
end
