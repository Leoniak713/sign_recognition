function B = cutOut( A, cut_start, cut_end )
    
    B = A([1:cut_start, cut_end:end]);

end

