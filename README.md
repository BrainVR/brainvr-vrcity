# brainvr-vrcity

Package to analyse data from the VR City paradigm.

## Online Documentation (pkgdown)

This repository uses `pkgdown` to build a package website, including reference pages and articles with examples based on:

- `temp/260204171959`

### Build the website locally

From the repository root in R:

```r
pkgdown::build_site()
```

The generated site is written to:

- `docs/`

Prerequisites:

- `pkgdown`, `knitr`, `rmarkdown` installed in R
- Pandoc available (e.g., via RStudio or system installation)

### Publish to GitHub Pages

Recommended (CI):

1. Commit and push the repo with `.github/workflows/pkgdown.yaml`.
2. Enable GitHub Pages to serve from branch `gh-pages` (root).
3. On push to `main`/`master`, GitHub Actions builds and deploys the site automatically.

### Website structure

- `_pkgdown.yml`: site navigation and config
- `vignettes/getting-started.Rmd`: installation and quick start
- `vignettes/temp-workflow.Rmd`: loading, querying, and plotting with `temp/260204171959`
