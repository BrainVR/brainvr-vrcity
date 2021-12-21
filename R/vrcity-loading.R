#' Laods the experiemnt data from given folder into a vrcity class
#'
#' @param folder folder with all the subfolders
#'
#' @return list of crcity class
#' @export
load_experiment <- function(folder){

}

#' Loads the main schedule log
#'
#' @param folder
#'
#' @return
#' @export
#'
#' @examples
load_schedule_log <- function(folder){
  pth <- find_log_path(folder, "schedulelog")
  log <- load_log(pth)
  return(log)
}

#' @importFrom brainvr.reader load_brainvr_log
#'
load_log <- function(pth){
  log <- load_brainvr_log(pth)
  return(log)
}

find_log_path <- function(folder, log_name){
  #ptr <- create_log_search_pattern(log_name, exp_timestamp)
  ptr <- create_log_search_pattern(log_name)
  logs <- list.files(folder, pattern = ptr, full.names = TRUE)
  if (length(logs) < 1) {
    warning("Could not find any ", log_name, " logs in ", folder)
    return(NULL)
  }
  if (length(logs) > 1){
    warning("There are multiple ", log_name, " in the ", folder)
    return(NULL)
  } else {
    return(logs[1])
  }
}

create_log_search_pattern <- function(log_name, exp_timestamp = NULL) {
  ptr <- paste0("_", log_name, "_")
  if (!is.null(exp_timestamp)) {
    ptr <- paste0(ptr, ".*", exp_timestamp)
  }
  return(ptr)
}

load_or_find_log <- function(pth, log){
  if(file_test("-f", pth)){
  }

  if(file_test("-d", pth)){

  }
}
