pkgs_for_install <- c('rsample','sf','here','odbc','RODBC',
                      'tidyxl','unpivotr','dygraphs','plotly','flexdashboard',
                      'shiny','nycflights13','rnaturalearth','gganimate','ggthemes',
                      'ggfortify','ggExtra','DT','officer','infer','forecast',
                      'neuralnet')
install.packages(pkgs_for_install,
                 contriburl = "file:///Users/aikid/ARAASTAT/FSI/FSI_Workshop/pkgs_for_download")
# For me, the package zip files are stored in
# C:\Users\aikid\ARAASTAT\FSI\FSI_Workshop\pkgs_for_download
# In the contriburl entry above, the "C:\" is replaced by "file:///", and all the backslashes become "/"
# Just replace the contriburl entry above with whereever you have stored the zip files, using the
# substitution above, then click "Source" in the upper right corner of this pane (assuming
# you are using RStudio)
#
# Everything should install automagically, since all the required dependencies are also here. There
# may be some warnings, but feel free to ignore them.
