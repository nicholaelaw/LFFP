source(file.path('startup.d', 'specific.R'), encoding = 'UTF-8', local = FALSE)

function(input, output, session) {

  shinyjs::addClass(selector = 'body', class = 'sidebar-open')
  shinyjs::js$addTitle(appName)

  # source(file.path('server.d', '基本设置s.R'),  encoding = 'UTF-8', local = TRUE)$value
  # source(file.path('server.d', '产品设置s.R'),  encoding = 'UTF-8', local = TRUE)$value
  # source(file.path('server.d', '其它设置s.R'),  encoding = 'UTF-8', local = TRUE)$value
  # source(file.path('server.d', 'headerMenu.R'), encoding = 'UTF-8', local = TRUE)$value
  # source(file.path('server.d', '计算逻辑.R'),   encoding = 'UTF-8', local = TRUE)$value
  # source(file.path('server.d', 'debugging.R'),  encoding = 'UTF-8', local = TRUE)$value

  session$allowReconnect(TRUE)
}
