# Generated from create-jsm2022.Rmd: do not edit by hand

#' Get indices of nonzero elements of a vector ordered from largest to smallest
#' 
#' This is like `which(vec != 0)`, but with indices sorted by size of `vec`.
#' 
#' @param vec a numerical vector
ordered_nz <- function(vec) {
  ii <- which(vec != 0)
  if (length(ii) == 0) return(integer(0))
  ii[order(vec[ii], decreasing = TRUE)]
}
