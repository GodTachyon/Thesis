
%% Import data set. X axis is column 1 and Y axis is column 2.
inlet_297 = importdata("Master thesis\Inlet profile\Re297_test_profile2.dat");
inlet_796 = importdata("Master thesis\Inlet profile\Re796_inlet_profile.dat");
inlet_1211 = importdata("Master thesis\Inlet profile\Re1211_inlet_profile.dat");
inlet_1419 = importdata("Master thesis\Inlet profile\Re1419_inlet_profile.dat");


%% Inlet Profile for Re 297
figure (1)
plot(inlet_297(:,1),inlet_297(:,2),'-k','LineWidth',2);
xlabel('X-axis');
ylabel('Velocity magnitude [m/s]');
grid on
coefficients_297 = polyfit(inlet_297(:,1),inlet_297(:,2),2);
x_297 = linspace(-0.002,0.002,100);
y_297 = coefficients_297(:,1)*x_297.^2 + coefficients_297(:,2)*x_297 + coefficients_297(:,3);
hold on
eqn_297 = sprintf('y = %.2fx^2 + %.2fx + %.2f', coefficients_297(:,1), coefficients_297(:,2), coefficients_297(:,3));
text(0.5, 5.5, eqn_297);
plot(x_297,y_297,'ro','LineWidth',1);
legend('Re297-Fine data','Best fit points');
hold off
disp('Inlet equation for Re 297 is');
disp(eqn_297);
%% Inlet Profile for Re 796

figure (2)
plot(inlet_796(:,1),inlet_796(:,2),'-k','LineWidth',2);
xlabel('X-axis');
ylabel('Velocity magnitude [m/s]');
grid on
coefficients_796 = polyfit(inlet_796(:,1),inlet_796(:,2),2);
x_796 = linspace(-0.002,0.002,100);
y_796 = coefficients_796(:,1)*x_796.^2 + coefficients_796(:,2)*x_796 + coefficients_796(:,3);
hold on
eqn_796 = sprintf('y = %.2fx^2 + %.2fx + %.2f', coefficients_796(:,1), coefficients_796(:,2), coefficients_796(:,3));
text(0.5, 5.5, eqn_796);
plot(x_796,y_796,'ro','LineWidth',1);
legend('Re796-Fine data','Best fit points');
hold off
disp('Inlet_796 equation for Re 796 is');
disp(eqn_796);

%% Test half space in x-axis

% figure (3)
% plot(inlet_796(:,1),inlet_796(:,2),'-k','LineWidth',2);
% xlabel('X-axis');
% ylabel('Velocity magnitude [m/s]');
% grid on
% coefficients_796 = polyfit(inlet_796(:,1),inlet_796(:,2),2);
% x_796 = linspace(0,0.002,100);
% y_796 = coefficients_796(:,1)*x_796.^2 + coefficients_796(:,2)*x_796 + coefficients_796(:,3);
% hold on
% eqn_796 = sprintf('y = %.2fx^2 + %.2fx + %.2f', coefficients_796(:,1), coefficients_796(:,2), coefficients_796(:,3));
% text(0.5, 5.5, eqn_796);
% plot(x_796,y_796,'ro','LineWidth',1);
% legend('Re796-Fine data','Best fit points');
% hold off
% disp('Inlet_796 equation for Re 796 is');
% disp(eqn_796);

%% Inlet Profile for Re 1211

figure (4)
plot(inlet_1211(:,1),inlet_1211(:,2),'-k','LineWidth',2);
xlabel('X-axis');
ylabel('Velocity magnitude [m/s]');
grid on
coefficients_1211 = polyfit(inlet_1211(:,1),inlet_1211(:,2),4);
x_1211 = linspace(-0.002,0.002,100);
y_1211 = coefficients_1211(:,1)*x_1211.^4 + coefficients_1211(:,2)*x_1211.^3 + coefficients_1211(:,3)*x_1211.^2 + ... 
coefficients_1211(:,4)*x_1211 + coefficients_1211(:,5);
hold on
eqn_1211 = sprintf('y = %.2fx^2 + %.2fx + %.2f', coefficients_1211(:,1), coefficients_1211(:,2), coefficients_1211(:,3));
text(0.5, 5.5, eqn_1211);
plot(x_1211,y_1211,'ro','LineWidth',1);
legend('Re1211-Fine data','Best fit points');
hold off
disp('Inlet_1211 equation for Re 1211 is');
disp(eqn_1211);

%% Inlet Profile for Re 1419

figure (5)
plot(inlet_1419(:,1),inlet_1419(:,2),'-k','LineWidth',2);
xlabel('X-axis');
ylabel('Velocity magnitude [m/s]');
grid on
coefficients_1419 = polyfit(inlet_1419(:,1),inlet_1419(:,2),4);
x_1419 = linspace(-0.002,0.002,100);
y_1419 = coefficients_1419(:,1)*x_1419.^4 + coefficients_1419(:,2)*x_1419.^3 + coefficients_1419(:,3)*x_1419.^2 + ...
coefficients_1419(:,4)*x_1419 + coefficients_1419(:,5);
hold on
eqn_1419 = sprintf('y = %.2fx^2 + %.2fx + %.2f', coefficients_1419(:,1), coefficients_1419(:,2), coefficients_1419(:,3));
text(0.5, 5.5, eqn_1419);
plot(x_1419,y_1419,'ro','LineWidth',1);
legend('Re1419-Fine data','Best fit points');
hold off
disp('Inlet_1419 equation for Re 1419 is');
disp(eqn_1419);
