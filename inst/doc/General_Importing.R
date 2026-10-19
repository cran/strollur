## ----include = FALSE----------------------------------------------------------
library(strollur)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
data <- strollur::new_dataset(dataset_name = "my_data")

## -----------------------------------------------------------------------------
fasta_data <- strollur::read_fasta(strollur_example("final.fasta.gz"))
str(fasta_data)

strollur::add(
  data,
  table = fasta_data,
  type = "sequence"
)
data

## -----------------------------------------------------------------------------
strollur::clear(data)

documentation_url <- "https://mothur.org/wiki/silva_reference_files/"
method_url <- "https://mothur.org/blog/2024/SILVA-v138_2-reference-files/"

silva_resource <- strollur::new_reference(
  vendor = "SILVA",
  name = "silva.bacteria.fasta",
  version = "1.38.1",
  usage = "alignment of sequences",
  note = "reference trimmed to V4 region",
  documentation_url = documentation_url,
  method_url = method_url
)

strollur::add(
  data,
  table = fasta_data,
  type = "sequence",
  reference = silva_resource
)
data

## ----eval=FALSE---------------------------------------------------------------
# contigs_report <- readRDS(strollur_example("miseq_contigs_report.rds"))
# 
# strollur::add(
#   data,
#   table = contigs_report,
#   type = "report",
#   report_type = "contigs_report"
# )
# 
# # Error: The report must include a column containing sequence names.
# # sequence_name is not a named column in your report.
# 
# # Called from: strollur::xdev_add_report(data, table = table, type = report_type,
# #    sequence_name = table_names[["sequence_name"]], verbose)

## -----------------------------------------------------------------------------
contigs_report <- readRDS(strollur_example("miseq_contigs_report.rds"))
str(contigs_report)

strollur::add(
  data,
  table = contigs_report,
  type = "report",
  report_type = "contigs_report",
  table_names = list(sequence_name = "Name")
)
data

## -----------------------------------------------------------------------------
metadata <- readRDS(strollur_example("miseq_metadata.rds"))
str(metadata)

strollur::add(
  data,
  table = metadata,
  type = "report",
  report_type = "metadata"
)

## -----------------------------------------------------------------------------
reference <- readr::read_csv(strollur_example("references.csv"),
  col_names = TRUE, show_col_types = FALSE
)

strollur::add(
  data,
  table = reference,
  type = "resource_reference"
)

## -----------------------------------------------------------------------------
sample_tree <- ape::read.tree(strollur_example("final.opti_mcc.jclass.ave.tre"))
sequence_tree <- ape::read.tree(strollur_example("final.phylip.tre.gz"))

strollur::add(data, table = sample_tree, type = "sample_tree")
strollur::add(data, table = sequence_tree, type = "sequence_tree")

#| fig.alt: >
#|   Plot of Miseq_SOP's sample relationship tree
old_par <- par(bg = "white")
ape::plot.phylo(sample_tree,
  no.margin = TRUE,
  cex = 0.5, edge.color = "maroon", tip.color = "navy"
)
par(old_par)

## -----------------------------------------------------------------------------
abundance_table <- readRDS(strollur_example("miseq_abundance_by_sample.rds"))
str(abundance_table)

strollur::assign(data, table = abundance_table, type = "sequence_abundance")

data

## -----------------------------------------------------------------------------
bin_table <- readRDS(strollur_example("miseq_list_otu.rds"))
str(bin_table)

strollur::assign(data, table = bin_table, type = "bin", bin_type = "otu")

data

## -----------------------------------------------------------------------------
sequence_classification_data <- strollur::read_mothur_taxonomy(
  taxonomy = strollur_example("final.taxonomy.gz")
)
str(sequence_classification_data)

strollur::assign(
  data,
  table = sequence_classification_data,
  type = "sequence_taxonomy"
)

## -----------------------------------------------------------------------------
otu_taxonomy_data <- strollur::read_mothur_cons_taxonomy(strollur_example(
  "final.cons.taxonomy"
))
str(otu_taxonomy_data)

strollur::assign(
  data,
  table = otu_taxonomy_data,
  type = "bin_taxonomy",
  bin_type = "otu"
)

## -----------------------------------------------------------------------------
bin_reps <- readRDS(strollur_example("miseq_representative_sequences.rds"))
str(bin_reps)

strollur::assign(
  data,
  table = bin_reps,
  type = "bin_representative"
)

## -----------------------------------------------------------------------------
sample_assignments <- readRDS(strollur_example("miseq_sample_design.rds"))
str(sample_assignments)

strollur::assign(
  data,
  table = sample_assignments,
  type = "treatment"
)

