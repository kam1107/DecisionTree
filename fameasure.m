function fa = fameasure(recall,precision,a)
% fa measurement

fa = (1+a)*precision*recall/(a*precision+recall);

