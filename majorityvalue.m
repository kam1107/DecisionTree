function label = majorityvalue(labels)
% function majorityvalue returns the majority label when the node is leaf 
% but impure.

if sum(labels(:)) >= (length(labels)/2)
    label = 1;
else
    label = 0;
end