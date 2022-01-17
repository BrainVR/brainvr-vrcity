hp_exit_times <- function(task){
  times <- task$event$data$Time[task$event$data$Event == "EXIT_CONTROL"]
  return(times)
}
