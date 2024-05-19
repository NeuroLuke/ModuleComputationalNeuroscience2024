%==========================================================================
% This script shows an example of how a perceptron performs its
% computations.
%
% Lukas Kunz, 2024
%==========================================================================

% start
clear; clc; close all;

% data points
data = [
    1, 2; ...
    2, 3; ...
    3, 3; ...
    2, 1]; % four data points
labels = [
    1; ...
    1; ...
    -1; ...
    -1]; % class labels for the four data points
noMisclassifications = false;

% initialize weights and bias as zeros
weights = [0; 0];
bias = 0;

% report
fprintf('\nExample computations performed by a perceptron.\n')
fprintf('\nInitial weights: [%d; %d].\n', weights(1), weights(2));
fprintf('Initial bias: %d.\n', bias);

%% iterative estimation of weights and bias

% perform iterations until no misclassifications exist
iIteration = 0;
while noMisclassifications == false

    % report
    iIteration = iIteration + 1;
    fprintf('\nIteration: %d.\n', iIteration);

    % store misclassification information for all samples
    isMisclassification = true(size(data, 1), 1);

    % loop through data points
    for iData = 1:size(data, 1)

        % check whether weights and bias shall be updated
        isMisclassification(iData, 1) = checkForMisclassification(weights, bias, data(iData, :)', labels(iData, 1));

        % report
        fprintf('\n\tData sample #%d.\n', iData);
        fprintf('\tIs a misclassification: %d.\n', isMisclassification(iData, 1));

        % update weights and bias if necessary
        if isMisclassification(iData, 1) == true

            % update weights and bias
            [weights, bias] = updateWeightsAndBias(weights, bias, data(iData, :)', labels(iData, 1));
        end

        % report
        fprintf('\tCurrent weights: [%d; %d].\n', weights(1), weights(2));
        fprintf('\tCurrent bias: %d.\n', bias);
    end

    % check whether there were no misclassifications
    if all(isMisclassification == false)
        noMisclassifications = true;

        % report
        fprintf('\nReached a state of no misclassifications.\n');
    end
end

% estimate the decision boundary using a range of x-values
% decision boundary:
%   w1 * x1 + w2 * x2 + b = 0
%   x2 = -1 * (w1 * x1 + b) / w2
xDecision = -10:0.01:10;
yDecision = -1 * (weights(1) * xDecision + weights(2)) / weights(2);

%% figure of results

% create figure
figure('units', 'centimeters', 'position', [2, 2, 8, 8], 'Color', [1, 1, 1]);
axes('units', 'centimeters', 'position', [1.5, 1.65, 6, 6]);
hold on;
% data from both classes
plot(data(labels == 1, 1), data(labels == 1, 2), '.', 'Color', [1, 0, 0], 'MarkerSize', 30);
plot(data(labels == -1, 1), data(labels == -1, 2), 'x', 'Color', [0, 0, 1], 'MarkerSize', 15, 'LineWidth', 4);
set(gca, 'xlim', [0, 4], 'ylim', [0, 4], 'tickdir', 'out');
% decision boundary
plot(xDecision, yDecision, '-', 'LineWidth', 2, 'Color', [0.5, 0.8, 0]);
% axes
xl = xlabel('Feature 1');
yl = ylabel('Feature 2');
set([gca, xl, yl], 'fontunits', 'centimeters', 'fontsize', 0.5);
