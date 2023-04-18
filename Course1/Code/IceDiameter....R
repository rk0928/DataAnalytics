iceDiameter = c(0.96, 1.51, 2.17, 3.85, 4.45, 6.02) 
diam <- function(ice){(ice / 0.92 * 3/4 * pi * 1^3 * 2 / 2.54)}
for (ice in iceDiameter){
  weight = diam(ice)
  print(weight)
}
