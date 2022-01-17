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

#' Returns english code for a navigation target
#'
#' @param task
#'
#' @return
#' @export
#'
#' @examples
get_navigation_target <- function(task){
  target <- tolower(gsub("CITY_MAIN/", "", task$test$questconfig_header$navigationPoint))
  return(target)
}

#' Returns x, y position of a target site
#'
#' @param task
#'
#' @return
#' @export
#'
#' @examples
get_navigation_target_position <- function(task){
  target <- get_navigation_target(task)
  location <- LOCATIONS[LOCATIONS$code == target, ]
  if(nrow(location) < 1){
    warning("There is no location of name ", target, " in the location")
    return(NULL)
  }
  return(c(location$x, location$z))
}
