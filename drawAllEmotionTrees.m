function tree = drawAllEmotionTrees(raw_data,target_labels,emo_label)
% This function is used to draw decision trees for
% all the emotions with whole data set

ft_lb = datatrans(raw_data,target_labels,emo_label);
tree = ID3(ft_lb);
DrawDecisionTree(tree,strcat('Emotion',num2str(emo_label)));


