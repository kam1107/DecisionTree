function [tree] = ID3(ft_lb)
% ID3 -  Runs the ID3 algorithm on the matrix 
% Input: ft_lb              - initial matrix with labels concatenated in each 
%                             end of the row, in which rows represent  examples, 
%                             columns for attributes and the final column are labels
%
% Output: tree
% tree struct
%       op          - label for corresponding node
%                     (attribute and threshold, empty for leaf node)
%       kids        - a cell array which contain the left and right subtree 
%                     ([] when it is a leaf node)
%       class       - a label for returning class 
%                     (0 or 1 when it is a leaf node, empty for internal nodes)


% Constant
num_examples = size(ft_lb,1);

% Create tree node
tree = struct('op','','kids',[],'class','');

% When the node is pure, set the taget label
last_column_sum = sum(ft_lb(:, end));
if(last_column_sum == num_examples)
    tree.class = 1; 
    return;
end

if(last_column_sum == 0)
    tree.class = 0;
    return;
end

% Pick the best attribute and threshold for the current node
[best_attrib,best_threshold,left,right] = chooseattribute(ft_lb);

% Extend tree
tree.op = [best_attrib,best_threshold];
tree.kids = cell(1,2);
tree.kids{1} = ID3(left);
tree.kids{2} = ID3(right);



               
        





