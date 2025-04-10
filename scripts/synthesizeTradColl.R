library(dplyr)

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

source("utils.R")

trad <- timedRead("../data/sources/iNaturalist/Galiano_Trad_Catalogue_2025_03_14.csv")
coll <- timedRead("../data/sources/iNaturalist/Galiano_Coll_Catalogue_2025_03_14.csv")

tradNotColl <- dplyr::anti_join(trad, coll, by=c("id"))
collNotTrad <- dplyr::anti_join(coll, trad, by=c("id"))

collTradUnion <- merge(trad, coll, all=TRUE)

# If some fields, e.g. commonName contain discrepant values we may end up with two rows
collTradUnion <- collTradUnion[!duplicated(collTradUnion$id), ]

timedWrite(tradNotColl, "../data/synthesized/Galiano_Trad_Not_Coll_2025_03_14.csv")
timedWrite(collNotTrad, "../data/synthesized/Galiano_Coll_Not_Trad_2025_03_14.csv")
timedWrite(collTradUnion, "../data/synthesized/Galiano_Union_Catalogue_2025_03_14.csv")

