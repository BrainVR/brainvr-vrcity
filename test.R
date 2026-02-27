exp <- load_experiment("temp/260204171959")

get_tasks(exp, 0)
get_started_quests(exp$schedule)

task <- get_tasks(exp, 0)[[1]]
class(task)

analyse_task_performance.citynavigation(get_tasks(exp, 1)[[1]])

plot_city_path(task, background = TRUE, linewidth = 4)
task
