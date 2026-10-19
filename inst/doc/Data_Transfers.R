## ----include = FALSE----------------------------------------------------------
library(strollur)
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
miseq <- strollur::miseq_sop_example()
miseq

## -----------------------------------------------------------------------------
file_name <- file.path(tempdir(), "miseq_sop.rds")
strollur::save_dataset(miseq, file = file_name)

miseq_from_rds <- strollur::load_dataset(file = file_name)
miseq_from_rds
unlink(file_name)

## -----------------------------------------------------------------------------
dgc_data <-
  strollur::read_mothur_list(list = strollur_example("final.dgc.list.gz"))

strollur::assign(miseq_from_rds, table = dgc_data, bin_type = "dgc")
miseq_from_rds
miseq

## -----------------------------------------------------------------------------
table <- strollur::export_dataset(miseq)
str(table)

## -----------------------------------------------------------------------------
miseq_import <- strollur::import_dataset(table = table)
miseq_import

## -----------------------------------------------------------------------------
miseq_deep_copy <- copy_dataset(miseq)

miseq_shallow_copy <- miseq

## -----------------------------------------------------------------------------
strollur::assign(miseq_shallow_copy, table = dgc_data, bin_type = "dgc")

miseq

miseq_shallow_copy

miseq_deep_copy

