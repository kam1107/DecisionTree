function drawAllEmotionTrees()
% This function is used to draw decision trees for
% all the emotions with whole data set
load('emotions_data_66.mat');

for i = 1:6
    ft_lb = datatrans(x,y,i);
    tree = createDtree(ft_lb,i,0);
    DrawDecisionTree(tree,strcat('Emotion',num2str(i)));
end

