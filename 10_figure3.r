

options(scipen=999)

library(RColorBrewer)

herc <- read.table("herculeanus__50kbp__relatedness.txt", header=T)
laev <- read.table("laevissimus__50kbp__relatedness.txt", header=T)
modo <- read.table("modoc__50kbp__relatedness.txt", header=T)
herc2 <- read.table("herculeanus__100kbp__relatedness.txt", header=T)
laev2 <- read.table("laevissimus__100kbp__relatedness.txt", header=T)
modo2 <- read.table("modoc__100kbp__relatedness.txt", header=T)

x <- rbind(herc, laev, modo)
x2 <- rbind(herc2, laev2, modo2)

# plot colors
plot_colors <- brewer.pal(8, "Dark2") 

# set up plot layout
par(mfrow=c(1,3))
par(mar=c(5,5,1,1))


plot(herc$wang, herc$li, xlim=c(-0.6, 1), ylim=c(-0.6, 1), col=plot_colors[1], pch=19, cex=0.8,cex.lab=1.5, cex.axis=1.5)
points(laev$wang, laev$li, col=plot_colors[2], pch=19, cex=0.8)
points(modo$wang, modo$li, col=plot_colors[3], pch=19, cex=0.8)
abline(lm(x$li ~ x$wang), lty=2, col="gray")
summary(lm(x$li ~ x$wang), lty=2, col="gray")

plot(herc$wang, herc$KINGrobust, xlim=c(-1.2,1), ylim=c(-.75,0.5), col=plot_colors[1], pch=19, cex=0.8, cex.lab=1.5, cex.axis=1.5)
points(laev$wang, laev$KINGrobust, col=plot_colors[2], pch=19, cex=0.8)
points(modo$wang, modo$KINGrobust, col=plot_colors[3], pch=19, cex=0.8)
abline(lm(x$KINGrobust ~ x$wang), lty=2, col="gray")
summary(lm(x$KINGrobust ~ x$wang), lty=2, col="gray")

plot(herc$li, herc$KINGrobust, xlim=c(-1.2,1), ylim=c(-.75,0.5), col=plot_colors[1], pch=19, cex=0.8, cex.lab=1.5, cex.axis=1.5)
points(laev$li, laev$KINGrobust, col=plot_colors[2], pch=19, cex=0.8)
points(modo$li, modo$KINGrobust, col=plot_colors[3], pch=19, cex=0.8)
abline(lm(x$KINGrobust ~ x$li), lty=2, col="gray")
summary(lm(x$KINGrobust ~ x$li), lty=2, col="gray")

