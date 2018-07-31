output$主要 <- renderUI({
  # result <- list(
  #   项目总额     = 项目总额(),
  #   首期金额     = 首期金额(),
  #   固定费用融   = 固定费用融(),
  #   保险费融     = 保险费融(),
  #   购置税融     = 购置税融(),
  #   计息利率     = 计息利率(),
  #   平面资金成本 = 平面资金成本()
  # )

  # fluidPage(
  #   renderPrint(result)
  # )

  shinyjs::js$getActivePaneWidth()
  validate(need(input$apWidth, ''))

  preWidth <- floor((input$apWidth - 19) / 6.5 - 1.1 )
  outWidth <- ifelse(preWidth > 60, 60, preWidth)
  # browser()
  tagList(
  pre(
    id = 'main-1', HTML(
      pfline('-', width = outWidth, rep = TRUE, withHTML = TRUE),
      pftitle('基本指标', outWidth, withHTML = TRUE),
      pfline('-', width = outWidth, rep = TRUE, withHTML = TRUE),
      pfline('项目总额',     f.str2money(项目总额()),   outWidth, withHTML = TRUE),
      pfline('首期金额',     f.str2money(首期金额()),   outWidth, withHTML = TRUE),
      pfline('固定费用融资', f.str2money(固定费用融()), outWidth, withHTML = TRUE),
      pfline('保险费融资',   f.str2money(保险费融()),   outWidth, withHTML = TRUE),
      pfline('购置税融资',   f.str2money(购置税融()),   outWidth, withHTML = TRUE),
      pfline('计息利率',     f.str2per(计息利率()),     outWidth, withHTML = TRUE),
      pfline('平面资金成本', f.str2per(平面资金成本()), outWidth, withHTML = TRUE)
  )),
  pre(HTML(
    pfline('Container width', input$apWidth, outWidth, withHTML = TRUE),
    pfline('Width in chars', outWidth, outWidth, withHTML = TRUE)
  ))
  )
})

项目总额 <- reactive({
  result <-
    input$裸车价 + 保险费融() + 购置税融()
})

首期金额 <- reactive({
  result <- (
      input$裸车价 +
      (input$保险费 + input$购置税 + 固定费用融() + input$浮动加融1 + input$浮动加融2) *
      (input$计算逻辑 == '总价首付型')
    ) * input$首期比例 / 100 +
    input$手续费
})

固定费用融 <- reactive({
  if (input$固定费用加融模式) {
    input$固定费用 * input$固定费用加融比例 / 100
  } else {input$固定费用加融金额}
})

保险费融 <- reactive({input$保险费 * input$保险加融})
购置税融 <- reactive({input$购置税 * input$购置税加融})

融资金额 <- reactive({
  input$裸车价 * (1 - input$首期比例 / 100) +
    购置税融() + 保险费融() + 固定费用融() + input$浮动加融1 + input$浮动加融2
})

计息利率 <- reactive({
  RATE2(input$融资期限, -input$万元系数, 10000) * 12 * 100
})

平面资金成本 <- reactive({
  ( PMT2(input$资金成本 / 100 / 12, input$融资期限, -10000) *
    input$融资期限 - 10000 ) / 10000 / input$融资期限 * input$融资期限 * 100
})
