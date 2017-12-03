function RT = ParallelAbs( RT )
    for i = 1:length(RT)
        if RT(i) < 0
            RT(i) = RT(i) + pi;
        end
    end
end

