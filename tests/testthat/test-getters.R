test_that("getting tasks by id works", {

})

test_that("Getting start time", {
  for(task in experiment$tasks){
    expect_gt(get_task_start_time(task), 0)
  }
})

test_that("Gettings start position", {
  for(task in experiment$tasks){
    expect_length(get_task_start_position(task), 2)
  }
})
