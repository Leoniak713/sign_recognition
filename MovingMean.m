function MF = MovingMean( F, n )
    ASize = size(F);
    if ASize(1) == 1
        F = F';
    end
    extF = [F;F(1:n)];
    MF = zeros(size(F));
    moving_sum =  sum(F(1:n));
    for i = 1:length(F)
        MF(i) = moving_sum / n;
        moving_sum = moving_sum - extF(i) + extF(i+n);
end

