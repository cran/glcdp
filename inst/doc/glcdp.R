## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center"
)
live <- identical(Sys.getenv("IN_PKGDOWN"), "true") &&
  !identical(Sys.getenv("GLCDP_SKIP_LIVE"), "true")

## ----install, eval = FALSE----------------------------------------------------
# pak::pak("tscnlab/glc-dp-r")
# library(glcdp)

## ----schemas------------------------------------------------------------------
library(glcdp)
glc_schema_versions()

## ----discover, eval = live----------------------------------------------------
# packages <- glc_packages()
# packages
# 
# glc_search_packages("iztech", packages)

## ----filter-registry, eval = live---------------------------------------------
# glc_search_packages(packages = packages, status = "pass")
# glc_search_packages(packages = packages, has_pass = TRUE)

## ----open, eval = live--------------------------------------------------------
# iztech_repository <- "tscnlab/melidos-iztech-glc-dataset"
# iztech_dataset <- "MELIDOS_IZTECH_S001"
# iztech_demographics <- "MELIDOS_IZTECH_S001:4"
# iztech_chest_light <- "MELIDOS_IZTECH_S001:17"
# 
# iztech <- glc_open(iztech_repository)
# iztech

## ----open-local, eval = FALSE-------------------------------------------------
# local_package <- glc_open("path/to/data-package")

## ----inspect-summary, eval = live---------------------------------------------
# glc_summary(iztech)

## ----inspect-inventories, eval = live-----------------------------------------
# glc_datasets(iztech)
# glc_files(iztech, dataset_id = "MELIDOS_IZTECH_S001")
# glc_variables(
#   iztech,
#   file_group = "MELIDOS_IZTECH_S001:17",
#   primary = TRUE
# )

## ----inspect-metadata, eval = live--------------------------------------------
# metadata <- glc_metadata(
#   iztech,
#   resources = c("study", "participants")
# )
# metadata$study
# metadata$participants
# 
# glc_search_metadata(iztech, "Izmir", resources = "study")
# glc_search_metadata(
#   iztech,
#   "participant_age",
#   resources = "participants",
#   search_in = "fields"
# )

## ----inspect-types, eval = live-----------------------------------------------
# demographic_variables <- glc_variables(
#   iztech,
#   file_group = "MELIDOS_IZTECH_S001:4"
# )
# demographic_variables[, c("name", "type", "factor_values")]

## ----read-types, eval = live--------------------------------------------------
# demographics <- glc_read(
#   iztech,
#   dataset_id = "MELIDOS_IZTECH_S001",
#   file_group = "MELIDOS_IZTECH_S001:4"
# )
# demographic_data <- demographics$data[[1]]
# demographic_data
# levels(demographic_data$sex)

## ----read, eval = live--------------------------------------------------------
# light_collection <- glc_read(
#   iztech,
#   dataset_id = "MELIDOS_IZTECH_S001",
#   file_group = "MELIDOS_IZTECH_S001:17",
#   variables = "LIGHT",
#   n_max = 10000
# )
# light_collection

## ----inspect-collection, eval = live------------------------------------------
# names(light_collection$data[[1]])

## ----collect, eval = live-----------------------------------------------------
# light_data <- glc_collect(light_collection)
# head(light_data[!is.na(light_data$LIGHT), ])

## ----collect-unstandardized, eval = live--------------------------------------
# source_data <- glc_collect(
#   light_collection,
#   standardize = "none"
# )
# head(source_data)

