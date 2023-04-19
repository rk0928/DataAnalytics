## Single Sample T-Test
head(frostedflakes)
library("ggplot2")
t_obj <- t.test(frostedflakes$Lab, mu = 37)
print(t_obj)
d <- ggplot(frostedflakes, aes(x = Lab))
d + geom_histogram(binwidth = 1) +
  geom_vline(xintercept = t_obj$conf.int[1], color = "red") +
  geom_vline(xintercept = t_obj$conf.int[2], color = "red") +
  geom_vline(xintercept = t_obj$null.value, color = "green")
ggplot(frostedflakes, aes(sample = Lab)) + geom_qq()

## Independent T-Test
## t-Test for Two Independent Samples
t_ind <- t.test(frostedflakes$Lab, frostedflakes$IA400, alternative="two.sided", var.equal=FALSE)
print(t_ind)

## Graphing Data for an Independent t Test
install.packages("reshape2")
library(reshape2)
ff <- melt(frostedflakes, id="X")
## this is not working no matter what I try
ggplot(frostedflakes) + geom_boxplot(aes(x = variable, y = value)) +
  xlab("Test Method") + ylab("Percentage of Sugar")
## This test does not work either

## Paired t-Test for Two Samples
head(scores)
t_dep <- t.test(scores$postest, scores$pretest, paired = TRUE)
t_dep

## Graphing Data for an Dependent t Test
library(reshape2)
ss <- melt(scores, measure.vars = c("pretest", "postest"))
ss
ggplot(ss) + geom_boxplot(aes(x = variable, y = value)) +
  xlab("Test") + ylab("Score")

## Graphing the Difference Scores
dd <- scores$postest - scores$pretest
df <- data.frame(dd)
ggplot(df, aes(x = dd)) + geom_histogram(binwidth = 1) +
  xlab("Difference between postest and pretest")


## NHTemp
nhtemp
first25 <- nhtemp[1:25]
last25 <- nhtemp[36:60]
first25
last25
head(first25)
tail(last25)
Start = 1912
End = 1971
Frequencey = 1
sum(first25)
sum(last25)
sum(1260.4 + 1297.5)
sum(2557.9 / 49)
mean(first25)
mean(last25)
## They do not have the same mean
## Independent T-test