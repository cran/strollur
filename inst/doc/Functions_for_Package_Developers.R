## ----include = FALSE----------------------------------------------------------
library(strollur)
set.seed(19760620)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
miseq <- miseq_sop_example()
miseq

## -----------------------------------------------------------------------------
names(miseq, type = "dataset")
xdev_set_dataset_name(miseq, dataset_name = "modified_miseq")
names(miseq, type = "dataset")

## -----------------------------------------------------------------------------
f3d0_names <- names(
  miseq,
  type = "sequence",
  samples = c("F3D0"),
  distinct = TRUE
)
length(f3d0_names)

## -----------------------------------------------------------------------------
nnnn_neucleotides <- rep("NNNN", length(f3d0_names))
comments <- rep("example_set_sequences", length(f3d0_names))

xdev_set_sequences(
  miseq,
  sequence_names = f3d0_names,
  sequences = nnnn_neucleotides, comments = comments
)

f3d0_sequences <- xdev_get_by_sample(
  miseq,
  type = "sequence", samples = c("F3D0")
)
f3d0_sequences[[1]][300:305]

## -----------------------------------------------------------------------------
abundance_table <- abundance(
  miseq,
  type = "sequence", by_sample = TRUE
)
head(abundance_table, n = 10)

num_samples <- count(miseq, type = "sample")
new_abunds <- rep(list(rep(0, num_samples)), length(f3d0_names))

xdev_set_abundances(
  miseq,
  sequence_names = f3d0_names,
  abundances = new_abunds,
  reason = "F3D0_exclusive_sequences"
)
miseq

## ----eval=FALSE---------------------------------------------------------------
# random_sequence_names <- sample(names(miseq),
#   size = 100, replace = FALSE
# )
# 
# xdev_merge_sequences(
#   miseq,
#   sequence_names = random_sequence_names,
#   reason = "merge_sequences_example"
# )

## -----------------------------------------------------------------------------
random_bin_names <- sample(
  names(
    miseq,
    type = "bin",
    bin_type = "otu"
  ),
  size = 100, replace = FALSE
)

xdev_merge_bins(
  miseq,
  bin_names = random_bin_names,
  reason = "merge_bins_example",
  bin_type = "otu"
)
miseq

## -----------------------------------------------------------------------------
random_sequence_names <- sample(names(miseq),
  size = 100, replace = FALSE
)
xdev_remove_sequences(
  miseq,
  sequence_names = random_sequence_names,
  trash_tags = rep("remove_sequences_example", 100)
)
miseq

## -----------------------------------------------------------------------------
random_bin_names <- sample(
  names(
    miseq,
    type = "bin", bin_type = "phylotype"
  ),
  size = 10, replace = FALSE
)
xdev_remove_bins(
  miseq,
  bin_names = random_bin_names,
  trash_tags = rep("remove_bins_example", 10),
  bin_type = "phylotype"
)
miseq

## -----------------------------------------------------------------------------
xdev_remove_samples(
  miseq,
  samples = c("F3D142"), reason = "remove_samples_example"
)
miseq

## -----------------------------------------------------------------------------
bad_tax <- paste0(
  "Bacteria;Firmicutes;Clostridia;Clostridiales;",
  "Clostridiales_unclassified;"
)

xdev_remove_lineages(
  miseq,
  contaminants = c(bad_tax),
  reason = "remove_contaminants_example"
)
miseq

