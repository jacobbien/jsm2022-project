
# jsm2022

Navigate the JSM schedule from the comfort of an R console, get personalized recommendations for talks, and export your schedule as an ical.

## About

We scraped the JSM program and wrangled decades of citation and coauthorship data from Semantic Scholar and Arxiv.  We have also included functionality for exporting your schedule as an ical that can be loaded into Google Calendar or similar. The result is a package that streamlines the process of finding talks that you may want to attend.

## Getting started

To install the package:

``` r
remotes::install_github("jacobbien/jsm2022")
```
 
An example of the sort of thing you can do with the package:

``` r
library(jsm2022)
my_coauthors <- get_coauthors("Jacob Bien")
people_cited_by_me <- get_out_citations("Jacob Bien")
people_citing_me <- get_in_citations("Jacob Bien")
some_people <- c(my_coauthors, people_cited_by_me[1:20], people_citing_me[1:20])
schedule <- get_talks(speakers = some_people)
```

This produces a data frame of talks.  See `?get_talks` for the other ways you can filter talks.  Finally, you can export this in the ical format, which can be imported into Google Calendar and other standard calendars:

``` r
export_calendar_to_ics(schedule, file = "jsm-talks.ics")
```
