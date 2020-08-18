function Precision_Recall(dist, hgram, qimg_cat)

%% PRECISION AND RECALL HERE
%% precison is the amount out of 15 that are the same as the query divided by 15
%% recall is the amount out of 15 divided by the class amount
%Precision_Recall(ALLFILES, dst)5
precision = [];
recall = [];
N=591; % Computer precision and recal over the top 10 results
dist=dist(1:N,:);
%Array of the image categories in top 10 results
show_cat = dist(:, end);
sorted_cat=(show_cat(:,:,end));
%disp(top_10_cat);
relevant_cat = 0;
amount_in_relevcat = hgram(qimg_cat);


%PRECISION - how many of the 'N' returned results are relevant
%RECALL - how many of the 'n' relevant results have been returned
for i=1:N
   if (sorted_cat(i) == qimg_cat)
       relevant_cat = relevant_cat+1;
   end
   precision(i) = relevant_cat/i;
   recall(i) = relevant_cat/amount_in_relevcat;
   %av_prec(i) = (precision(i).*recall(i))./amount_in_relevcat;
end
this = dist(1:N,3)==qimg_cat;
av_prec = sum(precision'.*this)/amount_in_relevcat



%Plot the PR curve
pr_plot=plot(recall, precision);
pr_plot.LineWidth
pr_plot.Marker='o';
title(['Precision and Recall Curve with Average precision:', num2str(av_prec)])
xlabel('Recall')
ylabel('Precision')
xlim([0 inf]) %Should they be 1????????
ylim([0 1])
figure;

return;