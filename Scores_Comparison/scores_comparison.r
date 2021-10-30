# Scores Comparison by Ethnicity Group
re_list <- c("group A", "group B", "group C", "group D", "group E")
re_math_mean <- re_wr_mean <- re_rd_mean <- NULL

for (x in re_list){
    re_math_mean <- append(re_math_mean, mean(sdata$math.percentage[sdata$race.ethnicity == x]))
    re_wr_mean <- append(re_wr_mean, mean(sdata$writing.score.percentage[sdata$race.ethnicity == x]))
    re_rd_mean <- append(re_rd_mean, mean(sdata$reading.score.percentage[sdata$race.ethnicity == x]))
}
re_meanscore_df <- data.frame(math = re_math_mean, writing=re_wr_mean, reading=re_rd_mean, group = c("A", "B", "C", "D", "E"))

require(gridExtra)
plot1 <- ggplot(data=re_meanscore_df, aes(x=group, y=math)) + geom_bar(stat='identity')
plot2 <- ggplot(data=re_meanscore_df, aes(x=group, y=writing)) + geom_bar(stat='identity')
plot3 <- ggplot(data=re_meanscore_df, aes(x=group, y=reading)) + geom_bar(stat='identity')
grid.arrange(plot1,plot2,plot3)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Scores_Comparison\\group.png"), arrangeGrob(plot1, plot2, plot3))
dev.off()

#Scores Comparison by level of parent's education
tibble(sdata)
ploe_list <- c("BS", "SC", "MS", "AS", "HS", "SHS")
ploe_math_mean <- ploe_wr_mean <- ploe_rd_mean <- NULL

mean(sdata$math.percentage[sdata$parental.level.of.education == "AS"])
mean(sdata$writing.score.percentage[sdata$parental.level.of.education == "AS"])
mean(sdata$reading.score.percentage[sdata$parental.level.of.education == "AS"])

for (x in ploe_list){
    ploe_math_mean <- append(ploe_math_mean, mean(sdata$math.percentage[sdata$parental.level.of.education == x]))
    ploe_wr_mean <- append(ploe_wr_mean, mean(sdata$writing.score.percentage[sdata$parental.level.of.education == x]))
    ploe_rd_mean <- append(ploe_rd_mean, mean(sdata$reading.score.percentage[sdata$parental.level.of.education == x]))
}
ploe_math_mean
ploe_wr_mean
ploe_rd_mean

ploe_meanscore_df <- data.frame(math = ploe_math_mean, writing=ploe_wr_mean, reading=ploe_rd_mean, group = c("BS", "SC", "MS", "AS", "HS", "SHS"))
ploe_meanscore_df
require(gridExtra)
plot1 <- ggplot(data=ploe_meanscore_df, aes(x=group, y=math)) + geom_bar(stat='identity')
plot2 <- ggplot(data=ploe_meanscore_df, aes(x=group, y=writing)) + geom_bar(stat='identity')
plot3 <- ggplot(data=ploe_meanscore_df, aes(x=group, y=reading)) + geom_bar(stat='identity')
grid.arrange(plot1,plot2,plot3)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Scores_Comparison\\parental_level.png"), arrangeGrob(plot1, plot2, plot3))
dev.off()
