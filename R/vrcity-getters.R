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
