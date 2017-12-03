function dF = NStepDer( F, n )
    FSize = size(F);
    if FSize(2) == 1
        F = F';
    end
    dF = zeros(size(F));
    extF = [F,F(1:n)];
    for e = 1:length(F)
        dF(e) = extF(e)*n - sum(extF(e+1:e+n));
    end
end

