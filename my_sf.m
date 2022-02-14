function retval = my_sf (A, B)
    retval = [];
    L = length(A) + length(B);
    B_ = [zeros(1, length(A)) B zeros(1, length(A))];
    for i = 0:L-1
        A_ = [zeros(1, L - i) A zeros(1, i)];
        retval(end + 1) = sum(B_.*A_);
    endfor
endfunction
