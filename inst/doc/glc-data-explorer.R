## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.align = "center",
  out.width = "100%"
)

## ----launch, eval = FALSE-----------------------------------------------------
# install.packages(c("shiny", "bslib"))
# glcdp::glc_explore()

## ----registry-screen, echo = FALSE, fig.alt = "GLC data explorer Registry filtered to iztech, showing the passing MELIDOS IZTECH package and its latest validated revision"----
knitr::include_graphics("figures/explorer-registry.png")

## ----summary-screen, echo = FALSE, fig.alt = "MELIDOS IZTECH package summary with counts of 1 study, 17 datasets, 17 participants, 12 devices, 323 files, and 5,554 variables"----
knitr::include_graphics("figures/explorer-package-summary.png")

## ----file-groups-screen, echo = FALSE, fig.alt = "MELIDOS IZTECH Package contents file-group view filtered to chest position, showing 17 compatible groups across 17 datasets and the direct Select and hand off action"----
knitr::include_graphics("figures/explorer-file-groups.png")

## ----contents-screen, echo = FALSE, fig.alt = "MELIDOS IZTECH variable inventory filtered to S001 acceptability variables, showing their declared factor type and semantic term"----
knitr::include_graphics("figures/explorer-package-contents.png")

## ----metadata-screen, echo = FALSE, fig.alt = "MELIDOS IZTECH metadata hierarchy filtered to VLSQ8, with the participant-characteristics resource and the compact five-field record for participant S001 expanded"----
knitr::include_graphics("figures/explorer-metadata.png")

## ----selection-screen, echo = FALSE, fig.alt = "Compatible MELIDOS IZTECH handoff for all 17 datasets, showing melanopic EDI and MEDI filters plus concise counts of 17 included and 306 structurally excluded file groups"----
knitr::include_graphics("figures/explorer-selection.png")

## ----preview-screen, echo = FALSE, fig.alt = "MELIDOS IZTECH preview step with separate file and row limits, the collected chest-sensor table directly below the full-width Build preview action, and fixed equal-width Review and Export navigation"----
knitr::include_graphics("figures/explorer-preview.png")

## ----export-screen, echo = FALSE, fig.alt = "Export step for the MELIDOS IZTECH chest-sensor selection, with the annotated R script directly below its download button, a fixed Preview button, and the exact passing revision described beside it"----
knitr::include_graphics("figures/explorer-export.png")

## ----complete-screen, echo = FALSE, fig.alt = "R script downloaded dialog naming the MELIDOS IZTECH selection script and offering to continue exploring"----
knitr::include_graphics("figures/explorer-download-complete.png")

