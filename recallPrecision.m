function rcpre = recallPrecision(cf_matrix, labels)
% recallprecision is a function that calculates the average recall and
% precision rate of a confusion matrix

% Constant
label_num = 6;

% true positive for each class
trpos = diag(cf_matrix);

% emotion positive number total
emo_posi_num = zeros(label_num,1);
emo_tp_fp = zeros(label_num,1);
for i = 1:label_num
   emo_posi_num(i,1) = length(labels(labels ==i));
   emo_tp_fp(i,1) = sum(cf_matrix(:,i)); 
end

% Each and average recall
emo_recall = trpos./emo_posi_num;
avgrecall = sum(emo_recall)/label_num;

report_recall = [avgrecall;emo_recall];


% Each and average precision
emo_precision = trpos./emo_tp_fp;
avgprecision = sum(emo_precision)/label_num;

report_precision = [avgprecision;emo_precision];

% f1 measure
report_measure = fameasure(report_recall,report_precision,1);

% printout format: 
rcpre = [report_recall,report_precision,report_measure]';

