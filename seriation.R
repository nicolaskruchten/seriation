library(readr)
library(seriation)
library(gplots)
library(viridis)

x <- read_csv("x.csv",col_names = FALSE)
color = inferno(200)
bitmap = as.matrix(x)
shuffler = sample.int(nrow(bitmap))
shuffled = bitmap[shuffler,shuffler]
outsize = 800
png("original.png", width=outsize, height=outsize, units = 'px')
pimage(bitmap, col=color, key=FALSE)
dev.off()
png("shuffled_rows.png", width=outsize, height=outsize, units = 'px')
pimage(bitmap[shuffler,], col=color, key=FALSE)
dev.off()
png("shuffled_cols.png", width=outsize, height=outsize, units = 'px')
pimage(bitmap[,shuffler], col=color, key=FALSE)
dev.off()
png("shuffled_both.png", width=outsize, height=outsize, units = 'px')
pimage(shuffled, col=color, key=FALSE,margins=c(0,0))
dev.off()


png("clustered.png", width=outsize, height=outsize, units = 'px')
heatmap.2(shuffled, trace='none', col=color, key=FALSE, labRow = FALSE, labCol = FALSE,
          hclustfun = function(q) hclust(q, method="average"),margins=c(0,0) )
dev.off()

png("clustered_olo.png", width=outsize, height=outsize, units = 'px')
hmap(shuffled, method="OLO_average",col=color, key=FALSE,labRow = FALSE, labCol = FALSE,margins=c(0,0))
dev.off()

png("tsp.png", width=outsize, height=outsize, units = 'px')
hmap(shuffled, method="TSP",col=color, key=FALSE,labRow = FALSE, labCol = FALSE)
dev.off()

