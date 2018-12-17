library(shiny)
library(shinythemes)
library(tidyverse)
library(shinydashboard)
library(leaflet)
library(leaflet.minicharts)
library(htmltools)
library(shinycssloaders)



df<-read.table("data//RankingLists.txt", header = TRUE, sep = "\t")
  