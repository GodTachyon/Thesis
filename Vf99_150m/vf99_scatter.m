% File paths
filePath1 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Vf99_150m\Re297_vf99_ASCII.dat';
filePath2 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Vf99_150m\Re297_vf99_rke_burns280.dat';
filePath3 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Vf99_150m\Re297_vf99_rke_burns220.dat';
filePath4 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Vf99_150m\Re297_vf99_rke_burns260.dat';
filePath5 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Vf99_150m\Re297_vf99_rke_burns1.dat';

% Read data of Re 297, C_td of 2, mesh size 150 microns
data1 = readmatrix(filePath1);
x1 = data1(:, 2); % Column 2: x-coordinates
y1 = data1(:, 3); % Column 3: y-coordinates
dataPoints1 = data1(:, 4); % Column 4: data points
x1_abs = 0.002 - x1; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
dataPoints1 = round(dataPoints1, 2);

% Read data of Re 297, C_td of 2.8, mesh size 150 microns
data2 = readmatrix(filePath2);
x2 = data2(:, 2); % Column 2: x-coordinates
y2 = data2(:, 3); % Column 3: y-coordinates
dataPoints2 = data2(:, 4); % Column 4: data points
x2_abs = 0.002 -x2; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints2 = round((1 - dataPoints2), 2);

% Read data of Re 297, C_td of 2.2, mesh size 150 microns
data3 = readmatrix(filePath3);
x3 = data3(:, 2); % Column 2: x-coordinates
y3 = data3(:, 3); % Column 3: y-coordinates
dataPoints3 = data3(:, 4); % Column 4: data points
x3_abs = 0.002 - x3; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints3 = round((1 - dataPoints3), 2);

% Read data of Re 297, C_td of 2.6, mesh size 150 microns
data4 = readmatrix(filePath4);
x4 = data4(:, 2); % Column 2: x-coordinates
y4 = data4(:, 3); % Column 3: y-coordinates
dataPoints4 = data4(:, 4); % Column 4: data points
x4_abs = 0.002 - x4; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints4 = round((1 - dataPoints4), 2);

% Read data of Re 297, C_td of 1, mesh size 150 microns
data5 = readmatrix(filePath5);
x5 = data5(:, 2); % Column 2: x-coordinates
y5 = data5(:, 3); % Column 3: y-coordinates
dataPoints5 = data5(:, 4); % Column 4: data points
x5_abs = 0.002 - x5; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints5 = round((1 - dataPoints5), 2);


%% Rajora Data input manually

x_rajora = [0.9e-3 0.99e-3 1.2e-3 1.3e-3 1.4e-3 1.52e-3];
y_rajora = [1e-3 3e-3 5e-3 7e-3 9.1e-3 11e-3] + 18e-3;
vf_rajora = [0.99 0.99 0.99 0.99 0.99 0.99];


figure(1);
scatter(x_rajora, y_rajora, 36, vf_rajora, 'd', 'filled','MarkerFaceColor',"r");
hold on;
scatter(x5_abs, y5, 36, newDataPoints5, '<', 'filled','MarkerFaceColor',"k"); % m100, C_td of 1.0, rke model, Re 297
scatter(x1_abs, y1, 36, dataPoints1, 'o', 'filled', 'MarkerFaceColor',"b"); % m150, C_td of 2, rke model, Re 297
% scatter(x3_abs, y3, 36, newDataPoints3,'s', 'filled', "MarkerFaceColor","m"); % m150, C_td of 2.2, rke model, Re 297
% scatter(x4_abs, y4, 36, newDataPoints4,'v', 'filled', "MarkerFaceColor","y"); % m150, C_td of 2.6, rke model, Re 297
scatter(x2_abs, y2, 36, newDataPoints2, '>', 'filled','MarkerFaceColor',"g"); % m150, C_td of 2.8, rke model, Re 297
% Calculate the best fit line
p = polyfit(x_rajora, y_rajora, 1); % Linear fit
yfit = polyval(p, x_rajora);

% Plot the best fit line
plot(x_rajora, yfit, '-r', 'LineWidth', 1.5);
ylim([0.018 0.030]); % set limit for my simulated data
yticklabels({'0' '2' '4' '6' '8' '10' '12'});
title('99% Volume Fraction Contour Map - 150 micron mesh');
xlabel('X Axis [m]');
ylabel('Y Axis [m]');
xlim([0 2e-3]);
grid on;
legend('Pang et.al', 'Re297, C_{td} = 1.0', 'Re297, C_{td} = 2.0', ...
      'Re297, C_{td} = 2.8','Pang et.al - Best Fit', Location='southeast');
hold off;

% Add "x10^-3" next to the Y-axis label, rotated and placed at the top-left side
text(-0.00012, 0.030, 'x10^{-3}', 'FontSize', 10, 'Color', 'k', 'Rotation', 90, 'HorizontalAlignment', 'center');


