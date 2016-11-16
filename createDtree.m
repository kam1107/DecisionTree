function tree = createDtree(tree_data,emo_label,fold_num)
% createDtree - function to create dicision tree
% Input: tree_data    - traning data sets for decision tree generation
%        emo_label            - emotion label
%        fold_num           - fold number
% Output: a tree

% Build tree
tree = ID3(tree_data);

% Draw tree - uncomment to view trees generated from each fold
%DrawDecisionTree(tree,string(emo_label)+'-'+string(fold_num));
