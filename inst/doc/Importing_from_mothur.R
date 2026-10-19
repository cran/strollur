## ----include = FALSE----------------------------------------------------------
library(strollur)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
data <- strollur::read_mothur(
  fasta = strollur_example("final.fasta.gz"),
  count = strollur_example("final.count_table.gz"),
  taxonomy = strollur_example("final.taxonomy.gz"),
  design = strollur_example("mouse.time.design"),
  otu_list = strollur_example("final.opti_mcc.list.gz"),
  asv_list = strollur_example("final.asv.list.gz"),
  phylo_list = strollur_example("final.tx.list.gz"),
  sample_tree = strollur_example("final.opti_mcc.jclass.ave.tre"),
  dataset_name = "miseq_sop"
)

## -----------------------------------------------------------------------------
data

## -----------------------------------------------------------------------------
my_data <- strollur::new_dataset(dataset_name = "my_data")

## -----------------------------------------------------------------------------
fasta_data <- strollur::read_fasta(fasta = strollur_example("final.fasta.gz"))

## -----------------------------------------------------------------------------
strollur::add(my_data, table = fasta_data, type = "sequence")
my_data

## -----------------------------------------------------------------------------
sample_table <- strollur::read_mothur_count(
  filename = strollur_example("final.count_table.gz")
)

## -----------------------------------------------------------------------------
strollur::assign(my_data, table = sample_table, type = "sequence_abundance")
my_data

## -----------------------------------------------------------------------------
classification_data <- strollur::read_mothur_taxonomy(
  taxonomy = strollur_example("final.taxonomy.gz")
)

## -----------------------------------------------------------------------------
strollur::assign(my_data,
  table = classification_data,
  type = "sequence_taxonomy"
)

## -----------------------------------------------------------------------------
otu_data <-
  strollur::read_mothur_list(
    list = strollur_example("final.opti_mcc.list.gz")
  )
asv_data <-
  strollur::read_mothur_list(list = strollur_example("final.asv.list.gz"))
phylotype_data <-
  strollur::read_mothur_list(list = strollur_example("final.tx.list.gz"))

## -----------------------------------------------------------------------------
strollur::assign(my_data, table = otu_data, type = "bin", bin_type = "otu")
strollur::assign(my_data, table = asv_data, type = "bin", bin_type = "asv")
strollur::assign(
  my_data,
  table = phylotype_data,
  type = "bin", bin_type = "phylotype"
)
my_data

## -----------------------------------------------------------------------------
otu_taxonomy_data <- strollur::read_mothur_cons_taxonomy(
  taxonomy =
    strollur_example("final.cons.taxonomy")
)

## -----------------------------------------------------------------------------
strollur::assign(my_data, table = otu_taxonomy_data, type = "bin_taxonomy")

