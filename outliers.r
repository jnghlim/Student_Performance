for (x in num_var){
    q1 = quantile(unlist(sdata[x], use.names=FALSE), 0.25, interpolation="nearest")
    q2 = quantile(unlist(sdata[x], use.names=FALSE), 0.5, interpolation="nearest")
    q3 = quantile(unlist(sdata[x], use.names=FALSE), 0.75, interpolation="nearest")
    q4 = quantile(unlist(sdata[x], use.names=FALSE), 1, interpolation="nearest")
    IQR = q3 - q1
    LB = q1 - 1.5*IQR
    UB = q3 + 1.5*IQR
    if ((min(sdata[x]) < LB & max(sdata[x]) > UB)){
        print("No Outliers")
    } else {
        print(glue("There are Outliers in {x}"))
        print(glue("Lower Bound is: {LB}"))
        print(glue("Upper Bound is: {UB}"))
        print(sdata[sdata[x] < LB, x])
        print(sdata[sdata[x] > UB, x])
    }
}
### Boxplots
box_data <- sdata %>% select(math.percentage, reading.score.percentage, writing.score.percentage)
jpeg("C:\\Users\\lim95\\Documents\\GitHub\\student_performance_r_project\\Scores\\scores_box_plot.jpeg", quality = 75)
boxplot(box_data)
dev.off()

for (x in num_var) {
    print(quantile(sdata[sdata[x]], 0.25, interpolation="nearest"))
}
unlist(sdata["math.percentage"], use.names=FALSE)
typeof(sdata$math.percentage)
