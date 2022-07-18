
# jsm2022

Navigate the JSM schedule from the comfort of an R console, get personalized recommendations for talks, and export your schedule as an ical.

## About

We scraped the JSM program and wrangled decades of citation and coauthorship data from Semantic Scholar and Arxiv.  We have also included functionality for exporting your schedule as an iCal that can be loaded into Google Calendar or similar. The result is a package that streamlines the process of finding talks that you may want to attend.

## Getting started

``` r
remotes::install_github("jacobbien/jsm2022")
library(jsm2022)
get_talks()
```