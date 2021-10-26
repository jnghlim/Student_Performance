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

### Distribution of Categorical Columns
require(gridExtra)
plot1 <- ggplot(sdata, aes(x = sdata[,"race.ethnicity"])) + geom_bar() + theme_light() + xlab("Race/Ethnicity")
plot2 <- ggplot(sdata, aes(x = sdata[,"lunch"])) + geom_bar() + theme_light() + xlab("Lunch")
plot3 <- ggplot(sdata, aes(x = sdata[,"parental.level.of.education"])) + geom_bar() + theme_light() + xlab("Parental Level of Education") + theme(axis.text.x = element_text(angle=-45))
#scale_x_discrete(limits = c("bachelor's", ))
plot4 <- ggplot(sdata, aes(x = sdata[,"sex"])) + geom_bar() + theme_light() + xlab("Sex")
plot5 <- ggplot(sdata, aes(x = sdata[,"test.preparation.course"])) + geom_bar() + theme_light() + xlab("Test Prepartion Course")
grid.arrange(plot1,plot2,plot3,plot4, plot5)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Distribution\\distribution.png"), arrangeGrob(plot1, plot2, plot3, plot4, plot5))
dev.off()
plot3

unique(sdata["parental.level.of.education"])
colnames(sdata)
head(sdata)
