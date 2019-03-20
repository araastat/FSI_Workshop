library(XML)
library(RCurl)
library(tidyverse)

theurl <- "http://cran.rstudio.com/bin/windows/contrib/3.5/"
webpage = getURL(theurl)
webpage <- readLines(tc <- textConnection(webpage)); close(tc)

zipfiles <- webpage[str_detect(webpage, 'zip')]
zips <- str_extract(zipfiles, '[A-Za-z0-9\\.]+_[0-9\\.\\-]+\\.zip')
zip_info <- do.call(rbind,
                    str_match_all(zips, '(^[a-zA-Z0-9\\.\\-]+)_([0-9\\.\\-]+)\\.zip'))
zip_info <- as.data.frame(zip_info) %>% set_names(c('zipfile','basename','version'))
basenames <- str_extract(zips, '^[A-Za-z0-9\\.]+')

installed_pkgs <- read_csv('data/package.csv')

pkg_wish <- read_csv('data/pkg_wish.txt', col_names = FALSE)
deps <- tools::package_dependencies(pkg_wish$X1, recursive = T)
top_pkgs <- names(deps)
deps <- unlist(deps)
deps <- c(deps, top_pkgs)
deps <- unname(deps)
deps <- unique(deps)

pkgs_for_install <- setdiff(deps, installed_pkgs$Package)


#
# pkgs <- unlist(read_yaml('Documentation_Private/packages.yml'))
# n <- names(pkgs) %>% str_remove('\\d+') %>% unique() %>% sort()
# needed_pkgs <- sort(unique(c(pkgs, n)))[-1]
#
#
# pkgs_for_install <- setdiff(needed_pkgs, installed_pkgs$Package)

zips_to_download <- zips[basenames %in% pkgs_for_install]
if(!fs::dir_exists('pkgs_for_download')) fs::dir_create('pkgs_for_download')
for (z in zips_to_download){
  print(z)
  URL <- paste0(theurl, z)
  f <- getBinaryURL(URL, verbose = T)
  writeBin(f, fs::path('pkgs_for_download',z))
}
