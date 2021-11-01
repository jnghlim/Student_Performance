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

num_data <- sdata[num_var]

require(gridExtra)
hist1 <- ggplot(num_data, aes(x=math.percentage)) + geom_histogram()
hist2 <- ggplot(num_data, aes(x=writing.score.percentage)) + geom_histogram()
hist3 <- ggplot(num_data, aes(x=reading.score.percentage)) + geom_histogram()
grid.arrange(hist1, hist2, hist3)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Distribution\\score_dist.png"), arrangeGrob(hist1, hist2, hist3))
dev.off()
