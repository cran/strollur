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
phyloseq_object <- readRDS(strollur_example("GlobalPatterns.RDS"))
class(phyloseq_object)
strollur_object <- strollur::read_phyloseq(phyloseq_object)
class(strollur_object)

## ----rdataset_functions-------------------------------------------------------
strollur::count(strollur_object, type = "sample")
head(strollur::names(strollur_object, type = "sequence"))
head(strollur::abundance(strollur_object, type = "sequence"))

## ----write_phyloseq-----------------------------------------------------------
phyloseq_object <- strollur::write_phyloseq(strollur_object)
phyloseq_object

miseq <- strollur::miseq_sop_example()
miseq_phyloseq <- strollur::write_phyloseq(miseq)
miseq_phyloseq

