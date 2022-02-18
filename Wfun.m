function retval = Wfun (data, r)
    data_b = [];
    L = 2^(r - 2);
    if data ~= 0
        while data > 0
            data_b(end + 1) = mod(data, 2);
            data = idivide(data, int16(2));
        endwhile
    else
        data_b = data;
    end
    data_b = [zeros(1, r - length(data_b)) fliplr(data_b)];
endfunction
