test_that("visualising locations", {
  g <- ggplot()
  g + geom_vrcity_background() +
    geom_vrcity_locations()
})

test_that("visualising task", {
  task <- experiment$tasks$`2-NavigationExtendedQuest`
  expect_silent(plot_city_path(task))
})

test_that("visualising background", {
  task <- experiment$tasks$`2-NavigationExtendedQuest`
  expect_silent(plot_city_path(task, background = TRUE))
})
