function ret = sumreciprocal(m, k)
    format long;
    s = 0;
    scf = 0;
    scb = 0;
    for i=1:m
        s = s+(1/i);
        scf = chop(scf+chop(1/i, k),k);
    end
    
    for i=m:-1:1
        scb = chop(scb+chop(1/i, k),k);
    end
    
    ret = [s scf scb];
end