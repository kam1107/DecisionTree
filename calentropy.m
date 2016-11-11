function entropy = calentropy(labels,ratio)
% function calentropy computes entropy in nodes

% +eps prevents  error in log2 calculation when pos or neg becomes 0
pos = sum(labels(:))/length(labels)+eps;
neg = (length(labels)-sum(labels(:)))/length(labels)+eps;
entropy = ratio*(-pos*log2(pos)-neg*log2(neg));