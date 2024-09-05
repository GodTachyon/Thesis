% File paths
filePath1 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Re796_vf99\Re796_rke_burns050';
filePath2 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Re796_vf99\Re796_rke_burns080';
filePath3 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Re796_vf99\Re796_rke_burns1';
filePath4 = 'C:\Users\aswat\OneDrive - Cranfield University\Documents\MATLAB\Master thesis\Re796_vf99\Re796_rke_burns020';


% Read data of Re 796, C_td of 0.5, mesh size 150 microns
data1 = readmatrix(filePath1);
x1 = data1(:, 2); % Column 2: x-coordinates
y1 = data1(:, 3); % Column 3: y-coordinates
dataPoints1 = data1(:, 4); % Column 4: data points
x1_abs = 0.002 - x1; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
dataPoints1 = round(dataPoints1, 2);

% Read data of Re 796, C_td of 0.8, mesh size 150 microns
data2 = readmatrix(filePath2);
x2 = data2(:, 2); % Column 2: x-coordinates
y2 = data2(:, 3); % Column 3: y-coordinates
dataPoints2 = data2(:, 4); % Column 4: data points
x2_abs = 0.002 -x2; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints2 = round((1 - dataPoints2), 2);

% Read data of Re 796, C_td of 1.0, mesh size 150 microns
data3 = readmatrix(filePath3);
x3 = data3(:, 2); % Column 2: x-coordinates
y3 = data3(:, 3); % Column 3: y-coordinates
dataPoints3 = data3(:, 4); % Column 4: data points
x3_abs = 0.002 - x3; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints3 = round((1 - dataPoints3), 2);

% Read data of Re 796, C_td of 0.2, mesh size 150 microns
data4 = readmatrix(filePath4);
x4 = data4(:, 2); % Column 2: x-coordinates
y4 = data4(:, 3); % Column 3: y-coordinates
dataPoints4 = data4(:, 4); % Column 4: data points
x4_abs = 0.002 - x4; % Mainpulate x-axis coordinates to match Rajora data
% Round data points to 2 decimal places
newDataPoints4 = round((1 - dataPoints4), 2);



%% Rajora Data input manually

x_rajora = [0.8e-3 0.6e-3 0.65e-3 0.55e-3 0.65e-3 0.82e-3];
y_rajora = [1e-3 3e-3 5e-3 7e-3 9.1e-3 11e-3] + 18e-3;
error_red = [0.2e-3, 0.04e-3, 0.37e-3, 0.07e-3, 0.3e-3, 0.55e-3]; % horizontal error values for red points


figure(1);
% Fit a linear model to the red data points
%x_fit = [0.52e-3, 0.7e-3];
%y_fit = [1e-3, 11e-3];
hold on;
% Plot the red points with horizontal error bars
errorbar(x_rajora, y_rajora, error_red, 'horizontal', 'ro', 'MarkerFaceColor', 'r');
% plot(x_fit,y_fit,'--r');
scatter(x4_abs, y4, 36, newDataPoints4,'<', 'filled', "MarkerFaceColor","g"); % m150, C_td of 0.2, rke model, Re 796
scatter(x1_abs, y1, 36, dataPoints1, 'o', 'filled', 'MarkerFaceColor',"b"); % m150, C_td of 0.5, rke model, Re 796
% scatter(x2_abs, y2, 36, newDataPoints2, '>', 'filled','MarkerFaceColor',"g"); % m150, C_td of 0.8, rke model, Re 796
scatter(x3_abs, y3, 36, newDataPoints3,'s', 'filled', "MarkerFaceColor","k"); % m150, C_td of 1.0, rke model, Re 796

% Calculate the best fit line
x_fit = [0.6e-3, 0.8e-3];
y_fit = [0, 12e-3] + 18e-3;

% Plot the best fit line
plot(x_fit, y_fit, '--r', 'LineWidth', 1.5);
ylim([0.018 0.030]); % set limit for my simulated data
yticklabels({'0' '2' '4' '6' '8' '10' '12'});
title('99% Volume Fraction Contour Map - 150 micron mesh');
xlabel('X Axis [m]');
ylabel('Y Axis [m]');
xlim([0 2e-3]);
grid on;
legend('Pang et.al', 'Re796, C_{td} = 0.2', 'Re796, C_{td} = 0.5', ...
      'Re796, C_{td} = 1.0', 'Pang et.al - Best Fit', Location='southeast');
hold off;

% Add "x10^-3" next to the Y-axis label, rotated and placed at the top-left side
text(-0.00012, 0.030, 'x10^{-3}', 'FontSize', 10, 'Color', 'k', 'Rotation', 90, 'HorizontalAlignment', 'center');

%%
% Define the data
x_rajora = [0.8e-3, 0.6e-3, 0.65e-3, 0.55e-3, 0.65e-3, 0.82e-3];
y_rajora = [1e-3, 3e-3, 5e-3, 7e-3, 9.1e-3, 11e-3];
vf_rajora = [0.99, 0.99, 0.99, 0.99, 0.99, 0.99];

% Plot the scatter plot
figure;
scatter(x_rajora, y_rajora, 36, vf_rajora, 'd', 'filled', 'MarkerFaceColor', 'r');
hold on;

% Calculate the best fit line
x_fit = [0.6e-3, 0.8e-3];
y_fit = [0, 12e-3];

% Plot the best fit line
plot(x_fit, y_fit, '-b', 'LineWidth', 1.5);

% Set plot limits
ylim([0, 12e-3]);
yticks(0:2e-3:12e-3);
% yticklabels({'0', '2', '4', '6', '8', '10', '12'});

% Set title and labels
title('99% Volume Fraction Contour Map - 150 micron mesh');
xlabel('X Axis [m]');
ylabel('Y Axis [m]');

% Set x-axis limit
xlim([0, 2e-3]);

% Enable grid
grid on;

% Add legend
legend('Rajora Data', 'Best Fit Line', 'Location', 'southeast');

hold off;

%%

% Example data for red points
x_red = [0.8e-3, 0.6e-3, 0.65e-3, 0.55e-3, 0.65e-3, 0.82e-3]; % x values for red points
y_red = [1e-3, 3e-3, 5e-3, 7e-3, 9.1e-3, 11e-3];           % y values for red points
error_red = [0.2e-3, 0.04e-3, 0.5e-3, 0.07e-3, 0.3e-3, 0.7e-3]; % horizontal error values for red points

% Create the plot
figure;
hold on;

% Fit a linear model to the red data points
x_fit = [0.52e-3, 0.7e-3];
y_fit = [1e-3, 11e-3];

% Plot the red points with horizontal error bars
errorbar(x_red, y_red, error_red, 'horizontal', 'ro', 'MarkerFaceColor', 'r');
plot(x_fit,y_fit,'r--');

% Add labels and legend
xlabel('x (mm)');
ylabel('z - h (mm)');
legend('99%', 'Fit line');
title('Red Data Points with Best Fit Line and Error Bars');

% Adjust the axis limits
xlim([0, 2e-3]);
ylim([0, 12e-3]);

hold off;



