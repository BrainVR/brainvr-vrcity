experiment <- load_experiment(testthat::test_path("..", "testdata", "AD300921", "210930140239"))

withr::defer(rm(experiment), teardown_env())
