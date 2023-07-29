main.packages <- c(
  "boot",  "bibext",
  "Cairo", "car", "coin",
  "dendextend", "devtools", "data.table", "DT", "dygraphs",
  "easystats", "foreign",
  "GGally", "ggiraph", "ggpubr", "ggvis", 
  "haven", "here",  "htmlwidgets", "htmlTable",  
  "kableExtra", "knitr", 
  "lubridate",
  "magrittr",
  "pandoc", "plotly",
  "ragg", "rstudioapi", "renv",
  "sjPlot", "sqldf",
  "tidyverse", 
  "usethis",
  "quarto", "xlsx",
  "zipcode", "zoom"
  )

main.packages <- c("beepr", "bibext", "boot",  "Cairo", 
                   "cairoDevice", "car", "caret", "corrplot", 
                   "colourpicker", "DT", "data.table", "devtools", 
                   "dplyr", "dygraphs", "e1071", "feather", "foreign", 
                   "gargle", "ggiraph", "ggpubr", "ggvis", 
                   "googlesheets", "haven", "httr", 
                   "htmlwidgets", "htmlTable", "janitor", "jsonlite", 
                   "kableExtra", "knitr", "lattice", "latticeExtra", 
                   "lmer4", "lubridate", "magrittr", "mailR", "nlme", 
                   "officer", "openxlsx", "outliers", "pander", "pandoc", 
                   "plotly", "plotrix", "rmarkdown", "Rcurl", "readr", "rms", 
                   "shiny", "shinydashboard", "shinydashboardPlus", 
                   "ssh", "sqldf", "stringr", "text2vec", "text2speech", 
                   "tidyverse", "xlsx", "XML", "XLConnect", "zip", "zoo"
                   )


#main.packages <- c("aod", "apaStyle", "apaTables", "apa", "asbio",
#                   "boot", "bootES", "broom", "BSDA", "beepr", "brms",
#                   "colorhcplot", "Cairo", "cairoDevice", "car", "caret", "compute.es",
#                   "corrplot", "clm", "curl", "copula", "colourpicker",
#                   "data.table", "datapasta", "devtools", "digest", "dplyr", "doBy", "DescTools",
#                   "dendextent", "dygraphs", "diffobj", "dgof",
#                   "e1071", "effsize", "ellipse", "exact2x2", "exactci", "ez", "ezsummary", "editR",
#                   "feather", "fgof", "foreach", "foreign", "forcats", "formatR", "FSA", "fst",
#                   "ghit", "ggvis", "gmodels", "gmailr", "gridExtra", "gridBase", "ggmap", "ggplot2",
#                   "googlesheets", "googleVis", "ggiraph", "gsl", "growthmodels", "ggpubr", "goftest",
#                   "hash", "haven", "HH", "Hmisc", "htmlTable", "htmlwidgets", "httr", "here",
#                   "imager", "installr", "janitor", "jpeg", "jsonlite", "jmv",
#                   "knitr", "kSamples",
#                   "lattice", "latticeExtra", "lawstat", "lavaan", "lexRankr", "lme4", "locfit",
#                   "logspline", "lsr", "lubridate", "LaF", "lsmeans",
#                   "maps", "mapproj", "mailR", "magick", "mgcv", "MASS", "MBESS", "memisc",
#                   "memoise", "mice", "moments",
#                   "modelr", "multcomp", "mvoutlier", "mosaic", "mgm", "nnet", "multidplyr",
#                   "mlmRev", "mediation", "metricsgraphics",
#                   "nortest", "NHPoisson", "nlme",
#                   "outliers", "openxlsx", "officeR",
#                   "party", "packrat", "pastecs", "PASWR", "PerformanceAnalytics", "plyr", "plotly",
#                   "patchwork", "pander",  "ppcor", "png", "pkgKitten", "psychometric", "purrr",
#                   "prettyR", "psych", "pwr", "profvis", "plumber", "Publish",
#                   "QuantPsyc", "qgraph",
#                   "randomForest", "remotes", "reinstallr", "RCurl", "reticulate",
#                   "RcmdrMisc", "RColorBrewer",
#                   "RSQLite", "rBokeh", "roxygen2", "rcommander",
#                   "rio", "rjson", "reshape", "rpart", "repmis", "readr", "rmarkdown", "rcdimple",
#                   "reshape2", "Rmisc", "rpf", "RSentiment", "rvest", "rdrop2", "RSiteCatalyst",
#                   "samplesize", "sentimentr", "shiny", "sjPlot", "sqldf", "stringr",
#                   "stargazer", "syuzhet", "splitstackshape", "sm", "shinythemes",
#                   "Tabulizer", "translate", "taucharts", "threejs", "truncdist",
#                   "testthat", "tidyr", "tibble", "tibbrConnector", "tidyquant", "tidycensus",
#                   "tidyverse", "tidytext", "vcd", "visreg", "wordcloud2", "WRS2",
#                   "xlsx", "XML", "XLConnect", "xtable", "xts",
#                   "validate", "zip", "zipcode", "ztable")

