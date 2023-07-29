data_summary <- function(data, varname, groupnames){
  summary_func = function(x, col){
    c(mean = mean(x[[col]], na.rm = T),
      sd   = sd(x[[col]], na.rm = T))
  }
  data_sum = plyr::ddply(data, groupnames, 
                         .fun = summary_func, varname)
  data_sum = plyr::rename(data_sum, c("mean" = varname))
 return(data_sum)
}
