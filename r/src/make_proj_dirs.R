# simply makes subdires in project dir

make_proj_dirs <- function(dirs = c("api",
                                    "data", 
                                    "docs",
                                    "figs",
                                    "output",
                                    "r", 
                                    "r/src")
                           ) {
  suppressWarnings(
    lapply(dirs, FUN = function(x) dir.create(here::here(x)) ))
}
