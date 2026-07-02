## ----include = FALSE----------------------------------------------------------
if (!requireNamespace("h5lite", quietly = TRUE)) {
  message("Suggested package: 'h5lite' is not installed")
  knitr::opts_chunk$set(eval = FALSE)
} else {
  library(h5lite)
}
library(strollur)

## -----------------------------------------------------------------------------
qza_files <- c(
  strollur_example("rep_seqs.qza"),
  strollur_example("table.qza"),
  strollur_example("taxonomy.qza"),
  strollur_example("rooted-tree.qza")
)

data <- read_qiime2(
  qza = qza_files,
  metadata = strollur_example("sample_metadata.tsv"),
  dataset_name = "qiime_moving_pictures"
)

## -----------------------------------------------------------------------------
data

## -----------------------------------------------------------------------------
my_data <- new_dataset(dataset_name = "my_data")

## -----------------------------------------------------------------------------
fasta_artifact <- unpack_qiime2_artifact(qza = strollur_example("rep_seqs.qza"))

## -----------------------------------------------------------------------------
fasta_file <- file.path(
  getwd(), "rep_seqs", fasta_artifact$uuid, "data",
  "dna-sequences.fasta"
)
fasta_data <- strollur::read_fasta(fasta = fasta_file)

## -----------------------------------------------------------------------------
add(
  my_data,
  table = fasta_data,
  type = "sequence"
)

## -----------------------------------------------------------------------------
unlink(file.path(getwd(), "rep_seqs"), recursive = TRUE)

## -----------------------------------------------------------------------------
abundance <- read_qiime2_feature_table(strollur_example("table.qza"))

assign(
  my_data,
  table = abundance$data,
  type = "sequence_abundance",
  table_names = list(sequence_name = "bin_name")
)

assign(
  my_data,
  table = abundance$data,
  type = "bin",
  bin_type = "asv",
  table_names = list(sequence_name = "bin_name")
)

my_data

## -----------------------------------------------------------------------------
taxonomy <- read_qiime2_taxonomy(strollur_example("taxonomy.qza"))

assign(
  my_data,
  table = taxonomy$data,
  type = "sequence_taxonomy",
  table_names = list(sequence_name = "bin_name")
)

## -----------------------------------------------------------------------------
tree_artifact <- unpack_qiime2_artifact(
  qza =
    strollur_example("rooted-tree.qza")
)

## -----------------------------------------------------------------------------
tree_file <- file.path(
  getwd(), "rooted-tree", tree_artifact$uuid, "data",
  "tree.nwk"
)
sequence_tree <- ape::read.tree(tree_file)

## -----------------------------------------------------------------------------
my_data$add_sequence_tree(tree = sequence_tree)

## -----------------------------------------------------------------------------
unlink(file.path(getwd(), "rooted-tree"), recursive = TRUE)

## -----------------------------------------------------------------------------
metadata <- read_qiime2_metadata(
  metadata =
    strollur_example("sample_metadata.tsv")
)

## -----------------------------------------------------------------------------
add(my_data, table = metadata, type = "report", report_type = "metadata")

## -----------------------------------------------------------------------------
my_data

