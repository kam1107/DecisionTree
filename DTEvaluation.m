function [cf_matrix,evl_matrix] = DTEvaluation()
% Output: cf_matrix: a confusion matrix
%         evl_matrix: overall average recall, precision and f1, and 
%                     average recall, precision and f1 measure for each
%                     emotion

load('emotions_data_66.mat');

cf_matrix = confusionMatrixForDT(x,y);

output = recallPrecision(cf_matrix,y);

disp('      Ave       E1        E2        E3        E4         E5        E6');
disp(output);

