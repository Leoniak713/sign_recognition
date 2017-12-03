function [] = test_main()
% Plots graph and sets up a custom data tip update function
fig = figure('DeleteFcn','doc datacursormode');
X = 0:60;
t = (X)*0.02;
Y = sin(-16*t);
dcm_obj = datacursormode(fig);
set(dcm_obj,'UpdateFcn',{@myupdatefcn,t});
figure;
plot(X,Y);
end

