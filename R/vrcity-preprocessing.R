process_log <- function(ls_log){
  if(!is.null(ls_log[["data"]])){
    ls_log$data <- trim_data_frame(ls_log$data)
  }
  return(ls_log)
}
#' Title
#'
#' @param data.frame
#'
#' @return
#' @importFrom stringr str_trim
#' @importFrom dplyr mutate across
#'
#' @examples
trim_data_frame <- function(df){
  df <- mutate(df, across(where(is.character), str_trim))
  return(df)
}
