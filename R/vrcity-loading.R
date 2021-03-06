#' Laods the experiemnt data from given folder into a vrcity class
#'
#' @param folder folder with all the subfolders
#'
#' @return list of crcity class
#' @export
load_experiment <- function(folder, verbose = TRUE){
  experiment <- list()
  schedule <- load_schedule_log(folder)
  if(is.null(schedule)){
    warning("Schedule log has errors, cannot load")
    return(NULL)
  }
  experiment$schedule <- schedule

  ## This needs to be according to the shcedule
  quests <- get_started_quests(schedule)
  if(verbose){
    message("Loading", nrow(quests), " tasks from the schedule")
  }
  experiment$tasks <- list()
  for(i in seq_len(nrow(quests))){
    quest <- quests[i,]
    quest_name <- paste0(quest$id, "-", quest$name)
    if(verbose) message("Loading ", quest_name)
    task_dir <- search_task_folder(folder, quest$name, quest$id)
    if(is.null(task_dir)) next
    task <- load_task(task_dir)
    experiment$tasks[[quest_name]] <- task
  }
  return(experiment)
}

#' Loads a single task in given folder
#'
#' @param folder path to the task data
#'
#' @return list with a vretcity task class
#' @export
#'
#' @examples
load_task <- function(folder){
  EXPECTED_LOGS <- c("event", "ExperimentInfo", "player", "result", "test")
  logs <- list()
  for(logname in EXPECTED_LOGS){
    pth <- find_log_path(folder, logname)
    if(is.null(pth)) next
    log <- load_log(pth)
    log <- process_log(log)
    logs[[logname]] <- log
  }
  logs <- assign_class(logs)
  return(logs)
}

assign_class <- function(logs){
  return(logs)
}

#' Loads the main schedule log
#'
#' @param folder sesion folder with the log and tasks present
#'
#' @return returns shcdule log list
#' @export
#'
#' @examples
load_schedule_log <- function(folder){
  pth <- find_log_path(folder, "schedulelog")
  log <- load_log(pth)
  log <- process_log(log)
  return(log)
}

#' @importFrom brainvr.reader load_brainvr_log
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
