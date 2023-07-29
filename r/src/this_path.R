# https://gist.github.com/jasonsychau/ff6bc78a33bf3fd1c6bd4fa78bbf42e7 a combination of
# https://stackoverflow.com/questions/1815606/determine-path-of-the-executing-script/15373917#15373917
# https://stackoverflow.com/questions/1815606/determine-path-of-the-executing-script/7585599#7585599
# https://stackoverflow.com/questions/47044068/get-the-path-of-current-script/47045368#47045368
# https://stackoverflow.com/questions/53512868/how-to-automatically-include-filepath-in-r-markdown-document/53516876#53516876

stub <- function() {}
thisPath <- function() {
  cmdArgs <- commandArgs(trailingOnly = FALSE)
  if (length(grep("^-f$", cmdArgs)) > 0) {
    # R console option
    normalizePath(dirname(cmdArgs[grep("^-f", cmdArgs) + 1]))[1]
  } else if (length(grep("^--file=", cmdArgs)) > 0) {
    # Rscript/R console option
    scriptPath <- normalizePath(dirname(sub("^--file=", "", cmdArgs[grep("^--file=", cmdArgs)])))[1]
  } else if (Sys.getenv("RSTUDIO") == "1") {
    if (rstudioapi::isAvailable(version_needed=NULL,child_ok=FALSE)) {
      # RStudio interactive
      dirname(rstudioapi::getSourceEditorContext()$path)
    } else if (is.null(knitr::current_input(dir = TRUE)) == FALSE) {
      # Knit
      knitr::current_input(dir = TRUE)
    } else {
      # R markdown on RStudio
      getwd()
    }
  } else if (is.null(attr(stub, "srcref")) == FALSE) {
    # 'source'd via R console
    dirname(normalizePath(attr(attr(stub, "srcref"), "srcfile")$filename))
  } else {
    stop("Cannot find file path")
  }
}


this_full_path <- function() {
  cmdArgs <- commandArgs(trailingOnly = FALSE)
  if (length(grep("^-f$", cmdArgs)) > 0) {
    # R console option
    normalizePath((cmdArgs[grep("^-f", cmdArgs) + 1]))[1]
  } else if (length(grep("^--file=", cmdArgs)) > 0) {
    # Rscript/R console option
    scriptPath <- normalizePath((sub("^--file=", "", cmdArgs[grep("^--file=", cmdArgs)])))[1]
  } else if (Sys.getenv("RSTUDIO") == "1") {
    # RStudio
    (rstudioapi::getSourceEditorContext()$path)
  } else if (is.null(attr(stub, "srcref")) == FALSE) {
    # 'source'd via R console
    (normalizePath(attr(attr(stub, "srcref"), "srcfile")$filename))
  } else {
    stop("Cannot find file path")
  }
}

