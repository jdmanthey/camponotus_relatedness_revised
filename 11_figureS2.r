

options(scipen=999)


herc <- read.table("herculeanus__50kbp__relatedness.txt", header=T)
laev <- read.table("laevissimus__50kbp__relatedness.txt", header=T)
modo <- read.table("modoc__50kbp__relatedness.txt", header=T)
herc2 <- read.table("herculeanus__100kbp__relatedness.txt", header=T)
laev2 <- read.table("laevissimus__100kbp__relatedness.txt", header=T)
modo2 <- read.table("modoc__100kbp__relatedness.txt", header=T)

x <- rbind(herc, laev, modo)
x2 <- rbind(herc2, laev2, modo2)

# set up plot layout
par(mfrow=c(1,3))
par(mar=c(5,5,1,1))


plot(x$wang, x2$wang, pch=19, cex=0.8,cex.lab=1.5, cex.axis=1.5, xlab="Wang (50 kbp thinned SNPs)", ylab="Wang (100 kbp thinned SNPs)")
abline(lm(x2$wang ~ x$wang), lty=2, col="gray")
summary(lm(x2$wang ~ x$wang), lty=2, col="gray")


plot(x$li, x2$li, pch=19, cex=0.8,cex.lab=1.5, cex.axis=1.5, xlab="Li (50 kbp thinned SNPs)", ylab="Li (100 kbp thinned SNPs)")
abline(lm(x2$li ~ x$li), lty=2, col="gray")
summary(lm(x2$li ~ x$li), lty=2, col="gray")

plot(x$KINGrobust, x2$KINGrobust, pch=19, cex=0.8,cex.lab=1.5, cex.axis=1.5, xlab="KrK (50 kbp thinned SNPs)", ylab="KrK (100 kbp thinned SNPs)")
abline(lm(x2$KINGrobust ~ x$KINGrobust), lty=2, col="gray")
summary(lm(x2$KINGrobust ~ x$KINGrobust), lty=2, col="gray")

