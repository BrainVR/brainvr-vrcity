#' Returns list with quest and their ids which have been started
#'
#' @param schedule
#'
#' @return
#' @export
#' @importFrom stringr str_match
#'
#' @examples
get_started_quests <- function(schedule){
  quests <- data.frame()
  started <- schedule$data[schedule$data$event == "QUEST_STARTED", ]
  if(nrow(started) < 1) return(quests)
  for(i in seq_len(nrow(started))){
    line <- started[i,]
    quest <- data.frame(started =line$time,
                  name = str_match(line$param, "\\{name:([A-z]*),")[2],
                  id = as.integer(str_match(line$param, "id:([0-9]*)\\}")[2]))
    quests <- rbind(quests, quest)
  }
  return(quests)
}


#' Returns tasks of given name from the expeiremnt. If you know the task id, use `get_task`
#'
#' @param experiment expeirment object
#' @param taskname name of the task to extract. Task names can be accessed through
#' the QUEST_NAMES exported list (e.g. `QUEST_NAMES$citynavigation`)
#'
#' @return list of tasks
#' @export
#'
#' @examples
get_tasks_by_name <- function(experiment, taskname){
  i <- grep(taskname, names(experiment$tasks))
  tasks <- get_tasks(experiment, i)
  return(tasks)
}

#' Returns tasks with given ids
#'
#' @param experiment
#' @param ids
#'
#' @return
#' @export
#'
#' @examples
get_tasks <- function(experiment, ids){
  tasks <- list()
  for(j in seq_len(length(ids))){
    id <- ids[j]
    i <- grep(id, names(experiment$tasks))
    if(length(i) == 0){
      warning("There are no tasks with id ", id)
    }
    if(length(i) > 1){
      warning("There are more than one task with id ", id)
      return(NULL)
    }
    tasks[[j]] <- experiment$tasks[[i]]
  }
  return(tasks)
}
