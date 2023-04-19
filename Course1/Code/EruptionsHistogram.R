## Eruptions Histogram
fe = data.frame(faithful)
head(fe)
tail(fe)
View(fe)
f <- ggplot(faithful, aes(x = eruptions))
f + geom_histogram()

## Eruptions Normal Distribution
ggplot(faithful, aes(sample = eruptions)) + geom_qq()
ggplot(morley, aes(sample = Speed)) + geom_qq()

## Eruptions BoxPlot
library("ggplot2")
e = data.frame(faithful)
head(e)
tail(e)
View(e)
e <- ggplot(faithful, aes(x = "", y = waiting))
e + geom_boxplot() + xlab("")
summary(faithful$eruptions)
30 * 1.5
45 + 4.454
2.163 - 45
## Anything above 149.454 or below -42.837 is an outlier

