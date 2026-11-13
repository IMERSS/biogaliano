# Biodiversity informatics pipeline (staging)

Placeholder for the data aggregation → synthesis → curation → publication pipeline
that will feed the site's biodiversity displays.

- `data/sources/`     raw pulls (iNaturalist, GBIF, herbaria, historical checklists)
- `data/synthesized/` merged/reconciled catalogues
- `data/curated/`     reviewed outputs consumed by the site (copied/linked into `static/` or `data/`)
- `review/`           taxon-group review workflows
- `R/`                pipeline code

The previous pipeline (fetchData.R, fuseGBIFiNat.R, synthesizeTradColl.R, bird review)
lives in git history at commit 6478e25 — restore with
`git checkout 6478e25 -- scripts data review`.
Display components will be redesigned from scratch.
