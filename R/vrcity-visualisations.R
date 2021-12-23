BACKGROUND_PATH <- system.file("extdata/img/CityPlan_10m.png",
                               package = "brainvr.vrcity")

CITY_BOUNDARIES <- list(x = c(-400,300), y = c(-150,250))

#' @examples
#' @importFrom navr geom_navr_background
plot_city_path <- function(task, background = FALSE, custom_background = NULL,
                           vr_correction = NULL, ...) {
  df <- task$player$data
  if(!is.null(vr_correction)){
    df$camera.position_x <- df$camera.position_x + vr_correction$x
    df$camera.position_y <- df$camera.position_y + vr_correction$y
  }
  g <- ggplot(df, aes(camera.position_x, camera.position_y)) +
    xlim(CITY_BOUNDARIES$x) + ylim(CITY_BOUNDARIES$y)
  ## geom_navr_limits(obj) ## this is just to set the generic
  if (background) {
    background_path <- BACKGROUND_PATH
    # if (background_type == "plain") background_path <- PLAIN_CATEGORIES_PATH
    if (!is.null(custom_background)) background_path <- custom_background
    g <- g + geom_navr_background(background_path,
                                  xlim = CITY_BOUNDARIES$x,
                                  ylim = CITY_BOUNDARIES$y)
  }
  g <- g + geom_path(size = 2) + theme_void()
  #g <- g + geom_navr_path(obj, ...) + theme_void()
  return(g)
}
