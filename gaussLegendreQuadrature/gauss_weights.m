function w = gauss_weights(xi, n)
    h = 1e-6;
    dPn = (legendre_poly(n, xi + h) - legendre_poly(n, xi - h)) / (2*h);
    w = 2 / ((1 - xi^2) * (dPn)^2);
end