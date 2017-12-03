function [X, Y] = GetBounds( BW )
    BB = bwboundaries(BW);
    Y = BB{1}(:,1);
    X = BB{1}(:,2);
end

