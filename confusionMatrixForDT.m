function cf_matrix = confusionMatrixForDT(raw_data,t_labels)
% confusionMatrixForDT -  create confusion matrix with all the emotions
% Input:   
%       raw_data - initial data
%       t_labels - target labels in column
% Output:
%       confusion matrix - 6*6 (excluding false negative)

% Constant
emo_labels_num = max(unique(t_labels));

% Initialize 
cf_matrix = zeros(emo_labels_num,emo_labels_num);

% go through all the emotions
for i = 1:emo_labels_num
    % transform data
    ft_lb = datatrans(raw_data,t_labels, i);

    % confusion matrix construction
    pre = emotionPrediction(ft_lb,i);
    real_with_pre_true = t_labels(pre==1);
    vals = ones(length(real_with_pre_true),1);
    aux_column = vals*i;    
    subs = [real_with_pre_true,aux_column];  
    tmp = accumarray(subs,vals,[emo_labels_num emo_labels_num]);
    cf_matrix = cf_matrix + tmp;
end



    
    
    