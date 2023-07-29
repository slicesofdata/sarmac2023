# viewing data frame with html

view <- function(object, rows = F, show = 100,...) { 
  if (is.null(dim(object)) & class(object) == "list") {
    message("Object is a list. Viewer displays last list element. Consider passing each element to view().")
    lapply(object, function(x) {
      DT::datatable(x, rownames = rows, options = list(pageLength = show))
      }) 
  } else {
    DT::datatable(object, rownames = rows, options = list(pageLength = show)) 
  }
}


gview <- function(df, rows = F, show = 100, ...) { 
  DT::datatable(df, rownames = rows, options = list(pageLength = show)) 
  }
