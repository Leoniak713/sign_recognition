function cut_BW = cut_to_palm( BW )

    CS = sum(BW, 1);
    RS = sum(BW, 2);
    
    bottom_width = RS(end);
    palm_start = bottom_width * 1.05;
    
    for row = 1:length(RS)
        if RS(row) > 0
            top = row;
            break
        end
    end
    
    for row = length(RS):-1:1
        if RS(row) > palm_start
            bottom = row;
            break
        end
    end
    
    for col = 1:length(CS)
        if CS(col) > 0
            left = col;
            break
        end
    end
    
    for col = length(CS):-1:1
        if CS(col) > 0
            right = col;
            break
        end
    end
        
        
    cut_BW = BW(top:bottom,left:right);

end

