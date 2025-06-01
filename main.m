% RIS Reflection Coefficient Visualization
clc; clear;

% Define ranges
theta = linspace(0, pi, 100);  % Incident angle (0 to 180 degrees)
f = linspace(1e9, 10e9, 100);  % Frequency range: 1 GHz to 10 GHz

% Create meshgrid
[THETA, FREQ] = meshgrid(theta, f);

% Simulated phase shift function (example: linear)
PHASE = pi * sin(THETA) .* log10(FREQ / 1e9);  % phase in radians

% Reflection coefficient (unit magnitude with phase shift)
Gamma = exp(1j * PHASE);

% Extract magnitude and phase
Mag = abs(Gamma);          % Should be ~1 (unit magnitude)
Phase_deg = angle(Gamma) * (180/pi);  % Phase in degrees

% Plotting
figure;
surf(THETA * 180/pi, FREQ / 1e9, Phase_deg);
xlabel('Incident Angle (°)');
ylabel('Frequency (GHz)');
zlabel('Phase Shift (°)');
title('RIS Reflection Coefficient Phase Response');
colorbar;
shading interp;
