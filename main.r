install.packages("ggplot2")
install.packages("dplyr")
install.packages("gridExtra")
install.packages("corrplot")

library("ggplot2")
library("dplyr")
library("gridExtra")
library("corrplot")

sdata <- read.csv("Student Performance New.csv")
as_tibble(sdata)

colnames(sdata)
