## Cars Histogram
cd = data.frame(cars)
head(cd)
tail(cd)
View(cd)
c <- ggplot(cd, aes(x = dist))
c + geom_histogram()

## Cars Normal Distribution
ggplot(cars, aes(sample = dist)) + geom_qq()
ggplot(morley, aes(sample = Speed)) + geom_qq()

## Cars BoxPlot
library("ggplot2")
c = data.frame(cars)
head(c)
tail(c)
View(c)
d <- ggplot(cars, aes(x = "", y = dist))
d + geom_boxplot() + xlab("")
summary(cars$dist)
30 * 1.5
45 + 56
26 - 45
## Anything above 101 or below -19 is an outlier


