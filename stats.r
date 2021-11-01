for (x in num_var){
    q1 = quantile(sdata$math.percentage, 0.25, interpolation="nearest")
    q2 = quantile(sdata$math.percentage, 0.5, interpolation="nearest")
    q3 = quantile(sdata$math.percentage, 0.75, interpolation="nearest")
    q4 = quantile(sdata$math.percentage, 1, interpolation="nearest")
    IQR = q3 - q1
    LB = q1 - 1.5*IQR
    UB = q3 + 1.5*IQR
    if ((min(sdata[x]) < LB && max(sdata[x]) > UB){
        print("No Outliers")
    } else {
        print("There is Outliers")
        print(sdata[x] < LB)
        print(sdata[x] > UB)
    }
}

min(sdata["math.percentage"])
quantile(sdata$math.percentage)
quantile(sdata$math.percentage, 0.25, interpolation="nearest")
