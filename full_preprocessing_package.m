function [radian_trace] = full_preprocessing_package( image_name , der_steps, clustering_width)
    %Funkcja wyciaga hisotire k¹tow¹ drogi
    
    image = imread(image_name);
    
    BW = filtr2(image);
    
    filled_BW = imfill(BW, 'holes');
    
    [X, Y] = GetBounds(filled_BW);
    
    dX = NStepDer(X, der_steps);
    dY = NStepDer(Y, der_steps);
    
    radian_trace = atan2(dY, dX);
    deg_trace = ParallelAbs(-radian_trace) / pi * 180;
    
    clust_trace = clust(deg_trace, clustering_width);
    
   % plot(radian_trace, '.'); figure; 
    plot(deg_trace, '.'); title('degree trace');  figure; 
    plot(clust_trace); title('clusted trace');
    %plot(sind(deg_trace), '.'); figure; 
    %plot(cutOut(radian_trace, check_start, check_stop)); figure; 
    %plot(cutOut(X, check_start, check_stop), cutOut(Y, check_start, check_stop), '.'); figure; 
    %imshow(filled_BW); figure; 
    %plot(X, Y, '.'); figure; 
    %visboundaries(BW);
    
end

