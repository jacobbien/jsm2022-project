# Generated from create-jsm2022.Rmd: do not edit by hand

#' Return the JSM authors who are co-authors
#' 
#' @param name name of a JSM author
#' 
#' @export
get_coauthors <- function(name) {
  ii <- which(jsm2022::authors == name)
  if (length(ii) == 0) {
    message("Author not found.")
    return(character(0))
  }
  ii_coa <- ordered_nz(jsm2022::coauthor[ii, ])
  jsm2022::authors[ii_coa]
}
