BACKGROUND_PATH <- system.file("extdata/img/CityPlan_10m.png",
                               package = "brainvr.vrcity")

CITY_BOUNDARIES <- list(x = c(-420,280), y = c(-150,250))

#' @export
#' @examples
#' @importFrom navr geom_navr_background
#' @import ggplot2
plot_city_path <- function(task, background = FALSE, custom_background = NULL,
                           vr_correction = NULL, ...) {
  df <- task$player$data
  if(!is.null(vr_correction)){
    df$camera.position_x <- df$camera.position_x + vr_correction$x
    df$camera.position_y <- df$camera.position_y + vr_correction$y
  }
  g <- ggplot(df, aes(camera.position_x, camera.position_y))
  g <- g + geom_vrcity_boundaries()
  ## geom_navr_limits(obj) ## this is just to set the generic
  if (background) {
    # if (background_type == "plain") background_path <- PLAIN_CATEGORIES_PATH
    g <- g + geom_vrcity_background(custom_background)
  }
  g <- g + geom_path(...) + theme_void()
  #g <- g + geom_navr_path(obj, ...) + theme_void()
  return(g)
}

geom_vrcity_boundaries <- function(){
  g <- list(xlim(CITY_BOUNDARIES$x), ylim(CITY_BOUNDARIES$y))
  return(g)
}

geom_vrcity_background <- function(custom_background = NULL){
  background_path <- BACKGROUND_PATH
  if (!is.null(custom_background)) background_path <- custom_background
  g <- geom_navr_background(background_path,
                                  xlim = CITY_BOUNDARIES$x,
                                  ylim = CITY_BOUNDARIES$y)
  return(g)
}

#' @importFrom ggrepel geom_text_repel geom_label_repel
geom_vrcity_locations <- function(show_text = TRUE, lang = "cz", ...){
  if(show_text){
    g <- geom_label_repel(data = LOCATIONS, aes(label = location_eng, x=x, y=z),
                      box.padding = 0.5)
    g <- append(g, geom_point(data = LOCATIONS, aes(x, z), ...))
  } else {
    g <- geom_point(data = LOCATIONS, aes(x, z), ...)
  }

  return(g)
}
