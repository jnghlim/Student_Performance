correlations <- cor(sdata[num_var])

# Correlations (Heatmap)
row_indic <- apply(correlations, 1, function(x) sum(x > 0.3 | x < -0.3) > 1)
correlations
correlations<- correlations[row_indic ,row_indic]
png("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Correlation\\correlation_heat.png", width = 350, height = 350)
cor_plot <- corrplot(correlations, method="square")
dev.off()

# Correlations (Scatter)
num_var
num_data <- sdata[num_var]

require(gridExtra)
plot1 <- ggplot(num_data, aes(x=reading.score.percentage, y=writing.score.percentage)) + geom_point(size=2, color="red") + geom_smooth(method=lm, color="black")
plot2 <- ggplot(num_data, aes(x=reading.score.percentage, y=math.percentage)) + geom_point(size=2, color="green") + geom_smooth(method=lm, color="black")
plot3 <- ggplot(num_data, aes(x=writing.score.percentage, y=reading.score.percentage)) + geom_point(size=2, color="blue") + geom_smooth(method=lm, color="black")
grid.arrange(plot1,plot2,plot3)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Correlation\\correlation_scatter.png"), arrangeGrob(plot1, plot2, plot3))
dev.off()
