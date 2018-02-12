#################################
## R code for Exam 2 Take-Home ##
#################################

# adjust margins to fit margin text
par(mar = c(5, 4, 4, 2))

# create plot of y=x^2 - note use of type = "b" so  
# points are not on top of lines
x <- c(0, .25, .5, .75, 1)
plot(x, x^2, xlab = "x-axis label", ylab = "y-axis label", 
     main = "Title", sub = "substring", type = "b", 
     axes = FALSE, pch = 15)

# add y=1-x^2 lines and points on top of lines
lines(x, 1 - x^2)
points(x, 1 - x^2, pch = 35)

# add axes, adjust tickmark length and use las to rotate labels
axis(side = 1, at = c(0, 0.5, 1), labels = c(0.0, 0.5, 1.0), 
     tick = TRUE, tck = -.03)
axis(side = 2, at = c(0, 0.5, 1), labels = c(0.0, 0.5, 1.0), 
     tick = TRUE, tck = -.01, las = 1) 

# add legend with extra wide box
legend(x = c(0.5, 0.85), y = c(0.82, 0.95), 
       legend = c("y=x^2", "y=1-x^2"), pch = c(15, 35))

# add text/arrows inside plot
text(0.3, 0.8, "text at (0.3,0.8)")
text(0.3, 0.5, "Point of intersection")
arrows(0.5, 0.5, 0.70, 0.5)

# add text in margins
for (i in 0:3) {
  mtext(paste("Line", i + 1), side = 1, line = i, at = 0.1)
}
for (i in 0:3) {
  mtext(paste("Line", i + 1), side = 2, line = i, at = 0.1, srt = 90)
}
for (i in 0:3) {
  mtext(paste("Line", i + 1), side = 3, line = i, at = 0.1)
}
mtext("mtext outside the plot area", side = 3, line = 0)
mtext("Line 1", side = 4, line = 0, at = 0.1, srt = 270)
mtext("Line 2", side = 4, line = 1, at = 0.1, srt = 270)

#########
## END ##
#########