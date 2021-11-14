sdata <- read.csv("Student Performance New.csv")
head(sdata)

as_tibble(sdata)

names(sdata)

cat_var <- names(sdata)[which(sapply(sdata, is.character))]
cat_var
num_var <- names(sdata)[which(sapply(sdata, is.numeric))]
num_var <- num_var[num_var != "X"]
num_var