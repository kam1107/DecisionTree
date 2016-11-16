function drawAllEmotionTrees(raw_data,target_labels,emo_label)
% This function is used to draw decision trees for
% all the emotions with whole data set
load('emotions_data_66.mat');

ft_lb = datatrans(raw_data,target_labels,emo_label);
tree = createDtree(ft_lb,emo_label,0);
DrawDecisionTree(tree,'Emotion'+string(emo_label));


