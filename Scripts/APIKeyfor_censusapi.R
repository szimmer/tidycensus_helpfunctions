# My API key for censusapi is never retained but it is for tidycensus 
# so I call it from one to the other

# https://cran.r-project.org/web/packages/censusapi/vignettes/getting-started.html

Sys.setenv(CENSUS_KEY=Sys.getenv("CENSUS_API_KEY"))
