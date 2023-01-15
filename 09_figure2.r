

options(scipen=999)

library(RColorBrewer)

herc <- read.table("herculeanus__50kbp__relatedness.txt", header=T)
laev <- read.table("laevissimus__50kbp__relatedness.txt", header=T)
modo <- read.table("modoc__50kbp__relatedness.txt", header=T)
herc2 <- read.table("herculeanus__100kbp__relatedness.txt", header=T)
laev2 <- read.table("laevissimus__100kbp__relatedness.txt", header=T)
modo2 <- read.table("modoc__100kbp__relatedness.txt", header=T)

# plot colors
plot_colors <- brewer.pal(12, "Paired") # use 3, 4, 7, 8, 9, 10

# set up plot layout
par(mfrow=c(2, 3))
par(mar=c(5,5,1,1))

# plot herculeanus
x <- herc
plot(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], x$R0[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], col=plot_colors[4], xlim=c(0, 2.6), ylim=c(0, 3.7), xlab="R1", ylab="R0", cex.lab=1.2, cex.axis=1.2)
points(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], x$R0[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], col=plot_colors[12])

# plot laevissimus
x <- laev
plot(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], x$R0[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], col=plot_colors[4], xlim=c(0, 2.6), ylim=c(0, 5), xlab="R1", ylab="R0", cex.lab=1.2, cex.axis=1.2)
points(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], x$R0[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], col=plot_colors[12])

# plot modoc
x <- modo
plot(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], x$R0[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], col=plot_colors[4], xlim=c(0, 2.6), ylim=c(0, 3.7), xlab="R1", ylab="R0", cex.lab=1.2, cex.axis=1.2)
points(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], x$R0[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], col=plot_colors[12])

# plot herculeanus
x <- herc
plot(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], x$KINGrobust[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], col=plot_colors[4], , xlim=c(0, 2.6), ylim=c(-0.6, 0.42), xlab="R1", ylab="KING-robust kinship", cex.lab=1.2, cex.axis=1.2)
points(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], x$KINGrobust[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], col=plot_colors[12])

# plot laevissimus
x <- laev
plot(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], x$KINGrobust[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], col=plot_colors[4], xlim=c(0, 2.6), ylim=c(-1, 0.42), xlab="R1", ylab="KING-robust kinship", cex.lab=1.2, cex.axis=1.2)
points(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], x$KINGrobust[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], col=plot_colors[12])

# plot modoc
x <- modo
plot(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], x$KINGrobust[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) == substr(x$ind2, 1, 5))], col=plot_colors[4], xlim=c(0, 2.6), ylim=c(-0.6, 0.42), xlab="R1", ylab="KING-robust kinship", cex.lab=1.2, cex.axis=1.2)
points(x$R1[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], x$KINGrobust[substr(x$ind1, 1, 1) == "C" & ( substr(x$ind1, 1, 5) != substr(x$ind2, 1, 5))], col=plot_colors[12])



