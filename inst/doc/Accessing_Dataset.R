## ----include = FALSE----------------------------------------------------------
library(strollur)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
miseq <- strollur::miseq_sop_example()

## -----------------------------------------------------------------------------
miseq

## -----------------------------------------------------------------------------
strollur::names(miseq, type = "dataset")

## -----------------------------------------------------------------------------
all_sequences <- strollur::names(
  miseq,
  type = "sequence",
  distinct = FALSE
)
length(all_sequences)
head(all_sequences, n = 5)

## -----------------------------------------------------------------------------
include_f3d0 <- strollur::names(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = FALSE
)
length(include_f3d0)
head(include_f3d0, n = 5)

## -----------------------------------------------------------------------------
exclusive_f3d0 <- strollur::names(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = TRUE
)
length(exclusive_f3d0)
head(exclusive_f3d0, n = 5)

## -----------------------------------------------------------------------------
otu_bins <- strollur::names(
  miseq,
  type = "bin",
  bin_type = "otu"
)
length(otu_bins)
head(otu_bins, n = 5)

## -----------------------------------------------------------------------------
include_f3d0 <- strollur::names(
  miseq,
  type = "bin",
  samples = c("F3D0"),
  distinct = FALSE
)
length(include_f3d0)
head(include_f3d0, n = 5)

## -----------------------------------------------------------------------------
exclusive_f3d0 <- strollur::names(
  miseq,
  type = "bin",
  samples = c("F3D0"),
  distinct = TRUE
)
length(exclusive_f3d0)
head(exclusive_f3d0, n = 5)

## -----------------------------------------------------------------------------
strollur::names(miseq, type = "sample")

## -----------------------------------------------------------------------------
strollur::names(miseq, type = "treatment")

## -----------------------------------------------------------------------------
strollur::names(miseq, type = "report")

## -----------------------------------------------------------------------------
strollur::count(
  miseq,
  type = "sequence",
  distinct = FALSE
)

## -----------------------------------------------------------------------------
strollur::count(
  miseq,
  type = "sequence",
  distinct = TRUE
)

## -----------------------------------------------------------------------------
strollur::count(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = FALSE
)

## -----------------------------------------------------------------------------
strollur::count(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = TRUE
)

## -----------------------------------------------------------------------------
strollur::count(
  miseq,
  type = "bin",
  bin_type = "otu"
)

## -----------------------------------------------------------------------------
strollur::count(
  miseq,
  type = "bin",
  bin_type = "otu",
  samples = c("F3D0"),
  distinct = FALSE
)

## -----------------------------------------------------------------------------
strollur::count(
  miseq,
  type = "bin",
  bin_type = "otu",
  samples = c("F3D0"),
  distinct = TRUE
)

## -----------------------------------------------------------------------------
strollur::count(miseq, type = "sample")

## -----------------------------------------------------------------------------
strollur::count(miseq, type = "treatment")

## -----------------------------------------------------------------------------
sequence_abundance <- strollur::abundance(
  miseq,
  type = "sequence",
  by_sample = FALSE
)
head(sequence_abundance, n = 10)

## -----------------------------------------------------------------------------
sequence_abundance_by_sample <- strollur::abundance(
  miseq,
  type = "sequence",
  by_sample = TRUE
)
head(sequence_abundance_by_sample, n = 10)

## -----------------------------------------------------------------------------
bin_abundance <- strollur::abundance(
  miseq,
  type = "bin",
  bin_type = "otu",
  by_sample = FALSE
)
head(bin_abundance, n = 10)

## -----------------------------------------------------------------------------
bin_abundance_by_sample <- strollur::abundance(
  miseq,
  type = "bin",
  bin_type = "otu",
  by_sample = TRUE
)
head(bin_abundance_by_sample, n = 10)

## -----------------------------------------------------------------------------
strollur::abundance(
  miseq,
  type = "sample"
)

## -----------------------------------------------------------------------------
strollur::abundance(miseq, type = "treatment")

## -----------------------------------------------------------------------------
fasta_report <- strollur::report(
  miseq,
  type = "fasta"
)
head(fasta_report, n = 5)

## -----------------------------------------------------------------------------
sequence_report <- strollur::report(
  miseq,
  type = "sequence"
)
head(sequence_report, n = 5)

## -----------------------------------------------------------------------------
sequence_classification <- strollur::report(
  miseq,
  type = "sequence_taxonomy"
)
head(sequence_classification, n = 10)

## -----------------------------------------------------------------------------
bin_classification <- strollur::report(
  miseq,
  type = "bin_taxonomy",
  bin_type = "otu"
)
head(bin_classification, n = 10)

## -----------------------------------------------------------------------------
sequence_bin_assignments <- strollur::report(
  miseq,
  type = "sequence_bin_assignment",
  bin_type = "otu"
)
head(sequence_bin_assignments, n = 10)

## -----------------------------------------------------------------------------
sample_treatment_assignments <- strollur::report(
  miseq,
  type = "sample_assignment"
)
head(sample_treatment_assignments, n = 5)

## -----------------------------------------------------------------------------
otu_bin_representatives <- strollur::report(
  miseq,
  type = "bin_representative",
  bin_type = "otu"
)
head(otu_bin_representatives, n = 5)

## -----------------------------------------------------------------------------
strollur::names(miseq, type = "report")

## -----------------------------------------------------------------------------
contigs_assembly_report <- strollur::report(
  miseq,
  type = "contigs_report"
)
head(contigs_assembly_report, n = 5)

## -----------------------------------------------------------------------------
metadata <- strollur::report(
  miseq,
  type = "metadata"
)
head(metadata, n = 5)

## -----------------------------------------------------------------------------
strollur::report(
  miseq,
  type = "resource_reference"
)

## -----------------------------------------------------------------------------
sequence_tree <- strollur::report(
  miseq,
  type = "sequence_tree"
)

## -----------------------------------------------------------------------------
sample_tree <- strollur::report(
  miseq,
  type = "sample_tree"
)

#| fig.alt: >
#|   Plot of Miseq_SOP's sample relationship tree
old_par <- par(bg = "white")
ape::plot.phylo(sample_tree,
  no.margin = TRUE,
  cex = 0.5, edge.color = "maroon", tip.color = "navy"
)
par(old_par)

## -----------------------------------------------------------------------------
strollur::report(
  miseq,
  type = "sequence_scrap"
)
strollur::report(
  miseq,
  type = "bin_scrap"
)

## -----------------------------------------------------------------------------
strollur::names(miseq, type = "report")

## -----------------------------------------------------------------------------
strollur::summary(
  miseq,
  type = "report",
  report_type = "contigs_report"
)

## -----------------------------------------------------------------------------
strollur::summary(miseq, type = "scrap")

