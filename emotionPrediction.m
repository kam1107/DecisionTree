function pred_result = emotionPrediction(raw_data,t_labels)
% This funciton applied k-fold cross validation on the transferred data
% Input: raw_data - initial data
%        t_labels - target labels in column
% Output: emo_idx  -  an array contains 0s and 1s indicating the predicted
%                     emotion(predicted to be n, then equals 1, otherwise 0)

% Constant
k = 10;  % 10 fold cross validation 
num_examples = size(raw_data,1);

% data partition
r = mod(num_examples,k);
set_sizes = zeros(1,k);
set_sizes(1,1:r) = floor(num_examples/k)+1;
set_sizes(1,r+1:end) = floor(num_examples/k);

% for every k-cross validation iteration, select indices from indxpool for
% training and validation sets
idxpool = randperm(num_examples);

% predict result for test data, first column is prediction, second column is actual label
pred_result = zeros(num_examples,2);

% k-fold cross validation (6 trees generated at each fold)
for i = 1:k 
    for em = 1:max(unique(t_labels))
        ft_lb = datatrans(raw_data,t_labels,em);
        % test set
        tst_start = sum(set_sizes(1:i-1))+1;
        tst_end = tst_start+set_sizes(i)-1;  
        tst_idx = idxpool(tst_start:tst_end);
        tst_data = ft_lb(tst_idx,1:end-1);
        
        % training set
        trn_idx = idxpool(setdiff(1:end,tst_start:tst_end));
        tree = createDtree(ft_lb(trn_idx,:),em,i); 
        
        % test
        for j = 1:size(tst_data,1)
            if (travelTree(tree,tst_data(j,:)))
                pred_result(tst_idx(j),1) = em;
                pred_result(tst_idx(j),2) = ft_lb(tst_idx(j),end);
            end
        end
    end   
end
