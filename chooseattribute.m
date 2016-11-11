function [best_feature,best_threshold,left,right] = ...
    chooseattribute(ft_lb,active_attrib_idx)
% function chooseattribute select the best feature and best threshold by
% calculating maximum gain
current_entropy = calentropy(ft_lb(:,end),1);

best_feature = -1;
best_threshold = -inf;
max_gain = -inf;
left = [];
right = [];

for i = 1:length(active_attrib_idx)
    if active_attrib_idx(i)
        % sort the matrix according to the specific attribute 
        % for threshold calculating
        tmp = ft_lb;
        [~,I] = sort(tmp(:,i));
        sorted = tmp(I,:); 
        % try each threshold and compute gain
        for j = 1:(size(sorted,1)-1)
            th = (sorted(j,i)+sorted(j+1,i))/2;
            left_ = sorted(1:j,:);
            right_ = sorted(j+1:end,:);
            remainder = calentropy(left_(:,end),size(left_,1)/size(sorted,1))...
            + calentropy(right_(:,end),size(right_,1)/size(sorted,1));
            gain = current_entropy-remainder;        
            if gain > max_gain
                max_gain = gain;
                best_feature = i;
                best_threshold = th; 
                left = left_;
                right = right_;
            end
        end
    end
end
