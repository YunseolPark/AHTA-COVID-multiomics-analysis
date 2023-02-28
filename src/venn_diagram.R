tcell <- read.table("result/tcell_toptable.txt", header=T, fill=T)
tcell <- tcell[tcell$FDR < 0.05,]
mono <- read.table("result/blood_toptable.txt", header=T, fill=T)
mono <- mono[mono$FDR < 0.05,]
chip <- read.table("result/mock_result_genes_sig.txt", header=T, sep='\t')

library(VennDiagram)
library(RColorBrewer)
myCol <- brewer.pal(3, "Pastel2")

venn.diagram(
  x = list(tcell$Gene_symbol, chip$Gene_Symbol, mono$Gene_symbol),
  category.names = c("T cell", "ChIP-seq", "Monocyte"),
  filename = '#14_venn_diagramm.png',
  output=TRUE,
  
  # Output features
  imagetype="png" ,
  height = 480 , 
  width = 480 , 
  resolution = 300,
  compression = "lzw",
  
  # Circles
  lwd = 2,
  lty = 'blank',
  fill = myCol,
  
  # Numbers
  cex = .6,
  fontface = "bold",
  fontfamily = "sans",
  
  # Set names
  cat.cex = 0.6,
  cat.fontface = "bold",
  cat.default.pos = "outer",
  cat.pos = c(-27, 27, 135),
  cat.dist = c(0.055, 0.055, 0.085),
  cat.fontfamily = "sans",
  rotation = 1
)


mehtylation <- "FAM38A"
tcell[tcell$Gene_symbol=="FAM38A",]
mono[mono$Gene_symbol=="FAM38A",]


# Libraries
library(tidyverse)
library(hrbrthemes)
library(tm)
library(proustr)
# library
library(VennDiagram)

#Make the plot
venn.diagram(
  x = list(tcell$Gene_symbol, chip$Gene_Symbol, mono$Gene_symbol
  ),
  category.names = c("T-cell (95)" , "ChIP-seq (6)" , "Monocyte (3916)"),
  filename = 'venn.png',
  output = TRUE ,
  imagetype="png" ,
  height = 480 , 
  width = 480 , 
  resolution = 300,
  compression = "lzw",
  lwd = 1,
  col=c("#440154ff", '#21908dff', '#FFA500'),
  fill = c(alpha("#440154ff",0.3), alpha('#21908dff',0.3), alpha('#FFA500',0.3)),
  cex = 0.5,
  fontfamily = "sans",
  cat.cex = 0.3,
  cat.default.pos = "outer",
  cat.pos = c(190, 170, 0),
  cat.dist = c(0.055, 0.055, 0.055),
  cat.fontfamily = "sans",
  cat.col = c("#440154ff", '#21908dff', '#FFA500'),
  rotation = 1
)

intersect(mono$Gene_symbol, chip$Gene_Symbol)

tcell[tcell$Gene_symbol=="DUSP1",]
mono[mono$Gene_symbol=="DUSP1",]
chip[chip$Gene_symbol=="DUSP1",]
