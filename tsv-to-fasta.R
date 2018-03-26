#!/usr/bin/env Rscript
# usage:
# tsv-to-fasta.R < out.tsv > out.fa
tsv_file <- read.delim(file('stdin'), header = F)
#tsv_file <- read.delim(file(file.choose()), header = F)
FastaFile <- character(2 * nrow(tsv_file))
FastaFile[c(TRUE, FALSE)] <- sprintf(">%s", tsv_file[,1])
# all whitespace characters at terminals replaced, to avoid lines of length 80 having a newline added
# and a blank line inserted
FastaFile[c(FALSE, TRUE)] = sub("(^[[:space:]]+|[[:space:]]+$)", "", gsub("(.{80})", "\\1\n",tsv_file[,2]))
writeLines(FastaFile, stdout())



