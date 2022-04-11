#Script to generate and deploy COVID dashboard, internal and public
#First authored 10/18/2021 by Nicole Harty
#Last update: 10/18/2021
#
library(tidyverse)
library(lubridate)
library(kableExtra)
library(ggplot2)
library(plotly)
library(janitor)
library(imager)
library(googlesheets4)
library(DBI)
library(odbc)
library(openxlsx)


##Set Parameters
INTERNALparameters <- list(DataThroughDate = "2022-04-05",
     MostRecentWeekStart = "2022-03-28",
     RouttPop = 25652,
     DataUpdateDate = "2022-04-07",
     Internal = TRUE)


PUBLICparameters <- list(DataThroughDate = "2022-04-05",
                         MostRecentWeekStart = "2022-03-28",
                         RouttPop = 25652,
                         DataUpdateDate = "2022-04-07",
                           Internal = FALSE)

#use below when testing/troubleshooting indiv RMD files
# params <- list(DataThroughDate = "2022-03-02",
#                MostRecentWeekStart = "2022-02-21",
#                RouttPop = 25652,
#                DataUpdateDate = "2022-03-01",
#                Internal = FALSE)

# INTERNAL Dashboard --------------------------------------------------

rmarkdown::render(
  'Dashboard_PARENT_PRUNE.Rmd',
  output_file = paste0('INTERNAL Routt County COVID Dashboard.html'),
  params = INTERNALparameters,
  envir = parent.frame()
)
# Copy HTML to Shiny folder
file.copy("INTERNAL Routt County COVID Dashboard.html", "INTERNAL Dashboard", overwrite = TRUE)

# PUBLIC Dashboard --------------------------------------------------
# 
rmarkdown::render(
  'Dashboard_PARENT_PRUNE.Rmd',
  output_file = paste0('PUBLIC Routt County COVID Dashboard.html'),
  params = PUBLICparameters,
  envir = parent.frame()
)

# Copy HTML to Shiny folder

file.copy("PUBLIC Routt County COVID Dashboard.html", "PUBLIC Dashboard", overwrite = TRUE)


# Deploy Apps -------------------------------------------------------------

library(rsconnect)
options(rsconnect.force.update.apps = FALSE)
#INTERNAL
deployApp(
  appDir = "INTERNAL Dashboard",
  appName = "InternalCOVID19",
  appId = 3283711,
  forceUpdate = TRUE
)

#PUBLIC
deployApp(
  appDir = "PUBLIC Dashboard",
  appName = "COVID19-Dashboard",
  appId = 3283594,
  forceUpdate = TRUE
)

