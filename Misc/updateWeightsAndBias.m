function [w, b] = updateWeightsAndBias(w, b, xi, yi)
%
% updateWeightsAndBias updates the weights and bias given a data sample and
% its corresponding label.
%
% Input:
%   w: weights
%   b: bias
%   xi: data sample
%   yi: label
%
% Output:
%   w: updated weights
%   b: updated bias
%
% Lukas Kunz, 2024

% update the weights
w = w + yi * xi;

% update the bias
b = b + yi;