## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
live <- identical(Sys.getenv("IN_PKGDOWN"), "true") &&
  !identical(Sys.getenv("GLCDP_SKIP_LIVE"), "true")

## ----load---------------------------------------------------------------------
library(glcdp)

## ----registry, eval = live----------------------------------------------------
# packages <- glc_packages()
# packages[, c(
#   "id", "repository", "current_status", "has_latest_pass",
#   "attestation_verified"
# )]

## ----registry-refresh, eval = live--------------------------------------------
# packages <- glc_packages(refresh = TRUE)

## ----registry-search, eval = live---------------------------------------------
# glc_search_packages("iztech", packages)
# glc_search_packages(packages = packages, status = c("pass", "fail"))
# glc_search_packages(packages = packages, has_pass = FALSE)

## ----open-latest-pass, eval = live--------------------------------------------
# iztech_repository <- "tscnlab/melidos-iztech-glc-dataset"
# iztech <- glc_open(iztech_repository)
# iztech

## ----open-revisions, eval = live----------------------------------------------
# current <- glc_open(
#   iztech_repository,
#   ref = "current"
# )
# current
# 
# registry_row <- glc_search_packages("melidos-iztech", packages)
# registry_row$repository[[1]]
# registry_row$latest_pass_commit[[1]]
# 
# pinned <- glc_open(
#   registry_row$repository[[1]],
#   ref = registry_row$latest_pass_commit[[1]]
# )
# pinned

## ----summary, eval = live-----------------------------------------------------
# glc_summary(iztech)

## ----resources, eval = live---------------------------------------------------
# glc_resources(iztech)

## ----datasets, eval = live----------------------------------------------------
# iztech_dataset <- "MELIDOS_IZTECH_S001"
# iztech_demographics <- "MELIDOS_IZTECH_S001:4"
# iztech_chest_light <- "MELIDOS_IZTECH_S001:17"
# 
# glc_datasets(iztech)
# 
# glc_files(iztech, dataset_id = iztech_dataset)
# glc_files(
#   iztech,
#   # dataset_id = iztech_dataset,
#   modality = "light",
#   available = TRUE
# ) |>
#   dplyr::filter(device_location == "eye level")

## ----variables, eval = live---------------------------------------------------
# demographic_variables <- glc_variables(
#   iztech,
#   file_group = iztech_demographics
# )
# demographic_variables[, c(
#   "name", "type", "factor_values", "primary"
# )]
# 
# glc_variables(
#   iztech,
#   file_group = iztech_chest_light,
#   primary = TRUE
# )
# glc_variables(iztech, term = "melanopic_edi")

## ----metadata, eval = live----------------------------------------------------
# metadata <- glc_metadata(
#   iztech,
#   resources = c("study", "participants")
# )
# names(metadata)
# metadata$study
# metadata$participants

## ----metadata-search, eval = live---------------------------------------------
# glc_search_metadata(iztech, "light exposure")
# 
# glc_search_metadata(
#   iztech,
#   "age",
#   resources = "participants",
#   search_in = "fields"
# )
# 
# glc_search_metadata(
#   iztech,
#   "meq_type",
#   resources = "participant_characteristics"
# )
# 
# glc_search_metadata(
#   iztech,
#   "Izmir",
#   resources = "study",
#   fields = "study_geographical_location"
# )

## ----local, eval = FALSE------------------------------------------------------
# iztech_local <- glc_open("path/to/iztech-subset", quiet = TRUE)
# glc_summary(iztech_local)
# glc_files(iztech_local, available = FALSE)

