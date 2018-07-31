library(knitr)
knitr::knit(
  file.path('www', 'doc', 'vendors.rmd'),
  file.path('www', 'doc', '其它工作简述.md'),
  encoding = 'UTF-8', quiet = TRUE
)

