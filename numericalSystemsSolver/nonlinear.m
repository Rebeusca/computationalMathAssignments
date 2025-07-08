function res = nonlinear()
    % Aproximação inicial
    x = 1;
    y = 1;
    tol = 1e-6;
    max_iter = 100;
    iter = 0;

    for k = 1:max_iter
        x_new = (17 - 11 * y^2) / 2;
        y_new = 5 * x_new^2 - 46;

        if abs(x - x_new) < tol && abs(y - y_new) < tol
            break;
        end

        x = x_new;
        y = y_new;
        iter = iter + 1;
        end

        res = [x; y];
        fprintf("%d\n", res);
        fprintf("%d\n", iter);
endfunction