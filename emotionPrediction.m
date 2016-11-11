function emo_idx = emotionPrediction(ft_lb,n)
% This funciton applied k-cross validation on the transferred data
% Input: ft_lb   -  attribute with labels
%        n       -  an emotion label (1-6)
% Output: emo_idx  -  an array contains 0s and 1s indicating the predicted
%                     emotion(predicted to be n, then equals 1, otherwise 0)


% Constant
k = 10;  % 10 fold 
num_examples = size(ft_lb,1);

% data partition
r = mod(num_examples,k);
set_sizes = zeros(1,k);
set_sizes(1,1:r) = floor(num_examples/k)+1;
set_sizes(1,r+1:end) = floor(num_examples/k);

% for every k-cross validation iteration, select indices from indxpool for
% training and validation sets
idxpool = randperm(num_examples);

% emotion index
emo_idx = zeros(num_examples,1);

% k-cross validation
for i = 1:k    
    tst_start = sum(set_sizes(1:i-1))+1;
    tst_end = tst_start+set_sizes(i)-1;   
    tst_idx = idxpool(tst_start:tst_end);
    
    trn_idx = idxpool(setdiff(1:end,tst_start:tst_end));
    tree = createDtree(ft_lb(trn_idx,:),n,i);  
    test_data = ft_lb(tst_idx,:);
      
    for j = 1:size(test_data,1)
       if (travelTree(tree,test_data(j,:)))
          emo_idx(tst_idx(j)) = 1; 
       end
    end  
end