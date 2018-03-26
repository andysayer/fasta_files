#!/usr/bin/env Rscript
# usage:
# csv-to-fasta.R < out.csv > out.fa
csv_file <- read.csv(file('stdin'), header = F)
FastaFile <- character(2 * nrow(csv_file))
FastaFile[c(TRUE, FALSE)] <- sprintf(">%s", csv_file[,1])
#FastaFile[c(FALSE, TRUE)] = as.character(csv_file[,2])
# all whitespace characters at terminals replaced, to avoid lines of length 80 having a newline added
# and a blank line inserted
FastaFile[c(FALSE, TRUE)] = sub("(^[[:space:]]+|[[:space:]]+$)", "", gsub("(.{80})", "\\1\n",csv_file[,2]))
writeLines(FastaFile, stdout())