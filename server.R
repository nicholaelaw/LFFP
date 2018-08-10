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

  output$dataDownload <- renderUI({
    includeRmd(file.path('www', 'doc', 'dataDownload.rmd'))
  })

  output$`1001-20180801` <- downloadHandler(
    filename = '风控月报数据@20180801.xlsx',
    content  = function(file) {
      file.copy(file.path('www', 'data', '风控月报数据@20180801.xlsx'), file)
    }
  )

  output$`2001-20180801` <- downloadHandler(
    filename = '当月收租及存量收益@20180801.xlsx',
    content  = function(file) {
      file.copy(file.path('www', 'data', '当月收租及存量收益@20180801.xlsx'), file)
    }
  )

  output$`2002-20180801` <- downloadHandler(
    filename = '坏账计提@20180801.xlsx',
    content  = function(file) {
      file.copy(file.path('www', 'data', '坏账计提@20180801.xlsx'), file)
    }
  )

  output$`2003-20180801` <- downloadHandler(
    filename = '来年收益@20180801.xlsx',
    content  = function(file) {
      file.copy(file.path('www', 'data', '来年收益@20180801.xlsx'), file)
    }
  )

  output$`2004-20180801` <- downloadHandler(
    filename = '零首付明细@20180801.xlsx',
    content  = function(file) {
      file.copy(file.path('www', 'data', '零首付明细@20180801.xlsx'), file)
    }
  )

  session$allowReconnect(TRUE)
}
