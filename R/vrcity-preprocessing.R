process_log <- function(ls_log){
  if(is.null(ls_log[["data"]])) return(ls_log)
  ls_log$data <- trim_data_frame(ls_log$data)
  # conversts vectors to numbers and flips Z and Y
  ls_log$data <- convert_vector3(ls_log$data)
  return(ls_log)
}

#' Trims leading space from the string values
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

#' THIS CONVECRTS Z and Y axes
convert_vector3 <- function(df){
  is_unity_vector <- function(text){
    if(!is.character(text)) return(FALSE)
    # This is kinda garbage, but quick and it works
    ptr <- "\\([-]*\\d+.*\\d+.*\\d+.*\\)"
    return(grepl(ptr, text))
  }
  # get columns
  vector_columns <- colnames(df)[sapply(df, function(x){is_unity_vector(x[1])})]
  for(col in vector_columns){
    df[[col]] <- gsub("[\\(\\)]", "", df[[col]])
    df <- tidyr::separate(df, col, into = paste(col, c("x", "z", "y"), sep="_"),
                          convert = TRUE, sep=",")
  }
  return(df)
}



