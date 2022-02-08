test_that("Loading navigaiton quest works", {

})

test_that("Getting navigation quest target", {
  tasks <- get_tasks_by_name(experiment, QUEST_NAMES$citynavigation)
  for(task in tasks){
    get_navigation_target(task)
  }
})

test_that("Getting position works", {
  tasks <- get_tasks_by_name(experiment, QUEST_NAMES$citynavigation)
  for(task in tasks){
    print(get_navigation_target_position(task))
  }
})

