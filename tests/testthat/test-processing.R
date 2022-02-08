test_that("unity vector coding works", {
  cols <- colnames(experiment$tasks$`1-PlanningQuest`$player$data)
  camera_cols <- paste("camera.position_", c("x", "y", "z"), sep="")
  expect_true(all(camera_cols %in% cols))
})

