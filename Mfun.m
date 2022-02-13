function retval = Mfun (A, C)
    retval = [];
    L = 2^(size(C)(2)) - 1;
    for i = 1:L
        X = A.*C;
        nextval = mod(sum(X), 2);
        if A(size(A)(2)) == 0
            retval = [1 retval];
        else
            retval = [-1 retval];
        end
        A = [nextval A(1:size(A)(2) - 1)];
    end
    retval = fliplr(retval);
endfunction
