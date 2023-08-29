req_library <- function() {
  # List of required libraries
  required_libraries <- c("googleAuthR", "searchConsoleR", "dplyr", "googlesheets4", "plyr", "googledrive","rgoogleads","tidyverse","parallel",
                          "vctrs","rlang","googleAnalyticsR","jsonlite","httr")
  
  # Install and load libraries if not already installed
  for (library_name in required_libraries) {
    if (!requireNamespace(library_name, quietly = TRUE)) {
      install.packages(library_name, dependencies = TRUE)
    }
    library(library_name, character.only = TRUE)
  }
}

