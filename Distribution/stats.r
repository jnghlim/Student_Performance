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
plot1 <- ggplot(sdata, aes(x = sdata[,"race.ethnicity"])) + geom_bar() + theme_light()
plot2 <- ggplot(sdata, aes(x = sdata[,"lunch"])) + geom_bar() + theme_light()
plot3 <- ggplot(sdata, aes(x = sdata[,"parental.level.of.education"])) + geom_bar() + theme_light()
plot4 <- ggplot(sdata, aes(x = sdata[,"sex"])) + geom_bar() + theme_light()
grid.arrange(plot1,plot2,plot3,plot4)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Distribution\\distribution.png"), arrangeGrob(plot1, plot2, plot3, plot4))
dev.off()


