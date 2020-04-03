
df1 <- read.table("/Users/nouf/Documents/KFUPM1-2/Bioninformatics/project/alleles_count_new.csv", header = FALSE)
dim(df1)
out <- apply(df1[, c(3, 5, 7)], 1, function(i){
  x <- HWChisq(setNames(i, c("AA", "AB", "BB")), verbose = FALSE)
  x$pval
})
final <- cbind(df1, HWE = out)
write.csv(final,"/Users/nouf/Documents/KFUPM1-2/Bioninformatics/project/HW.csv", row.names = FALSE)

