function tree = createDtree(tree_data,emo_label,folder_num)
% createDtree - function to create dicision tree
% Input: tree_data    - traning data sets for decision tree generation
%        emo_label            - emotion label
%        folder_num           - folder number
% Output: a tree


% Initialise active attribute index array
active_attrib_idx = ones(1,size(tree_data,2)-1);

% Build tree
tree = ID3(tree_data,active_attrib_idx);

% Draw tree - uncomment to view trees generated from each folder
% DrawDecisionTree(tree,string(n)+'-'+string(i));
