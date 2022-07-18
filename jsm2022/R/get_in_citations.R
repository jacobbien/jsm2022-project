# Generated from create-jsm2022.Rmd: do not edit by hand

#' Return the JSM authors that cite this JSM author
#' 
#' For some authors (particularly new ones), it can be useful to augment their
#' citations with those of coauthors.  Use `augment=TRUE` for this.
#' 
#' @param name name of a JSM author
#' @param augment should we include out citations of coauthors?
#' 
#' @export
get_in_citations <- function(name, augment = FALSE) {
  ii <- which(jsm2022::authors == name)
  if (length(ii) == 0) {
    message("Author not found.")
    return(character(0))
  }
  ii_cites <- ordered_nz(jsm2022::cites[, ii])
  if (augment) {
    ii_coa <- ordered_nz(jsm2022::coauthor[ii, ])
    # weighted sum of who cites the coauthors (weighted by coauthor strength):
    wtd <- jsm2022::coauthor[ii, ii_coa] %*% t(jsm2022::cites[, ii_coa])
    ii_coa_cites <- ordered_nz(as.numeric(wtd))
    # start with author's own cites and follow with those of coauthors:
    ii_cites <- c(ii_cites, setdiff(ii_coa_cites, ii_cites))
  }
  jsm2022::authors[ii_cites]
}
