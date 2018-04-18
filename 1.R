df <- read.fwf("C:/Users/Galia/Desktop/??????????????/????????????/bumpus.txt", widths=c(3, 3, 3, 3, 4,7,6,6,8,8,8,8,8))
names(df) <- c("line_number", "sex", "age", "survival", "total_length", 
               "alar_extent", "weight", "b_h", "humerus", "fermur", 
               "tibiotarsus", "skull_width", "keel")
head(df)
summary(df)

library(ggplot2)

df$survival <- as.factor(df$survival)

ggplot(df, aes(x=fermur, y=tibiotarsus)) + geom_point()


# Change the point size, and shape
ggplot(df, aes(x=fermur, y=tibiotarsus, shape=survival, color=survival)) +
  geom_point(size=2)+ scale_color_brewer(palette='Set1')

#install.packages("dplyr")
# library(dplyr)
# install.packages("gcookbook")
# library(gcookbook)
# install.packages("plyr")
# install.packages("MASS")
# library(MASS)


panel.hist = function(x, ...){
  usr = par('usr')
  on.exit(par(usr))
  par(usr = c(usr[1:2], 0, 1.5))
  h = hist(x, plot=FALSE)
  breaks = h$breaks
  nB = length(breaks)
  y=h$counts
  y=y/max(y)
  rect(breaks[-nB], 0, breaks[-1], y, col='white',...)
}

pairs(df[, 5:13], diag.panel = panel.hist)


plotmatrix(df[, 5:13], color=df$survival)+ scale_color_brewer(palette='Set1')

