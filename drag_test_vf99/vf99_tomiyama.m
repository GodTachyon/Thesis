% File paths
tomi1 = 'C:\Users\aswat\OneDrive - Cranfield University\Aswath CFD - Master Thesis\tecplot_data\drag_test\tomi_burns1';
tomi2 = 'C:\Users\aswat\OneDrive - Cranfield University\Aswath CFD - Master Thesis\tecplot_data\drag_test\tomi_burns2';
tomi280 = 'C:\Users\aswat\OneDrive - Cranfield University\Aswath CFD - Master Thesis\tecplot_data\drag_test\tomi_burns280';

% Read data of Re 297, Grace drag model, C_td of 1, mesh size 150 microns
data1 = readmatrix(tomi1);
x1 = data1(:, 2); % Column 2: x-coordinates
y1 = data1(:, 3); % Column 3: y-coordinates
dataPoints1 = data1(:, 4); % Column 4: data points
x1_abs = 0.002 - x1; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
dataPoints1 = round(dataPoints1, 2);

% Read data of Re 297, Grace drag model, C_td of 2, mesh size 150 microns
data2 = readmatrix(tomi2);
x2 = data2(:, 2); % Column 2: x-coordinates
y2 = data2(:, 3); % Column 3: y-coordinates
dataPoints2 = data2(:, 4); % Column 4: data points
x2_abs = 0.002 -x2; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints2 = round((1 - dataPoints2), 2);

% Read data of Re 297, Grace drag model, C_td of 280, mesh size 150 microns
data3 = readmatrix(tomi280);
x3 = data3(:, 2); % Column 2: x-coordinates
y3 = data3(:, 3); % Column 3: y-coordinates
dataPoints3 = data3(:, 4); % Column 4: data points
x3_abs = 0.002 - x3; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints3 = round((1 - dataPoints3), 2);


%% Rajora Data input manually

x_rajora = [0.9e-3 0.99e-3 1.2e-3 1.3e-3 1.4e-3 1.52e-3];
y_rajora = [1e-3 3e-3 5e-3 7e-3 9.1e-3 11e-3] + 18e-3;
vf_rajora = [0.99 0.99 0.99 0.99 0.99 0.99];


figure(1);
scatter(x_rajora, y_rajora, 36, vf_rajora, 'd', 'filled','MarkerFaceColor',"r");
hold on;
scatter(x1_abs, y1, 36, dataPoints1, 'o', 'filled', 'MarkerFaceColor',"b"); % m150, C_td of 1, rke model, Re 297
scatter(x2_abs, y2, 36, newDataPoints2, '>', 'filled','MarkerFaceColor',"g"); % m150, C_td of 2, rke model, Re 297
scatter(x3_abs, y3, 36, newDataPoints3,'s', 'filled', "MarkerFaceColor","m"); % m150, C_td of 2.8, rke model, Re 297
% Calculate the best fit line
p = polyfit(x_rajora, y_rajora, 1); % Linear fit
yfit = polyval(p, x_rajora);

% Plot the best fit line
plot(x_rajora, yfit, '-r', 'LineWidth', 1.5);
ylim([0.018 0.030]); % set limit for my simulated data
yticklabels({'0' '2' '4' '6' '8' '10' '12'});
title('99% Volume Fraction Contour Map for the Tomiyama drag model');
xlabel('X Axis [m]');
ylabel('Y Axis [m]');
xlim([0 2e-3]);
grid on;
legend('Rajora Data', 'Re297, C_{td} = 1.0', 'Re297, C_{td} = 2.0', 'Re297, C_{td} = 2.8', ...
     'Rajora - Best Fit Line', Location='southeast');
hold off;

% Add "x10^-3" next to the Y-axis label, rotated and placed at the top-left side
text(-0.00012, 0.030, 'x10^{-3}', 'FontSize', 10, 'Color', 'k', 'Rotation', 90, 'HorizontalAlignment', 'center');


