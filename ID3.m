function [tree] = ID3(ft_lb, active_attrib_idx)
% ID3 -  Runs the ID3 algorithm on the matrix 
% Input: ft_lb              - initial matrix with labels concatenated in each 
%                             end of the row, in which rows represent  examples, 
%                             columns for attributes and the final column are labels
%        active_attrib_idx  - an array contains 0s and 1s representing
%                             inactive and active of the attributes 
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
tree = struct('op','','kids',[], 'class','');

% When the tree is pure, set the taget label
last_column_sum = sum(ft_lb(:, end));
if(last_column_sum == num_examples)
    tree.class = 1; 
    return;
end

if(last_column_sum == 0)
    tree.class = 0;
    return;
end

% When there is no active attributes, return tree with the
% most common label
if (sum(active_attrib_idx) == 0)
    tree.class = majorityvalue(ft_lb(:,end));
    return;
end


% Pick the best attribute and threshold for the current node
[best_attrib,best_threshold,left,right] = chooseattribute(ft_lb,active_attrib_idx);

% Inactive the best attribute from the array
active_attrib_idx(best_attrib) = 0;

% Extend tree
tree.op = [best_attrib,best_threshold];
tree.kids = cell(1,2);
tree.kids{1} = ID3(left,active_attrib_idx);
tree.kids{2} = ID3(right,active_attrib_idx);



               
        





