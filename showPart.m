function [deg_trace] = showPart( X, Y, check_start, check_stop )

    %der_steps = 50;
    %check_start = 1;
    %check_stop = 1;
    
    
    dX = NStepDer(X, der_steps);
    dY = NStepDer(Y, der_steps);
    
    radian_trace = atan2(dY, dX);
    deg_trace = ParallelAbs(-radian_trace) / pi * 180;
    
%    plot(radian_trace,'.'); title('orginal trace'); figure;
%    plot([1:length(radian_trace),1:length(radian_trace)], [radian_trace, radian_trace + 2*pi], '.'); title('continuous trace'); figure;
%    plot(deg_trace,'.'); title('degree trace'); %figure;
%    plot(cutOut(radian_trace, check_start, check_stop)); title('cut trace'); figure;
%    plot(X, Y, '.'); title('orginal bounds'); figure;
    plot(cutOut(X, check_start, check_stop), cutOut(Y, check_start, check_stop), '.'); title('cut bounds');

end

