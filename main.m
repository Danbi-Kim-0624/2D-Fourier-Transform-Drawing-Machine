%% [AE 280] SW Application in Aerospace Engineering Final Project
% 20200057 김단비 Kim Danbi
% Make the Fourier Transform 2D Drawing Machine
% Change the image name and Run the code
clear all; close all; clc;

A = imread('nubjuk.jpg');    % the given image name
A = imresize(A, [500 500]); % Convert to 500x500 pixel
A = imrotate(A, -90);       % rotate because the image coordinate and plot coordinate is different.
%% N indicates the accuracy of drawing
N = 50;

% Make the set of Black Point which indicate the line
Black_Point = make_Black_Point(A);
Black_Point = make_Path(Black_Point);

%% Coefficient Matrix : c_n
coeff = zeros(2*N + 1, 1);
for k=1:2*N+1
    coeff(k) = coeff_cal(k, N, Black_Point);
end

%% 2D Fourier Transform Drawing
t = 0:0.001:1;
drawn_path = [];

%subplot(1, 3, 1);
for i=1:length(t)
    pos_center = [];    % center of the circles which which n > 0
    neg_center = [];    % center of the circles which which n < 0
    pos_radius = [];    % radius of the circles which which n > 0
    neg_radius = [];    % radius of the circles which which n < 0
    cla;                % We should clear the plot since the epicycles shoulld be changed
    xlim([-250, 250]);  % Fix the both coordinate
    ylim([-250, 250]);
    F_t = F_matrix(t(i), coeff, N); % Calculate the summation of coeff*(n)*exp(2*pi*i*n*t), n=-N ~ N
    % Calculate the center of each epicycles
    for k=1:N
        pos_center = [pos_center; [real(F_t(k)), imag(F_t(k))]];
        neg_center = [neg_center; [real(F_t(k)+ coeff(N+k+1)*exp(2*pi*1i*k*t(i))), imag(F_t(k)+ coeff(N+k+1)*exp(2*pi*1i*k*t(i)))]];   
        pos_radius = [pos_radius; abs(coeff(N+k+1))];
        neg_radius = [neg_radius; abs(coeff(N-k+1))];
    end
    viscircles(pos_center, pos_radius, 'LineWidth', 0.001, 'Color', '#C4C4C4'); hold on;
    viscircles(neg_center, neg_radius, 'LineWidth', 0.001, 'Color', '#C4C4C4'); hold on;
    % Connect the center of each epicycles by line segments
    for k=1:N-1
        p1 = pos_center(k, :);
        p2 = neg_center(k, :);
        p3 = pos_center(k+1, :);
        x = linspace(p1(1), p2(1));
        y = linspace(p1(2), p2(2));
        plot(x, y);
        x = linspace(p2(1), p3(1));
        y = linspace(p2(2), p3(2));
        plot(x, y);
    end
    % We should connect the last elements
    p0 = pos_center(N, :);
    p1 = neg_center(N, :);
    p2 = [real(F_t(end, :)), imag(F_t(end, :))];
    x = linspace(p1(1), p2(1));
    y = linspace(p1(2), p2(2));
    plot(x, y);
    x = linspace(p0(1), p1(1));
    y = linspace(p0(2), p1(2));
    plot(x, y);
    
    % Draw the approximated path
    pos = F_t(end, :);                                  % approximated result of f(t)
    drawn_path = [drawn_path; [real(pos), imag(pos)]];  % store the drawn path instead of 'hold on'
    plot(drawn_path(:, 1), drawn_path(:, 2), '-o', 'MarkerSize', 1, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'color', 'r');
    hold on
    
    pause(0)
end

% At last, remove all epicycles and show the final drawing result
cla;
xlim([-250, 250]);
ylim([-250, 250]);
plot(drawn_path(:, 1), drawn_path(:, 2), '-o', 'MarkerSize', 1, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r', 'color', 'r');