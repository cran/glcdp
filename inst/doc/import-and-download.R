## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
live <- identical(Sys.getenv("IN_PKGDOWN"), "true") &&
  !identical(Sys.getenv("GLCDP_SKIP_LIVE"), "true")

## ----load---------------------------------------------------------------------
library(glcdp)

## ----open, eval = live--------------------------------------------------------
# iztech_repository <- "tscnlab/melidos-iztech-glc-dataset"
# iztech_dataset <- "MELIDOS_IZTECH_S001"
# iztech_demographics <- "MELIDOS_IZTECH_S001:4"
# iztech_chest_light <- "MELIDOS_IZTECH_S001:17"
# 
# iztech <- glc_open(iztech_repository)
# iztech

## ----inspect, eval = live-----------------------------------------------------
# glc_datasets(iztech)
# glc_files(iztech, dataset_id = iztech_dataset)
# glc_variables(iztech, dataset_id = iztech_dataset)

## ----select-light-file, eval = live-------------------------------------------
# file_inventory <- glc_files(
#   iztech,
#   dataset_id = iztech_dataset
# )
# sensor_file <- file_inventory[
#   file_inventory$file_group_id == iztech_chest_light,
# ]
# sensor_file[, c(
#   "file_group_id", "path", "device_id", "expected_bytes"
# )]
# 
# source_file <- basename(sensor_file$path[[1]])
# source_file

## ----read-selection, eval = live----------------------------------------------
# light_collection <- glc_read(
#   iztech,
#   dataset_id = iztech_dataset,
#   file_group = iztech_chest_light,
#   files = source_file,
#   variables = "MEDI",
#   n_max = 10000
# )
# light_collection

## ----read-primary, eval = live------------------------------------------------
# primary_light <- glc_read(
#   iztech,
#   dataset_id = iztech_dataset,
#   file_group = iztech_chest_light,
#   primary_only = TRUE,
#   n_max = 10000
# )
# primary_data <- primary_light$data[[1]]
# primary_data[stats::complete.cases(primary_data), ]

## ----schema-types, eval = live------------------------------------------------
# demographic_variables <- glc_variables(
#   iztech,
#   file_group = iztech_demographics
# )
# demographic_variables[, c("name", "type", "factor_values")]

## ----read-types, eval = live--------------------------------------------------
# demographics <- glc_read(
#   iztech,
#   dataset_id = iztech_dataset,
#   file_group = iztech_demographics
# )
# demographic_data <- demographics$data[[1]]
# 
# levels(demographic_data$sex)
# levels(demographic_data$employment_status)

## ----read-warn, eval = live---------------------------------------------------
# exploratory_demographics <- glc_read(
#   iztech,
#   dataset_id = iztech_dataset,
#   file_group = iztech_demographics,
#   problems = "warn"
# )

## ----collection, eval = live--------------------------------------------------
# light_collection[, setdiff(names(light_collection), "data")]
# names(light_collection$data[[1]])

## ----collect, eval = live-----------------------------------------------------
# light_data <- glc_collect(light_collection)
# head(light_data[!is.na(light_data$MEDI), ])

## ----collect-none, eval = live------------------------------------------------
# source_data <- glc_collect(
#   light_collection,
#   standardize = "none"
# )
# head(source_data)

## ----metadata-pair, eval = live-----------------------------------------------
# analysis_metadata <- tibble::tibble(
#   file_group_id = unique(as.character(light_data$file_group_id)),
#   analysis_set = "chest sensor"
# )
# 
# metadata_summary <- extract_metadata(
#   light_data,
#   analysis_metadata,
#   fields = "analysis_set"
# )
# metadata_summary
# 
# enriched_data <- add_metadata(
#   light_data,
#   analysis_metadata,
#   fields = "analysis_set"
# )
# 
# enriched_data |>
#   head() |>
#   dplyr::select(-file.name)

## ----metadata-resource, eval = live-------------------------------------------
# glc_search_metadata(
#   iztech,
#   "participant_age",
#   resources = "participants",
#   search_in = "fields"
# )
# 
# dataset_metadata <- extract_metadata(
#   light_data,
#   iztech,
#   fields = c(
#     "dataset_timezone",
#     "dataset_location",
#     "participant_age",
#     "study_title",
#     "device_model"
#   )
# )
# dataset_metadata
# 
# add_metadata(
#   light_data,
#   iztech,
#   fields = c(
#     "dataset_timezone",
#     "dataset_location",
#     "participant_age",
#     "study_title",
#     "device_model"
#   )
# ) |>
#   head() |>
#   dplyr::select(
#     Id,
#     dataset_timezone,
#     dataset_location,
#     participant_age,
#     study_title,
#     device_model
#   )

## ----download-metadata, eval = live-------------------------------------------
# metadata_dir <- tempfile("iztech-metadata-")
# glc_download(iztech, metadata_dir)

## ----download-data, eval = live-----------------------------------------------
# data_dir <- tempfile("iztech-s001-demographics-")
# downloads <- glc_download(
#   iztech,
#   data_dir,
#   include = "data",
#   dataset_id = iztech_dataset,
#   file_group = iztech_demographics
# )
# downloads

## ----reopen, eval = live------------------------------------------------------
# local <- glc_open(data_dir)
# glc_summary(local)
# glc_files(local, dataset_id = iztech_dataset, available = TRUE)
# 
# local_collection <- glc_read(
#   local,
#   dataset_id = iztech_dataset,
#   file_group = iztech_demographics
# )
# local_data <- glc_collect(local_collection)
# local_data

## ----cache, eval = live-------------------------------------------------------
# cached <- glc_open(
#   iztech_repository,
#   cache_dir = file.path(tempdir(), "glcdp-iztech-cache")
# )

