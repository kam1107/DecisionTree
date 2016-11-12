function cf_matrix = confusionMatrixForDT(raw_data,t_labels)
% confusionMatrixForDT -  create confusion matrix with all the emotions
% Input:   
%       raw_data - initial data
%       t_labels - target labels in column
% Output:
%       confusion matrix - 6*6 (excluding false negative)

emo_labels_num = max(unique(t_labels));

pred_result = emotionPrediction(raw_data,t_labels);

labels = [pred_result(:,3),pred_result(:,1)];
% remove rows that both elements are 0
labels(all(labels==0,2),:) = [];
vals = ones(size(labels,1),1)';

cf_matrix = accumarray(labels,vals,[emo_labels_num,emo_labels_num]);



    
    
    