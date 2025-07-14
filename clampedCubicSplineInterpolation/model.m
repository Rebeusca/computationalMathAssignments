function row = model(x0, x, type)
    dx = x - x0;
    switch type
        case 'value'
        row = [dx^3, dx^2, dx, 1];
        case 'deriv1'
        row = [3*dx^2, 2*dx, 1, 0];
        case 'deriv2'
        row = [6*dx, 2, 0, 0];
        otherwise
        error('Tipo desconhecido: use value, deriv1 ou deriv2');
    endswitch
endfunction
