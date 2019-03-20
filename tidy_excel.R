library(readxl)
library(tidyxl)
library(unpivotr)
library(here)
library(tidyverse)

xlfile <- file.path(here(),'data','ClassList.xlsx')

d1 <- read_excel(xlfile)
d2 <- tidyxl::xlsx_cells(xlfile)

Names <- d2 %>% select(row, col, character) %>%
  filter(row %% 2 == 1, col == 1, row > 1)
emails <- d2 %>% select(address, row, col, character) %>%
  filter(row %% 2 == 0, col==1, row > 2)

class_list <- tibble(Name = Names$character, Email = emails$character)

d2 %>% select(row, col, data_type, character) %>%
  behead('N', 'head1') %>%
  behead('N', 'head2')
