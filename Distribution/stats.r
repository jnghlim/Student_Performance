install.packages("ggplot2")
install.packages("dplyr")
install.packages("gridExtra")

library("ggplot2")
library("dplyr")
library(glue)
library("gridExtra")

sdata <- read.csv("Student Performance New.csv")
head(sdata)

as_tibble(sdata)

names(sdata)

cat_var <- names(sdata)[which(sapply(sdata, is.character))]
cat_var
num_var <- names(sdata)[which(sapply(sdata, is.numeric))]
num_var <- num_var[num_var != "X"]
num_var

### Change the values to abbreviation
sdata$parental.level.of.education[sdata$parental.level.of.education == "bachelor's degree"] <- "BS"
sdata$parental.level.of.education[sdata$parental.level.of.education == "master's degree"] <- "MS"
sdata$parental.level.of.education[sdata$parental.level.of.education == "associate's degree"] <- "AS"
sdata$parental.level.of.education[sdata$parental.level.of.education == "some college"] <- "SC"
sdata$parental.level.of.education[sdata$parental.level.of.education == "high school"] <- "HS"
sdata$parental.level.of.education[sdata$parental.level.of.education == "some high school"] <- "SHS"

### Distribution of Categorical Columns
require(gridExtra)
plot1 <- ggplot(sdata, aes(x = sdata[,"race.ethnicity"])) + geom_bar() + theme_light() + xlab("Race/Ethnicity")
plot2 <- ggplot(sdata, aes(x = sdata[,"lunch"])) + geom_bar() + theme_light() + xlab("Lunch")
plot3 <- ggplot(sdata, aes(x = sdata[,"parental.level.of.education"])) + geom_bar() + theme_light() + xlab("Parental Level of Education")
plot4 <- ggplot(sdata, aes(x = sdata[,"sex"])) + geom_bar() + theme_light() + xlab("Sex")
plot5 <- ggplot(sdata, aes(x = sdata[,"test.preparation.course"])) + geom_bar() + theme_light() + xlab("Test Prepartion Course")
grid.arrange(plot1,plot2,plot3,plot4, plot5)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Distribution\\bar_dist.png"), arrangeGrob(plot1, plot2, plot3, plot4, plot5))
dev.off()

colnames(sdata)
cat_var

# Statistics for race.ethnicity
re_list <- c("group A", "group B", "group C", "group D", "group E")
re_math_mean <- re_wr_mean <- re_rd_mean <- NULL

for (x in re_list){
    re_math_mean <- append(re_math_mean, mean(sdata$math.percentage[sdata$race.ethnicity == x]))
    re_wr_mean <- append(re_wr_mean, mean(sdata$writing.score.percentage[sdata$race.ethnicity == x]))
    re_rd_mean <- append(re_rd_mean, mean(sdata$reading.score.percentage[sdata$race.ethnicity == x]))
}
re_math_mean
re_wr_mean
re_rd_mean
re_meanscore_df <- data.frame(math = re_math_mean, writing=re_wr_mean, reading=re_rd_mean, group = c("A", "B", "C", "D", "E"))
re_meanscore_df
re_meanscore_df %>% select(math,writing,reading,group) %>% filter()



unique(sdata$parental.level.of.education)
ploe_list <- c("BS", "SC", "MS", "AS", "HS", "SHS")
mean(sdata$math.percentage[sdata$parental.level.of.education == "BS"])
mean(sdata$reading.score.percentage[sdata$parental.level.of.education == "BS"])
mean(sdata$writing.score.percentage[sdata$parental.level.of.education == "BS"])
