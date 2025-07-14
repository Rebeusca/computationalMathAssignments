function P = legendre_poly(n, x)
    if n == 0
        P = ones(size(x));
    elseif n == 1
        P = x;
    else
        Pn_1 = x;
        Pn_2 = ones(size(x));
        for k = 2:n
        P = ((2*k-1).*x.*Pn_1 - (k-1).*Pn_2)/k;
        Pn_2 = Pn_1;
        Pn_1 = P;
        end
    end
end
