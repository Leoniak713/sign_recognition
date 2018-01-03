function [ C ] = clust( RT, tolerance_width)
    level_min = RT(1);
    level_max = RT(1);
    level = [];
    C = [];
    
    for r = RT
        
        %jeste�my u g�ry przedzia�u
        if r > (180 - tolerance_width) %sprawdzamy czy jest w przedziale
            if (r < (level_min + tolerance_width)) || (r > (level_max - tolerance_width + 180))
                %punkt jest ponad minimum o mniej niz TW lub pod maximum o mniej niz TW
                level = [level, r]; %dodajemy do levelu
                if r < level_min %jesli jest nizszy od minimum
                    level_min = r; %zmieniamy minimum
                elseif (r > level_max) && (level_max > tolerance_width) 
                    %jesli jest wyzszy od maximum, a to nie moze byc przewiniete
                    level_max = r; %zmieniamy maximum
                end
            else %jesli wyszlismy poza przedzial
                [level, level_min, level_max, C] = clust_level(level, level_min, level_max, C, tolerance_width, r); %wrzucamy rzeczy do clusta
            end
            
        %jeste�my z do�u przedzia�u
        elseif r < tolerance_width %sprawdzamy czy jest w przedziale
            if (r < (level_min + tolerance_width - 180)) || (r > (level_max - tolerance_width))
                %punkt jest ponad minimum o mniej niz TW lub pod maximum o mniej niz TW
                level = [level, r];
                if (r < level_min) && (level_min <  180 - tolerance_width) 
                    %jesli jest nizszy od minimum, a to nie moze byc przewiniete
                    level_min = r;
                elseif r > level_max
                    level_max = r;
                end
            else
                [level, level_min, level_max, C] = clust_level(level, level_min, level_max, C, tolerance_width, r);
            end
            
        %jeste�my we �rodku przedzia�u
        else
            if (r < (level_min + tolerance_width)) && (r > (level_max - tolerance_width))
                level = [level, r];
                if r < level_min
                    level_min = r;
                elseif r > level_max
                    level_max = r;
                end
            else
                [level, level_min, level_max, C] = clust_level(level, level_min, level_max, C, tolerance_width, r);
            end
        %punkt wyszed� poza tolerancj�
        end
    end
    
    %[~, ~, ~, C] = clust_level(level, level_min, level_max, C, tolerance_width, 0);

end

function [level, level_min, level_max, C] = clust_level(level, level_min, level_max, C, tolerance_width, r)

level_sum = 0;
%jesli min i max sa przewiniete
if (level_min > (180 - tolerance_width)) || (level_max < tolerance_width)
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
%jesli min i max nie sa przewiniete
else
    level_mean = mean(level);
end

level = ones(size(level)) * level_mean;
C = [C, level];
level = r;
level_min = r;
level_max = r;

end