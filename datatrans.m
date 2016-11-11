function ft_lb = datatrans(n)

% functioni datatrans transfers 'emotions_data.66.mat' to a form that
% label is concatenated to features (612*133), where label is a column
% vector with 1 for targeted class (n) and 0 for the rest

load('emotions_data_66.mat');

num_cls = max(unique(y));

if n > num_cls
    error('Input should be less than class number');
end

posidx = y==n;
negidx = y~=n;
label = y;
label(posidx) = 1;
label(negidx) = 0;

ft_lb = [x,label];
