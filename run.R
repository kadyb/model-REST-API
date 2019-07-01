library("plumber")


r = plumb("deploy.R")
r$run(port = 5762)
