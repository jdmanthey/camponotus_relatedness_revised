options(scipen=999)
library(ggplot2)
library(forcats)
library(ape)
library(ggtree)
library(ggstance)
library(picante)

# downloaded dated phylogenetic tree from:
# DOI 10.1186/s12862-015-0552-5
x_tree <- read.nexus(file="Blaimer_tree_T90178.nex")
tips_to_keep <- c("Anoplolepis_gracilipes", "Brachymyrmex_depilis", "Camponotus_hyatti", "Cataglyphis_cursor", "Formica_neogagates", "Lasius_niger", "Melophorus_AU01", "Myrmecocystus_flaviceps", "Myrmelachista_flavocotea", "Nylanderia_dodo", "Plagiolepis_alluaudi", "Polyergus_breviceps", "Polyrhachis_decumbens", "Proformica_mongolica", "Rossomyrmex_anatolicus")
x_tree2 <- keep.tip(x_tree, tips_to_keep)
# rename each to just the genus
x_tree2$tip.label <- sapply(strsplit(x_tree2$tip.label, "_"), "[[", 1)

x <- read.table("lit_relatedness.txt", header=T, stringsAsFactors=F, sep="\t")
genera <- unique(x[,1])

## visualize the tree 
p <- ggtree(x_tree2) + geom_tiplab(align=TRUE, linesize=.5) 
            
p + geom_facet(panel = "Relatedness", data = x, geom = geom_jitter, aes(x = Relatedness), position=position_jitter(width=0, height=0.15), color="forestgreen") + theme_tree2() + xlim_expand(c(0, 155), 'Tree') + xlim_expand(c(0, 1), 'Relatedness')



# calculate phylogenetic signal of mean and variance per genus
x_mean <- c()
x_variance <- c()
genera <- unique(x[,1])
for(a in 1:length(genera)) {
	a_rep <- x[x[,1] == genera[a], ]
	x_mean <- c(x_mean, mean(a_rep$Relatedness))
	x_variance <- c(x_variance, var(a_rep$Relatedness))
} 
names(x_mean) <- names(x_variance) <- genera
x_variance <- na.omit(x_variance)

phylosignal(x_mean[x_tree2$tip.label], x_tree2)
phylosignal(x_variance[x_tree2$tip.label], x_tree2)

