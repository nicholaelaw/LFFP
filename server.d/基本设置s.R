

# 小排量有折扣 ------------------------------------------------------------------
observe({
  validate(need(input$裸车价, ''))
  x <- reactive(input$裸车价)
  y <- reactive(input$排量)
  # cat('排量小于1.6L：', input$排量, '\n', file = stderr())

  result <- round(x() / etc$购置税参数 * ifelse(y(), 0.75, 1), 2L)
  updateNumericInput(session, '购置税', value = result)
})
