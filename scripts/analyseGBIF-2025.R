library(stringi)
source("./utils.R")
source("./synthesizeTradColl.R")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

gbif <- timedFread("../data/sources/GBIF/gbif-galiano-2025-03-17-0013560-250310093411724.csv")

# Solution from https://stackoverflow.com/a/29529342 for https://stackoverflow.com/questions/29529021/replace-a-data-frame-column-based-on-regex
extractINatId <- function (inatRows) {
  ids <- stri_match_first_regex(iNatRows$occurrenceID, "^.*/(.+)$")[,2]
  imerssids <- stri_match_first_regex(iNatRows$occurrenceID, "^imerss.org:iNat:(.+)$")[,2]
  iNatRows$iNatObsID <- as.numeric(ifelse(is.na(ids), imerssids, ids))
  iNatRows
}

iNatRows <- gbif[institutionCode=="iNaturalist"]

iNatRows <- extractINatId(inatRows)
iNatRows <- iNatRows[!duplicated(iNatRows$iNatObsID), ]

# Rows in GBIF not in collections project
gbifNotColl <- dplyr::anti_join(iNatRows, coll, by=c("iNatObsID"="id"))
gbifNotTrad <- dplyr::anti_join(iNatRows, trad, by=c("iNatObsID"="id"))
gbifNotUnion <- dplyr::anti_join(iNatRows, collTradUnion, by=c("iNatObsID"="id"))

timedWrite(gbifNotColl, "../data/synthesized/Galiano_GBIF_Not_Coll_2025_03_17.csv")
timedWrite(gbifNotTrad, "../data/synthesized/Galiano_GBIF_Not_Trad_2025_03_17.csv")
# This last contains iNat records that got into GBIF that are not in any iNat project -
# This will contain records whose georeferencing precision lies outside the bounds of the island, that in general we will want
timedWrite(gbifNotUnion, "../data/synthesized/Galiano_GBIF_Not_Union_2025_03_17.csv")

gbifNotINat <- gbif[institutionCode!="iNaturalist"]
timedWrite(gbifNotINat, "../data/synthesized/Galiano_GBIF_Not_iNat_2025_03_17.csv")

