# 固定返佣 --------------------------------------------------------------------
observe({
  if (input$固定返佣模式) {
    output$固定返佣ui <- renderUI({
      name <- '固定返佣比例'
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = 1.5, post = '%', ticks = FALSE
      )
    })
    outputOptions(output, '固定返佣ui', suspendWhenHidden = FALSE)
  } else {
    output$固定返佣ui <- renderUI({
      numericInput(
        '固定返佣金额', label = '固定返佣金额', min = 0, max = 10000, step = 1,
        value = 0
      )
    })
    outputOptions(output, '固定返佣ui', suspendWhenHidden = FALSE)
  }
})
# 固定返佣比例 ----
固定返佣比例type <- 'slider'
observeEvent(input$固定返佣比例sw, {
  x <- input$固定返佣比例
  name <- '固定返佣比例'

  if (固定返佣比例type == 'slider') {
    output$固定返佣ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x
      )
    })
    固定返佣比例type <<- 'numeric'
  } else {
    output$固定返佣ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x, post = '%', ticks = FALSE
      )
    })
    固定返佣比例type <<- 'slider'
  }
})

# 浮动返佣比例1 ----
output$浮动返佣比例1ui <- renderUI({
  name <- '浮动返佣比例1'
  sliderInput(
    name,
    label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
    min = 0, max = 100, step = 1, value = 90, post = '%', ticks = FALSE
  )
})
outputOptions(output, '浮动返佣比例1ui', suspendWhenHidden = FALSE)
浮动返佣比例1type <- 'slider'
observeEvent(input$浮动返佣比例1sw, {
  x <- input$浮动返佣比例1
  name <- '浮动返佣比例1'

  if (浮动返佣比例1type == 'slider') {
    output$浮动返佣比例1ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 1, value = x
      )
    })
    浮动返佣比例1type <<- 'numeric'
  } else {
    output$浮动返佣比例1ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 1, value = x, post = '%', ticks = FALSE
      )
    })
    浮动返佣比例1type <<- 'slider'
  }
})

# 浮动返佣比例2 ----
output$浮动返佣比例2ui <- renderUI({
  name <- '浮动返佣比例2'
  sliderInput(
    name,
    label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
    min = 0, max = 100, step = 1, value = 0, post = '%', ticks = FALSE
  )
})
outputOptions(output, '浮动返佣比例2ui', suspendWhenHidden = FALSE)
浮动返佣比例2type <- 'slider'
observeEvent(input$浮动返佣比例2sw, {
  x <- input$浮动返佣比例2
  name <- '浮动返佣比例2'

  if (浮动返佣比例2type == 'slider') {
    output$浮动返佣比例2ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 1, value = x
      )
    })
    浮动返佣比例2type <<- 'numeric'
  } else {
    output$浮动返佣比例2ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 100, step = 1, value = x, post = '%', ticks = FALSE
      )
    })
    浮动返佣比例2type <<- 'slider'
  }
})

# 贷后返佣比例 ----
output$贷后返佣比例ui <- renderUI({
  name <- '贷后返佣比例'
  sliderInput(
    name,
    label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
    min = 0, max = 50, step = 1, value = 0, post = '%', ticks = FALSE
  )
})
outputOptions(output, '贷后返佣比例ui', suspendWhenHidden = FALSE)
贷后返佣比例type <- 'slider'
observeEvent(input$贷后返佣比例sw, {
  x <- input$贷后返佣比例
  name <- '贷后返佣比例'

  if (贷后返佣比例type == 'slider') {
    output$贷后返佣比例ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 50, step = 1, value = x
      )
    })
    贷后返佣比例type <<- 'numeric'
  } else {
    output$贷后返佣比例ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 50, step = 1, value = x, post = '%', ticks = FALSE
      )
    })
    贷后返佣比例type <<- 'slider'
  }
})

# 资金成本 ----
output$资金成本ui  <- renderUI({
  name <- '资金成本'
  sliderInput(
    name,
    label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
    min = 0, max = 20, step = 0.05, value = 9, post = '%', ticks = FALSE
  )
})
outputOptions(output, '资金成本ui', suspendWhenHidden = FALSE)
资金成本type <- 'slider'
observeEvent(input$资金成本sw, {
  x <- input$资金成本
  name <- '资金成本'

  if (资金成本type == 'slider') {
    output$资金成本ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.05, value = x
      )
    })
    资金成本type <<- 'numeric'
  } else {
    output$资金成本ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.05, value = x, post = '%', ticks = FALSE
      )
    })
    资金成本type <<- 'slider'
  }
})

# 坏账损失 ----
output$坏账损失ui  <- renderUI({
  name <- '坏账损失'
  sliderInput(
    name,
    label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
    min = 0, max = 20, step = 0.1, value = 0, post = '%', ticks = FALSE
  )
})
outputOptions(output, '坏账损失ui', suspendWhenHidden = FALSE)
坏账损失type <- 'slider'
observeEvent(input$坏账损失sw, {
  x <- input$坏账损失
  name <- '坏账损失'

  if (坏账损失type == 'slider') {
    output$坏账损失ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x
      )
    })
    坏账损失type <<- 'numeric'
  } else {
    output$坏账损失ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x, post = '%', ticks = FALSE
      )
    })
    坏账损失type <<- 'slider'
  }
})


# 管理成本1 ----
output$管理成本1ui <- renderUI({
  name <- '管理成本1'
  sliderInput(
    name,
    label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
    min = 0, max = 20, step = 0.1, value = 0, post = '%', ticks = FALSE
  )
})
outputOptions(output, '管理成本1ui', suspendWhenHidden = FALSE)
管理成本1type <- 'slider'
observeEvent(input$管理成本1sw, {
  x <- input$管理成本1
  name <- '管理成本1'

  if (管理成本1type == 'slider') {
    output$管理成本1ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x
      )
    })
    管理成本1type <<- 'numeric'
  } else {
    output$管理成本1ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x, post = '%', ticks = FALSE
      )
    })
    管理成本1type <<- 'slider'
  }
})


# 管理成本2 ----
output$管理成本2ui <- renderUI({
  name <- '管理成本2'
  sliderInput(
    name,
    label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
    min = 0, max = 20, step = 0.1, value = 0, post = '%', ticks = FALSE
  )
})
outputOptions(output, '管理成本2ui', suspendWhenHidden = FALSE)
管理成本2type <- 'slider'
observeEvent(input$管理成本2sw, {
  x <- input$管理成本2
  name <- '管理成本2'

  if (管理成本2type == 'slider') {
    output$管理成本2ui <- renderUI({
      numericInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x
      )
    })
    管理成本2type <<- 'numeric'
  } else {
    output$管理成本2ui <- renderUI({
      sliderInput(
        name,
        label = list(name, actionLinkButton(paste0(name, 'sw'), icon('pencil-square-o'), href = '#')),
        min = 0, max = 20, step = 0.1, value = x, post = '%', ticks = FALSE
      )
    })
    管理成本2type <<- 'slider'
  }
})