#install.packages("https://www.stat.auckland.ac.nz/~ihaka/software/Rnoweb/Rnoweb_1.1.tar.gz", repos=NULL, type="source")
#install.packages("X:/Progs/R/R-Portable/Rnoweb_1.1.tar.gz", repos=NULL, type="source")
#install.packages("X:/Progs/R/R-Portable/dtrace_0.1.zip", repos=NULL, type="source")
## --- for diffusion model --- ##
diffusion.packages <- c("loo", "hypergeo", "statmod", "rtdists", "pracma", "snowfall", "rlecuyer", "numDeriv", "vioplot", "RWiener", "glba")
#("loo") # For WAIC and looaic calculation
#("hypergeo") # For population plausible values
#("statmod") # Wald model
#("rtdists") # For standard model distirbution functions
#("pracma")  # For gng and stop signal robust integration
#("snowfall") # Parallel processing
#("rlecuyer") # Parallel processing
#("numDeriv") # Prior transformations
#("vioplot") # Stop signal graphs
#("glba"") # General Linear Ballistic Accumulator Models (not diffusion)
# Hydra
# 

## --- for Bayesian model --- ##
bayes.packages <- c("BayesFactor", "rjags", "runjags")

# pay

#if (Sys.info()[[8]] %in% c("GCook","cookprojects")) {
#	fastdm.file <- "C:/Users/gcook/Dropbox/Progs/FastDM/fast-dm_example_1/fast-dm.exe"
#	ipak(diffusion.packages) # load or install
#	#dl.pak(diffusion.packages)
#	dl.pak(bayes.packages)
#	ipak(bayes.packages) # load or install
#	ipak.gits()
#    message("Hydra not installed. If wanted, check around line 140.")
#    #install.packages("X:/Progs/_install/R/packages/hydra_0.9-130521.tar.gz", repos=NULL, type="source")
#}


dl.pak <- function(pkg, destDir = sourceDir, load = FALSE, force = FALSE) {
  # download if not there
  if(!file.exists(sourceDir)){
    print("skipping") #download.packages(pkg, destDir = sourceDir, type="source")
  }
}

ipak <- function(pkg, load = FALSE, force = FALSE) {
  # force install without checking if they exist
  if (force) { install.packages(pkg, dependencies = TRUE)  }
  # install if not installed, and load
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) {
    install.packages(new.pkg, dependencies = TRUE)
    # versions::install.dates(new.pkg, checkpoint.date, dependencies = TRUE) # version by date
    download.packages(new.pkg, destDir = sourceDir, type="source")
  }
  if(load) {
    #message("Loading ", new.pkg, "...")
    sapply(pkg, require, character.only = TRUE) # loads all libraries if set to TRUE
  } else { print("Not set to load packages.") }
}

## --- Installing Libraries --- ##
#packageurl <- "http://cran.r-project.org/src/contrib/Archive/ggplot2/ggplot2_0.9.1.tar.gz"
#install.packages(packageurl, repos=NULL, type="source")

ipak.first <- function(pkg) {
  # install if not installed, and load
  new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
  if (length(new.pkg)) install.packages(new.pkg, dependencies = TRUE)
}

ipak.gits <- function() {
  # install if not installed, and load
  #	if(Sys.info()[[8]] %in% c("GCook","cookprojects")) {}
  #if (!"papaja" %in% installed.packages()[, "Package"])
  #    devtools::install_github("crsh/papaja")
  #if (!"multidplyr" %in% installed.packages()[, "Package"])
  #    devtools::install_github("hadley/multidplyr")
  #if (!"rio" %in% installed.packages()[, "Package"])
  #    devtools::install_github("leeper/rio")
}

# Download packages
#for (pkg in list.files(RDir)) {
#    dl.pak(pkg)
#}
message("********************** Not downloading zips")
#dl.pak(main.packages)

# get the source for those installed

# and get new ones from source
#for (pkg in list.files(sourceDir, full.names = T)) {
#    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
#message("Installing from source: ", new.pkg, "...")
#    if (length(new.pkg)) install.packages(new.pkg, dependencies = TRUE)
#        install.packages(new.pkg, repos = NULL, type="source")
#}

#############################################################################
#############################################################################ipak(main.packages)
#############################################################################

#pkgs.load <- function(pkg) {sapply(pkg, library, character.only = TRUE) } # if problematic, use require
load.pkgs <- function(pkg = c()) {sapply(pkg, library, character.only = TRUE) } # if problematic, use require
