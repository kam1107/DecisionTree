function cf_matrix = confusionMatrixForDT(raw_data,t_labels)
% confusionMatrixForDT -  create confusion matrix with all the emotions
% Input:   
%       raw_data - initial data
%       t_labels - target labels in column
% Output:
%       cf_matrix - 6*6 (excluding false negative)

emo_labels_num = max(unique(t_labels));

pred_result = emotionPrediction(raw_data,t_labels);

% remove rows that both elements are 0
pred_result(all(pred_result==0,2),:) = [];
vals = ones(size(pred_result,1),1)';

cf_matrix = accumarray(pred_result,vals,[emo_labels_num,emo_labels_num]);



    
    
    