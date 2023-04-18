library(datasets)
eruptions.times <- faithful$eruptions
short <- eruptions.times[eruptions.times <= 3]
long <- eruptions.times[eruptions.times > 3]
length(short)
length(long)
mean(short)
mean(long)
sd(short)
sd(long)