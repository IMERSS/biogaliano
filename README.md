# biogaliano

Replacement for https://biogaliano.org (currently WordPress). Hugo + R blogdown site using the
Hextra theme, structured after [IMERSS/imerss-org](https://github.com/IMERSS/imerss-org).

## Build
- R/RStudio: `blogdown::serve_site()` (see `.Rprofile`)
- CLI: `hugo server` to preview, `hugo` to build into `docs/` (GitHub Pages source)

## Layout
- `content/` site pages (sections mirror the current site: About, Community, News, Biodiversity, Places, Records, Get Involved)
- `layouts/`, `assets/`, `static/css/biogaliano.css` site overrides (CSS classes still use the `imerss-` prefix from the template)
- `themes/hextra/` vendored theme
- `data/logos.yaml` partner logos
- `pipeline/` biodiversity informatics staging (see pipeline/README.md)

## Open TODOs for the site skeleton
- Port page text from biogaliano.org; migrate news posts; images
- BioGaliano logo/favicons (currently IMERSS ones), colour palette in biogaliano.css
- Social links shortcode (TODO handles), partner logos
- Redirects from legacy WordPress slugs (/taxa/, /stats/, /5464-2/ …)
- Add docs/CNAME only at DNS cutover
