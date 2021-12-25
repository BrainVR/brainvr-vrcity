#' @export
analyse_task_performance.citynavigation <- function(task){
  res <- task$result$data
  if(is.null(res)){
    warning("There is no result log data")
    return(NULL)
  }
  res <- res[1,]
  out <- list(
    target = task$test$questconfig_header$navigationPoint,
    # Add starting point
    # Validate time and trajectory
    duration = res$Total.time,
    trajectory = res$Total.trajectory
  )
  return(out)
}
