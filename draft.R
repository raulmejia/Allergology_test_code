if (!require("BiocManager")) {
  install.packages("BiocManager")
  library(BiocManager)}
if (!require("DESeq2")) {
  BiocManager::install("DESeq2")
  library(DESeq2)}

### Parameters given by the user
path_EM <-"MyFolder/TEM_IFGN_IL5_counts.tsv"
#path_coldata <- "MyFolder/sample_data_same_rownames_some_colnames.tsv"
path_coldata <- "MyFolder/coldata_file_Disease_Season_Cytokine.tsv"


#####

coldata <- read.table( path_coldata , row.names=1, stringsAsFactors = FALSE)
ExpMat <- read.table( path_EM, row.names = 1, stringsAsFactors = FALSE)
    ExpMat <- ExpMat[,-1] # Do this through awk out of the program
countdata <- round(ExpMat)

design 

## constructing the DESeqDataSet Object
ddsMat <-  DESeqDataSetFromMatrix(countData = countdata,
                         colData = coldata,
                         design = ~ cell + dex)

f1 <- factor(c("a","a","b","b","c"))
f1
f2 <- factor( c("I","I","II","III","III"))
f2

factor(paste0(f1,f2))


