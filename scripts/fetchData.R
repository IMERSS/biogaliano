source("scripts/utils.R")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Fetch from folder https://drive.google.com/drive/folders/1n2NRKoBhX7zHlIUXeXyRoP-Lz3wc2f-O
# IMERSS Research Projects/Community Research Projects/2019-2025 - Galiano Island Data Paper Series/Galiano 2024

downloadGdrive("1GIs8uo282Rtnk7C_YsNQAKNIB2YsCsVB", "../data/sources/GBIF/gbif-galiano-2025-03-17-0013560-250310093411724.csv")
