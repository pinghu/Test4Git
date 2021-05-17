###################################################################
#########author: Ping Hu
#########Date: May17 2021
####################################################################
#install.packages("gprofiler2")
#https://rdrr.io/cran/gprofiler2/f/vignettes/gprofiler2.Rmd
rm(list=ls())
library(gprofiler2)
args <- commandArgs(trailingOnly = TRUE)
filename <- args[1]
#filename="FT_LPT_All.txt"
A<-read.csv(filename, sep="\t", header=TRUE)
dim(A)
gostres <- gost(query = A$GENESYMBOL, 
                organism = "hsapiens", ordered_query = FALSE, 
                multi_query = FALSE, significant = TRUE, exclude_iea = TRUE, 
                measure_underrepresentation = FALSE, evcodes = TRUE, 
                user_threshold = 0.05, correction_method = "fdr", 
                domain_scope = "annotated", custom_bg = NULL, 
                numeric_ns = "", sources = NULL, as_short_link = FALSE)
allresult <-gostres$result[,c( "source","term_id","term_name","p_value","intersection",
                              "term_size","query_size","intersection_size",
                              "effective_domain_size")]
write.table(allresult, file = paste0(filename,".gprofiler"), sep = "\t", quote = F, row.names = F)
gem <- gostres$result[,c("term_id", "term_name", "p_value", "intersection")]
colnames(gem) <- c("GO.ID", "Description", "p.Val", "Genes")
gem$FDR <- gem$p.Val
gem$Phenotype = "+1"
gem <- gem[,c("GO.ID", "Description", "p.Val", "FDR", "Phenotype", "Genes")]
#head(gem)
write.table(gem, file = paste0(filename,".gem"), sep = "\t", quote = F, row.names = F)
jpeg(paste0(filename,".gprofiler.jpg"), width = 2800, height = 1800, res=300)
p <- gostplot(gostres, capped = FALSE, interactive = FALSE)
#pp <- publish_gostplot(p, highlight_terms = gostres$result[c(1:2,10,100:102,120,124,125),],width = NA, height = NA, filename = NULL )
p
dev.off()
#https://rdrr.io/cran/gprofiler2/f/vignettes/gprofiler2.Rmd

#publish_gosttable(gostres, highlight_terms = gostres$result[c(1:2,10,100:102,120,124,125),],
#                  use_colors = TRUE, 
#                  show_columns = c("source", "term_name", "term_size", "intersection_size"),
#                  filename = NULL)
gostres2 <- gost(query = A$GENESYMBOL, 
                organism = "hsapiens", ordered_query = FALSE, 
                multi_query = FALSE, significant = TRUE, exclude_iea = TRUE, 
                measure_underrepresentation = FALSE, evcodes = TRUE, 
                user_threshold = 0.05, correction_method = "fdr", 
                domain_scope = "annotated", custom_bg = NULL, 
                numeric_ns = "", sources = NULL, as_short_link = TRUE)
print(paste(filename, gostres2))