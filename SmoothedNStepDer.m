function dF = SmoothedNStepDer( F, n )
    FSize = size(F);
    if FSize(2) == 1
        F = F';
    end
    dF = zeros(size(F));
    extF = [F,F(1:n)];
    for e = 1:length(F)
        displacement = 0;
        for i = 1:n
            displacement = displacement + (extF(e + i) - extF(e)) / i;
        end
        dF(e) = displacement;
    end
end

