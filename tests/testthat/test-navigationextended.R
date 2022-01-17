test_that("Getting navigation euqest target", {
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
