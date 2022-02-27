function retval = Wfun (data, r)
    retval = [];
    data_b = [];
    if data ~= 0
        while data > 0
            data_b(end + 1) = mod(data, 2);
            data = idivide(data, int16(2));
        endwhile
    else
        data_b = data;
    end
    data_b = [zeros(1, r - length(data_b)) fliplr(data_b)];
    T = zeros(1, 2^(r-2));
    retval(end + 1) = 0;
    for i=1:r-1
        curr_index = 2^(i - 1);
        for j = curr_index:2^(i) - 1
            nextvalue = mod(T(curr_index) + data_b(i + 1), 2);
            T = [nextvalue T(1:length(T) - 1)];
            retval(end + 1) = nextvalue;
        endfor
    endfor
    retval = -2.*retval + ones(1, length(retval));
endfunction
