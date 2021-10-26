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
test1 <- ggplot(sdata, aes(x = sdata[,"race.ethnicity"])) + geom_bar() + theme_light()
test2 <- ggplot(sdata, aes(x = sdata[,"lunch"])) + geom_bar() + theme_light()
test3 <- ggplot(sdata, aes(x = sdata[,"parental.level.of.education"])) + geom_bar() + theme_light()
test4 <- ggplot(sdata, aes(x = sdata[,"sex"])) + geom_bar() + theme_light()
grid.arrange(test1,test2,test3,test4)
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Distribution\\distribution.png"), arrangeGrob(test1, test2, test3, test4))
dev.off()

y <- 1
for (x in 1:5){
    print(x)
    assign(paste("test", y+5, sep=""), (x))
    y <- y + 1
}
test6
test7
test8
test9
test10

test6
