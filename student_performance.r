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
count = 1
for (x in cat_var) { 
    assign(paste("plot", i, sep=""), (ggplot(sdata, aes(x=data[,x])) + geom_bar() + theme_light() + xlab(x)))
    count <- count + 1
} 
ggsave(glue("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Distribution\\cat_dist.png"), arrangeGrob(plot1, plot2, plot3, plot4, plot5))
