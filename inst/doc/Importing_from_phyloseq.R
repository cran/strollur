## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
if (!requireNamespace("phyloseq", quietly = TRUE)) {
  message("Suggested package: 'phyloseq' is not installed")
  knitr::opts_chunk$set(eval = FALSE)
} else {
  library(phyloseq)
}
library(strollur)

## -----------------------------------------------------------------------------
# Using the phyloseq example data
phylo_object <- readRDS(strollur_example("GlobalPatterns.RDS"))
rdata_object <- read_phyloseq(phylo_object)
rdata_object

## ----rdataset_functions-------------------------------------------------------
count(rdata_object, type = "sample")
head(names(rdata_object, type = "sequence"))
head(abundance(rdata_object, type = "sequence"))

## ----write_phyloseq-----------------------------------------------------------
phyloseq_object <- write_phyloseq(rdata_object)
phyloseq_object


# With the miseq example data
miseq <- miseq_sop_example()
miseq_phyloseq <- write_phyloseq(miseq)
miseq_phyloseq

