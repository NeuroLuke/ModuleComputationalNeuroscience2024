function isMisclassification = checkForMisclassification(w, b, xi, yi)
%
% checkForMisclassification estimates whether weights (w) and bias (b) lead
% to a misclassification given a data sample (xi) and its label (yi). If
% so, the weights and bias should be updated in the next step.
%
% Input:
%   w: weights
%   b: bias
%   xi: data sample
%   yi: label
%
% Lukas Kunz, 2024

tmp = yi * (dot(w, xi) + b);
isMisclassification = tmp <= 0;

end