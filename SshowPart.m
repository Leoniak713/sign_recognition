function [radian_trace] = SshowPart( X, Y, der_steps )

    %der_steps = 50;
    check_start = 1;
    check_stop = 1;
    
    sdX = SmoothedNStepDer(X, der_steps);
    sdY = SmoothedNStepDer(Y, der_steps);
    
    radian_trace = atan2(sdY, sdX);
    deg_trace = ParallelAbs(-radian_trace) / pi * 180;
    
%    plot(radian_trace,'.'); title('orginal trace'); figure;
%    plot([1:length(radian_trace),1:length(radian_trace)], [radian_trace, radian_trace + 2*pi], '.'); title('continuous trace'); figure;
    plot(deg_trace,'.'); title('degree trace'); %figure;
%    plot(cutOut(radian_trace, check_start, check_stop)); title('cut trace'); figure;
%    plot(X, Y, '.'); title('orginal bounds'); figure;
%    plot(cutOut(X, check_start, check_stop), cutOut(Y, check_start, check_stop), '.'); title('cut bounds');

end

