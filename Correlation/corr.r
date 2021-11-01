correlations <- cor(sdata[num_var])

# correlations
row_indic <- apply(correlations, 1, function(x) sum(x > 0.3 | x < -0.3) > 1)
correlations
correlations<- correlations[row_indic ,row_indic]
png("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Correlation\\correlation.png", width = 350, height = 350)
cor_plot <- corrplot(correlations, method="square")
dev.off()
