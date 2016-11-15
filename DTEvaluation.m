function cf_matrix = DTEvaluation()
% Output: a confusion matrix, average recall,
%         precision and f1 measure

load('emotions_data_66.mat');

cf_matrix = confusionMatrixForDT(x,y);

[avgrecall,avgprecision] = recallPrecision(cf_matrix,y);
fa = fameasure(avgrecall,avgprecision,1);
fprintf('Recall: %i\nPrecision: %i\nf1:%i\n', avgrecall,avgprecision,fa);






