function I = gauss_quad(f, a, b, n)
    xi = legendre_roots(n);
    wi = zeros(1, n);
    for i = 1:n
        wi(i) = gauss_weights(xi(i), n);
    end

    I = 0;
    for i = 1:n
        x_mapped = ((b - a)/2) * xi(i) + ((b + a)/2);
        I += wi(i) * f(x_mapped);
    end
    I *= (b - a)/2;
end
