# Generated from create-jsm2022.Rmd: do not edit by hand

#' Coauthorship information on JSM authors
#' 
#' A coauthorship matrix.  Element ij gives a numerical measure of how much
#' author `authors[i]` coauthors with author `authors[j]`.  This can be roughly
#' thought of as the number of papers coauthored between this pair, even though
#' that is not strictly true.  These coauthors were computed based on
#' coauthorship information across three sources: Semantic Scholar, Arxiv, and
#' the JSM program. An approximate entity matching was performed to associate
#' names across these different data sets.  Fractional values arise when we have
#' matched a JSM author to multiple Semantic Scholar authors. 
#' 
#' @format A sparse matrix of class "dgCMatrix" from the `Matrix` package.
#' @source This data was created by processing data from Arxiv, Semantic Scholar, and the JSM 2022 program.
#' 
#' Waleed Ammar, Dirk Groeneveld, Chandra Bhagavatula, Iz Beltagy, 
#' Miles Crawford, Doug Downey, Jason Dunkelberger, Ahmed Elgohary, 
#' Sergey Feldman, Vu A. Ha, Rodney Michael Kinney, Sebastian Kohlmeier, 
#' Kyle Lo, Tyler C. Murray, Hsu-Han Ooi, Matthew E. Peters, Joanna L. Power, 
#' Sam Skjonsberg, Lucy Lu Wang, Christopher Wilhelm, Zheng Yuan, 
#' Madeleine van Zuylen, Oren Etzioni, "Construction of the Literature Graph in
#' Semantic Scholar." NAACL 2018.
"coauthor"
