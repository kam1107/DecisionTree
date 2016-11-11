function pred_label = travelTree(tree,test_data)
% A recursion function used to traverse the tree until one label is assigned
% Input: tree -  a decision tree trained by the traning data
%        test_data - a row of test data(one example)
% Output: pre_label - a predicted label for this example

if ~isempty(tree.class)
    pred_label = tree.class;
    return;
end

% Choose attri
if(test_data(1,tree.op(1)) < tree.op(2))
    pred_label = travelTree(tree.kids{1},test_data);
else
    pred_label = travelTree(tree.kids{2},test_data);
end
    
