## ----include = FALSE----------------------------------------------------------
library(strollur)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
miseq <- miseq_sop_example()

## -----------------------------------------------------------------------------
miseq

## -----------------------------------------------------------------------------
names(miseq, type = "dataset")

## -----------------------------------------------------------------------------
all_sequences <- names(
  miseq,
  type = "sequence",
  distinct = FALSE
)
length(all_sequences)
head(all_sequences, n = 5)

## -----------------------------------------------------------------------------
include_f3d0 <- names(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = FALSE
)
length(include_f3d0)
head(include_f3d0, n = 5)

## -----------------------------------------------------------------------------
exclusive_f3d0 <- names(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = TRUE
)
length(exclusive_f3d0)
head(exclusive_f3d0, n = 5)

## -----------------------------------------------------------------------------
otu_bins <- names(
  miseq,
  type = "bin",
  bin_type = "otu"
)
length(otu_bins)
head(otu_bins, n = 5)

## -----------------------------------------------------------------------------
include_f3d0 <- names(
  miseq,
  type = "bin",
  samples = c("F3D0"),
  distinct = FALSE
)
length(include_f3d0)
head(include_f3d0, n = 5)

## -----------------------------------------------------------------------------
exclusive_f3d0 <- names(
  miseq,
  type = "bin",
  samples = c("F3D0"),
  distinct = TRUE
)
length(exclusive_f3d0)
head(exclusive_f3d0, n = 5)

## -----------------------------------------------------------------------------
names(miseq, type = "sample")

## -----------------------------------------------------------------------------
names(miseq, type = "treatment")

## -----------------------------------------------------------------------------
names(miseq, type = "report")

## -----------------------------------------------------------------------------
count(
  miseq,
  type = "sequence",
  distinct = FALSE
)

## -----------------------------------------------------------------------------
count(
  miseq,
  type = "sequence",
  distinct = TRUE
)

## -----------------------------------------------------------------------------
count(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = FALSE
)

## -----------------------------------------------------------------------------
count(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = TRUE
)

## -----------------------------------------------------------------------------
count(
  miseq,
  type = "bin",
  bin_type = "otu"
)

## -----------------------------------------------------------------------------
count(
  miseq,
  type = "bin",
  bin_type = "otu",
  samples = c("F3D0"),
  distinct = FALSE
)

## -----------------------------------------------------------------------------
count(
  miseq,
  type = "bin",
  bin_type = "otu",
  samples = c("F3D0"),
  distinct = TRUE
)

## -----------------------------------------------------------------------------
count(miseq, type = "sample")

## -----------------------------------------------------------------------------
count(miseq, type = "treatment")

## -----------------------------------------------------------------------------
sequence_abundance <- abundance(
  miseq,
  type = "sequence",
  by_sample = FALSE
)
head(sequence_abundance, n = 10)

## -----------------------------------------------------------------------------
sequence_abundance_by_sample <- abundance(
  miseq,
  type = "sequence",
  by_sample = TRUE
)
head(sequence_abundance_by_sample, n = 10)

## -----------------------------------------------------------------------------
bin_abundance <- abundance(
  miseq,
  type = "bin",
  bin_type = "otu",
  by_sample = FALSE
)
head(bin_abundance, n = 10)

## -----------------------------------------------------------------------------
bin_abundance_by_sample <- abundance(
  miseq,
  type = "bin",
  bin_type = "otu",
  by_sample = TRUE
)
head(bin_abundance_by_sample, n = 10)

## -----------------------------------------------------------------------------
abundance(
  miseq,
  type = "sample"
)

## -----------------------------------------------------------------------------
abundance(miseq, type = "treatment")

## -----------------------------------------------------------------------------
fasta_report <- report(
  miseq,
  type = "fasta"
)
head(fasta_report, n = 5)

## -----------------------------------------------------------------------------
sequence_report <- report(
  miseq,
  type = "sequence"
)
head(sequence_report, n = 5)

## -----------------------------------------------------------------------------
sequence_classification <- report(
  miseq,
  type = "sequence_taxonomy"
)
head(sequence_classification, n = 10)

## -----------------------------------------------------------------------------
bin_classification <- report(
  miseq,
  type = "bin_taxonomy",
  bin_type = "otu"
)
head(bin_classification, n = 10)

## -----------------------------------------------------------------------------
sequence_bin_assignments <- report(
  miseq,
  type = "sequence_bin_assignment",
  bin_type = "otu"
)
head(sequence_bin_assignments, n = 10)

## -----------------------------------------------------------------------------
sample_treatment_assignments <- report(
  miseq,
  type = "sample_assignment"
)
head(sample_treatment_assignments, n = 5)

## -----------------------------------------------------------------------------
otu_bin_representatives <- report(
  miseq,
  type = "bin_representative",
  bin_type = "otu"
)
head(otu_bin_representatives, n = 5)

## -----------------------------------------------------------------------------
names(miseq, type = "report")

## -----------------------------------------------------------------------------
contigs_assembly_report <- report(
  miseq,
  type = "contigs_report"
)
head(contigs_assembly_report, n = 5)

## -----------------------------------------------------------------------------
metadata <- report(
  miseq,
  type = "metadata"
)
head(metadata, n = 5)

## -----------------------------------------------------------------------------
report(
  miseq,
  type = "resource_reference"
)

## -----------------------------------------------------------------------------
report(
  miseq,
  type = "sequence_scrap"
)
report(
  miseq,
  type = "bin_scrap"
)

## -----------------------------------------------------------------------------
names(miseq, type = "report")

## -----------------------------------------------------------------------------
summary(
  miseq,
  type = "report",
  report_type = "contigs_report"
)

## -----------------------------------------------------------------------------
summary(miseq, type = "scrap")

## -----------------------------------------------------------------------------
miseq_sequence_tree <- miseq$get_sequence_tree()
miseq_sample_tree <- miseq$get_sample_tree()

#| fig.alt: >
#|   Plot of Miseq_SOP's sample relationship tree
old_par <- par(bg = "white")
ape::plot.phylo(miseq_sample_tree,
  no.margin = TRUE,
  cex = 0.5, edge.color = "maroon", tip.color = "navy"
)
par(old_par)

