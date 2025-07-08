function res = escalonar(B)
    [n, m] = size(B);
    
    for i = 1:n
        [~, p] = max(abs(B(i:n, i)));
        p = p + i - 1;
        if p ~= i
            B([i, p], :) = B([p, i], :);
        end
    
        B(i, :) = B(i, :) / B(i, i);
        
        for j = i+1:n
            B(j, :) = B(j, :) - B(j, i) * B(i, :);
        end
        end
    
        for i = n:-1:1
        for j = i-1:-1:1
            B(j, :) = B(j, :) - B(j, i) * B(i, :);
        end
        end
        
        res = B;
endfunction