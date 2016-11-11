function [avgrecall,avgprecision] = recallPrecision(cf_matrix)
% recallprecision is a function that calculates the average recall and
% precision rate of a confusion matrix

% true positive for each class
trpos = diag(cf_matrix);
% all positive examples of each class
all_pos = sum(cf_matrix,2)+eps;

% all retrived examples of each class
all_retr = sum(cf_matrix,1)'+eps;

% avg recall
avgrecall = sum(trpos./all_pos)/length(trpos);
% avg precision
avgprecision = sum(trpos./all_retr)/length(trpos);
