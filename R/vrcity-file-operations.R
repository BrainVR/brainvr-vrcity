#' Returns paths to tasks of given name in given session folder
#'
#' @param folder session forlder in which to search
#' @param taskname name of the task to search for
#'
#' @return paths to folders with a given task
#' @export
#'
#' @examples
search_task_folder <- function(folder, taskname, id=NULL){
  ptr <- paste0(".*-", taskname, collapse = "")
  if(!is.null(id)){
    ptr <- paste0(id, "-", taskname, collapse = "")
  }
  dirs <- list.dirs(folder, recursive = FALSE)
  dirs <- dirs[grepl(ptr, dirs)]
  return(dirs)
}

#' Title
#'
#' @param folder
#'
#' @return
#' @export
#'
#' @examples
list_tasks <- function(folder){

}

#' Converts a session name to postix date
#'
#' @param string
#'
#' @return
#' @export
#'
#' @examples
convert_session_to_date <- function(string){
  return(as.Date(string, "%y%m%d%H%M%S"))
}
