library(tidyverse)

url <- "https://archive.usaultimate.org/about/history/hall_of_fame/kelly_green_class_of_2005.aspx"

# Header links
url %>% 
  xml2::read_html() %>% 
  rvest::html_nodes("a") %>% 
  rvest::html_attr("href") %>% 
  .[str_detect(., "^#")] %>% 
  .[!is.na(.)] 

# Headers
url %>% 
  xml2::read_html() %>% 
  rvest::html_nodes(".georgia") %>% 
  rvest::html_text() %>% 
  str_squish() %>% 
  .[!. == ""] 

# Bullets
url %>% 
  xml2::read_html() %>% 
  rvest::html_nodes("td ul") %>% 
  rvest::html_text() %>% 
  str_split("\\n")

# Tables
url %>% 
  xml2::read_html() %>% 
  rvest::html_nodes("td table") %>% 
  rvest::html_text()

# Interview text
url %>% 
  xml2::read_html() %>% 
  rvest::html_nodes("#main_content > p+ p") %>% 
  rvest::html_text()
  
