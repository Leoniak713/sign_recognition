function [ C ] = clust( RT, tolerance_width)
    level_min = RT(1);
    level_max = RT(1);
    level = [];
    C = [];
    
    for r = RT
        
        %jesteœmy u góry przedzia³u
        if r > (180 - tolerance_width)
            if (r > (level_min + tolerance_width)) || (r > (level_max - tolerance_width + 180))
                level = [level, r];
                if r < level_min
                    level_min = r;
                elseif r > level_max
                    level_max = r;
                end
            end
            
        %jesteœmy z do³u przedzia³u
        elseif r < tolerance_width
            if (r < (level_min + tolerance_width - 180)) || (r > (level_max - tolerance_width))
                level = [level, r];
                if r < level_min;
                    level_min = r;
                elseif r > level_max;
                    level_max = r;
                end
            end
            
        %jesteœmy we œrudku przedzia³u
        elseif (r < (level_min + tolerance_width)) && (r > (level_max - tolerance_width))
            level = [level, r];
            if r < level_min
                level_min = r;
            elseif r > level_max
                level_max = r;
            end
                
        %punkt wyszed³ poza tolerancjê
        else
            level_sum = 0;
            if (level(1) > (180 - tolerance_width)) || (level(1) < tolerance_width)
                for l = level
                    level_sum = level_sum + l;
                    if l < tolerance_width
                        level_sum = level_sum + 180;
                    end
                end
                level_mean = level_sum / length(level);
                if level_mean > 180
                    level_mean = level_mean - 180;
                end
            else
                level_mean = mean(level);
            end
            
            level = ones(size(level)) * level_mean;
            C = [C, level];
            level = r;
            level_min = r;
            level_max = r;
        end
        
    end
    
    level = ones(size(level)) * mean(level);
    C = [C, level];
end

