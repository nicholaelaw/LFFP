# 固定费用加融 ----
observe({
  if (input$固定费用加融模式) {
    output$固定费用加融ui <- renderUI({
      if (!is.null(input$固定费用加融金额)) {
        x.default <- input$固定费用加融金额 / input$固定费用 * 100
      } else {
        x.default <- 100
      }
      name <- '固定费用加融比例'
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, post = '%', value = x.default, ticks = FALSE
      )
    })
    outputOptions(output, '固定费用加融ui', suspendWhenHidden = FALSE)
  } else {
    output$固定费用加融ui <- renderUI({
      if (!is.null(input$固定费用加融比例)) {
        x.default <- input$固定费用加融比例 * input$固定费用 / 100
      } else {
        x.default <- input$固定费用
      }
      name <- '固定费用加融金额'
      numericInput(
        name, label = name,
        min = 0, max = input$固定费用, step = 0.1, value = x.default
      )
    })
    outputOptions(output, '固定费用加融ui', suspendWhenHidden = FALSE)
  }
})
# 固定费用加融比例 ----
固定费用加融比例type <- 'slider'
observeEvent(input$固定费用加融比例sw, {
  x <- input$固定费用加融比例
  name <- '固定费用加融比例'

  if (固定费用加融比例type == 'slider') {
    output$固定费用加融ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, value = x
      )
    })
    固定费用加融比例type <<- 'numeric'
  } else {
    output$固定费用加融ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, post = '%', value = x, ticks = FALSE
      )
    })
    固定费用加融比例type <<- 'slider'
  }
})

# 浮动加融1 ----
observe({
  if (input$浮动加融1本金模式) {
    output$浮动加融1本金ui <- renderUI({
      if (!is.null(input$浮动加融1本金金额)) {
        x.default <- input$浮动加融1本金金额 / input$浮动加融1 * 100
      } else {
        x.default <- 100
      }
      name <- '浮动加融1本金比例'
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, post = '%', value = x.default, ticks = FALSE
      )
    })
    outputOptions(output, '浮动加融1本金ui', suspendWhenHidden = FALSE)
  } else {
    output$浮动加融1本金ui <- renderUI({
      if (!is.null(input$浮动加融1本金比例)) {
        x.default <- input$浮动加融1本金比例 * input$浮动加融1 / 100
      } else {
        x.default <- input$浮动加融1
      }
      name <- '浮动加融1本金金额'
      numericInput(
        name, label = name,
        min = 0, max = input$浮动加融1, step = 0.1, value = x.default
      )
    })
    outputOptions(output, '浮动加融1本金ui', suspendWhenHidden = FALSE)
  }
})
# 浮动加融1比例 ----
浮动加融1本金比例type <- 'slider'
observeEvent(input$浮动加融1本金比例sw, {
  x <- input$浮动加融1本金比例
  name <- '浮动加融1本金比例'

  if (浮动加融1本金比例type == 'slider') {
    output$浮动加融1本金ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, value = x
      )
    })
    浮动加融1本金比例type <<- 'numeric'
  } else {
    output$浮动加融1本金ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, post = '%', value = x, ticks = FALSE
      )
    })
    浮动加融1本金比例type <<- 'slider'
  }
})

# 浮动加融2 ----
observe({
  if (input$浮动加融2本金模式) {
    output$浮动加融2本金ui <- renderUI({
      if (!is.null(input$浮动加融2本金金额)) {
        x.default <- input$浮动加融2本金金额 / input$浮动加融2 * 100
      } else {
        x.default <- 100
      }
      name <- '浮动加融2本金比例'
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, post = '%', value = x.default, ticks = FALSE
      )
    })
    outputOptions(output, '浮动加融2本金ui', suspendWhenHidden = FALSE)
  } else {
    output$浮动加融2本金ui <- renderUI({
      if (!is.null(input$浮动加融2本金比例)) {
        x.default <- input$浮动加融2本金比例 * input$浮动加融2 / 100
      } else {
        x.default <- input$浮动加融2
      }
      name <- '浮动加融2本金金额'
      numericInput(
        name, label = name,
        min = 0, max = input$浮动加融2, step = 0.1, value = x.default
      )
    })
    outputOptions(output, '浮动加融2本金ui', suspendWhenHidden = FALSE)
  }
})
# 浮动加融2比例
浮动加融2本金比例type <- 'slider'
observeEvent(input$浮动加融2本金比例sw, {
  x <- input$浮动加融2本金比例
  name <- '浮动加融2本金比例'

  if (浮动加融2本金比例type == 'slider') {
    output$浮动加融2本金ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, value = x
      )
    })
    浮动加融2本金比例type <<- 'numeric'
  } else {
    output$浮动加融2本金ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 0.1, post = '%', value = x, ticks = FALSE
      )
    })
    浮动加融2本金比例type <<- 'slider'
  }
})


