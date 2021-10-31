install.packages("ggplot2")
install.packages("dplyr")
install.packages("gridExtra")

library("ggplot2")
library("dplyr")
library("gridExtra")

sdata <- read.csv("Student Performance New.csv")
as_tibble(sdata)

colnames(sdata)
