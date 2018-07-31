library(knitr)
knitr::knit(
  file.path('www', 'doc', 'vendors.rmd'),
  file.path('www', 'doc', '服务提供商.md'),
  encoding = 'UTF-8', quiet = TRUE
)

