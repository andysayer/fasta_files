#!/usr/bin/env Rscript
# usage:
# fasta-to-csv < input.fasta > output.csv

suppressPackageStartupMessages(library(seqinr))
parsed = read.fasta(file('stdin'), as.string = TRUE)
#parsed = read.fasta(file(file.choose()), as.string = TRUE)
table = data.frame(toupper(unlist(parsed)), row.names = sapply(parsed, attr, 'Annot'))
rownames(table) = trimws(sub(">", "", rownames(table)))
write.table(table, stdout(), sep = '\t', quote = FALSE, col.names = FALSE)