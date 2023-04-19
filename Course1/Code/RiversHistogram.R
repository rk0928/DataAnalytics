## Rivers Histogram
rr = data.frame(rivers)
head(rr)
tail(rr)
View(rr)
r <- ggplot(rr, aes(x = rivers))
r + geom_histogram()

## Rivers BoxPlot
rr = data.frame(rivers)
head(rr)
tail(rr)
View(rr)
d <- ggplot(rr, aes(x = "", y = rivers))
d + geom_boxplot() + xlab("")
summary(rr$rivers)
30 * 1.5
45 + 683.2
375.2 - 45
## Anything above 728.2 or below 330.2 will be considered and
## outlier

## Rivers Normal Distribution
ggplot(Rivers, aes(sample = Length..miles..) + geom_qq())
ggplot(morley, aes(sample = Length..miles..) + geom_qq())

       