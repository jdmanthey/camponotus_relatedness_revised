

options(scipen=999)

library(ggplot2)
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
plot_colors <- brewer.pal(8, "Dark2")[c(1,2,3)]

# set up data for ggplot
herc <- herc[substr(herc$ind1, 1, 5) == substr(herc$ind2, 1, 5),]
laev <- laev[substr(laev$ind1, 1, 5) == substr(laev$ind2, 1, 5),]
modo <- modo[substr(modo$ind1, 1, 5) == substr(modo$ind2, 1, 5),]
colony <- substr(c(herc$ind1, laev$ind1, modo$ind1), 1, 5)
comparison <- c(paste0(herc$ind1, "__", herc$ind2), paste0(laev$ind1, "__", laev$ind2), paste0(modo$ind1, "__", modo$ind2))
R0 <- c(herc$R0, laev$R0, modo$R0)
R1 <- c(herc$R1, laev$R1, modo$R1)
KINGrobust <- c(herc$KINGrobust, laev$KINGrobust, modo$KINGrobust)
wang <- c(herc$wang, laev$wang, modo$wang)
li <- c(herc$li, laev$li, modo$li)
species <- c(rep("herculeanus", nrow(herc)), rep("laevissimus", nrow(laev)), rep("modoc", nrow(modo)))
output <- data.frame(Species=as.character(species), Colony=as.factor(colony), comparison=as.character(comparison))
statistic=c(R0, R1, KINGrobust, wang, li)
stat_name=c(rep("R0", nrow(output)), rep("R1", nrow(output)), rep("KINGrobust", nrow(output)), rep("Wang", nrow(output)), rep("Li", nrow(output)))
output <- cbind(rbind(output, output, output, output, output), statistic, stat_name)
output2 <- output[output$stat_name == "KINGrobust" | output$stat_name == "Wang", ]

# reorder colonies by species
#output$Colony <- factor(output$Colony, levels = c("C-095", "C-106", "C-116", "C-088", "C-092", "C-101", "C-097", "C-109", "C-122"))
output2$Colony <- factor(output2$Colony, levels = c("C-122", "C-109", "C-097", "C-116", "C-106", "C-095", "C-101", "C-092", "C-088"))


#ggplot(output, aes(x=Colony, y=statistic, color=Species)) + geom_jitter(position = position_jitter(width = .05), size=0.6) + scale_color_manual(values=plot_colors) + expand_limits(y=0) + facet_wrap(~stat_name)


ggplot(output2, aes(x=Colony, y=statistic, color=Species)) + geom_jitter(position = position_jitter(width = .15), size=.8) + scale_color_manual(values=plot_colors) + ylim(0,1) + facet_wrap(~stat_name) + coord_flip()
