count_to_prop <- function(data, x, group = NULL) {
  
  if (is.null(group)) {
  data %>%
      dplyr::group_by(.data[[group]]) %>%
      dplyr::count(.data[[x]]) %>%
      dplyr::mutate(prop = n/sum(n),
                  perc = n/sum(n) * 100
                  )
  }
  if (!is.null(group)) {
  data %>%
    dplyr::count(.data[[x]]) %>%
    dplyr::mutate(prop = n/sum(n),
                  perc = n/sum(n) * 100
                  )  
  }
}
count_2_prop <- count_to_prop 