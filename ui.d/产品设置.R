div(
  id = '产品设置',
  # h3('产品设置'),
  fluidRow(column(8L, grid = 'xs',
    numericInput('万元系数', label = '万元系数', min = 0, max = 10000, value = 350, step = 0.1)
  )),
  fluidRow(column(8L, grid = 'xs',
    numericInput('固定费用', label = '固定费用', value = 1100L, step = 0.1)
  )),
  fluidRow(
    column(width = 7L, grid = 'xs', uiOutput('固定费用加融ui')),
    column(5L, grid = 'xs',
      switchInput(
        '固定费用加融模式', label = '加融', onLabel = '按比例', offLabel = '按金额',
        value = TRUE, onStatus = 'warning', offStatus = 'info', size = 'normal'
      )
    )
  ),
  fluidRow(column(8L, grid = 'xs',
    numericInput('浮动加融1', label = '浮动加融1', value = 2000)
  )),
  fluidRow(
    column(7L, grid = 'xs', uiOutput('浮动加融1本金ui')),
    column(5L, grid = 'xs',
      switchInput(
        '浮动加融1本金模式', label = '入本', onLabel = '按比例', offLabel = '按金额',
        value = TRUE, onStatus = 'warning', offStatus = 'info', size = 'normal'
      )
    )
  ),
  fluidRow(column(8L, grid = 'xs',
    numericInput('浮动加融2', label = '浮动加融2', value = 0)
  )),
  fluidRow(
    column(7L, grid = 'xs', uiOutput('浮动加融2本金ui')),
    column(5L, grid = 'xs',
      switchInput(
        '浮动加融2本金模式', label = '入本', onLabel = '按比例', offLabel = '按金额',
        value = TRUE, onStatus = 'warning', offStatus = 'info', size = 'normal'
      )
    )
  ),
  hr()
)

