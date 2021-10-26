install.packages("ggplot2")
install.packages("dplyr")

library("ggplot2")
library("dplyr")

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
sdata %>% select(race.ethnicity) %>% ggplot(aes(x=race.ethnicity)) + geom_bar() + theme_light() # nolint
