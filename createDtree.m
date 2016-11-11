function createDtree(n,title)
% createDtree - function to create dicision tree
% Input: n      - emotion label (1-6)
%        title  -  title of the resulting tree image

ft_lb = datatrans(n);

% Initialise active attribute index array
active_attrib_idx = ones(1,size(ft_lb,2)-1);

% Build tree
tree = ID3(ft_lb,active_attrib_idx);

% Draw tree
DrawDecisionTree(tree,title);
