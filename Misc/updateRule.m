function bUpdate = updateRule(w, b, xi, yi)
%
% updateRule estimates whether weights (w) and bias (b) need to be updated
% given a data sample (xi) and its label (yi).
%
% Input:
%   w: weights
%   b: bias
%   xi: data sample
%   yi: label
%
% Lukas Kunz, 2024

tmp = yi * (dot(w, xi) + b);
bUpdate = tmp <= 0;

end