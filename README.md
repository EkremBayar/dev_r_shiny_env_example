
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dev_r\_shiny_env_example

Before building a Dockerfile, the system requirements and all packages
used in your projects must be defined in the Dockerfile. In this
example, I defined a long list of the system requirements because of
renv.lock file. Please, check requirements of the R packages you used on
[Posit Package Manager](https://packagemanager.posit.co/client/#/).

First, build the Dockerfile for R Shiny Environment

``` bash
docker build -t example/dev_r_shiny_env .
```

If your are working locally, you can use this line to build Dockerfile

``` bash
DOCKER_BUILDKIT=0  docker build -t example/dev_r_shiny_env .
```

Go to App folder then build the Dockerfile for App

``` bash
docker build -t example/shiny_app .
```

Run the app in production

``` bash
docker run -d -p 3838:3838 example/shiny_app
```

In order to create renv.lock file properly,

``` r
options(renv.config.auto.snapshot = T)
renv::settings$snapshot.type("all")
renv::snapshot()
```
