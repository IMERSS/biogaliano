library(dplyr)
library(stringr)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source("../../scripts/utils.R")

birdSummaryIn <- timedRead("./Galiano_birds_review_summary_2023-11-05.csv");
allObs <- timedRead("../../data/synthesized/Galiano_GBIF_And_iNat_2025_03_17-assigned.csv")

birdObs <- allObs %>% filter(class == "Aves")

birdTaxa <- sort(unique(birdObs$scientificName))

print(str_glue("Filtered {nrow(birdObs)} bird observations from {nrow(allObs)} total observations"))

notObservedTaxa <- birdSummaryIn %>% filter(!Taxon %in% birdTaxa)

timedWrite(notObservedTaxa, "Galiano_birds_review_summary_not_confirmed_2025_03_17.csv")

newFrame <- data.frame(scientificName = birdTaxa)

potentiallyNew <- newFrame %>% filter(!scientificName %in% birdSummaryIn$Taxon)

print(str_glue("Found {nrow(potentiallyNew)} bird taxa not seen in summary"))

timedWrite(potentiallyNew, "Galiano_birds_review_summary_potentially_new_2025_03_17.csv")
