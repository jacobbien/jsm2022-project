# Generated from create-jsm2022.Rmd: do not edit by hand  
testthat::test_that("get_talks() works", {
  talk_jb <- get_talks(speakers = "Jacob Bien")
  testthat::expect_equal(
    talk_jb$title[[1]],
    "Mixture of Multivariate Sparse Regressions Modeling for Oceanographic Flow Cytometry Data"
  )
  testthat::expect_equal(
    nrow(get_talks(speakers = c("Jacob Bien", "Guo Yu"))),
    2
  )
  testthat::expect_equal(
    get_talks(speakers = c("Jacob Bien", "Guo Yu")),
    get_talks(authors = c("Jacob Bien", "Guo Yu"))
  )
  testthat::expect_equal(
    nrow(get_talks(authors = c("Jacob Bien", "Guo Yu", "Sumanta Basu"))),
    6
  )
  testthat::expect_equal(
    get_talks(speakers = "Jacob Bien", authors = c("Jacob Bien", "Guo Yu")),
    talk_jb
  )
  testthat::expect_equal(
    nrow(get_talks(people = "Jacob Bien")),
    6
  )
  testthat::expect_equal(
    get_talks(people = "Jacob Bien", days = as.Date("2022-08-11")),
    talk_jb
  )
})

testthat::test_that("ordered_nz() works", {
  testthat::expect_equal(
    ordered_nz(c(0, 0, 14, 0, 2, 100, -2)),
    c(6, 3, 5, 7)
  )
})

testthat::test_that("get_coauthors() works", {
  testthat::expect_true("Daniela Witten" %in% get_coauthors("Jacob Bien"))
})

testthat::test_that("get_*_citations() works", {
  jb_out_cite <- get_out_citations("Jacob Bien", augment = FALSE)
  jb_in_cite <- get_in_citations("Jacob Bien", augment = FALSE)
  testthat::expect_true("Daniela Witten" %in% jb_out_cite)
  testthat::expect_true("Daniela Witten" %in% jb_in_cite)
  testthat::expect_equal(
    jb_out_cite,
    get_out_citations("Jacob Bien", augment = FALSE)[1:length(jb_out_cite)]
  )
  testthat::expect_equal(
    jb_in_cite,
    get_in_citations("Jacob Bien", augment = FALSE)[1:length(jb_in_cite)]
  )
})

