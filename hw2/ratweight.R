getwd()
setwd("/Users/chuqiwang/Desktop/UCI/STATS205P/hw2")
ratweight = read.table("RatWeight.txt", header = TRUE)
as.factor(ratweight$Rat)