# jsm2022-project

This R package is created using literate programming with the  [litr](https://github.com/jacobbien/litr-project/tree/main/litr) R package.  Please see [jsm2022](jsm2022) for the generated R package itself.

## Code for generating the `jsm2022` package

After cloning this repo...

```r
remotes::install_github("jacobbien/litr-project", subdir = "litr")
litr::render("create-jsm2022.Rmd")
```

This will create [create-jsm2022.html](https://htmlpreview.github.io/?https://github.com/jacobbien/jsm2022-project/blob/main/create-jsm2022.html) and the package directory [jsm2022](jsm2022).