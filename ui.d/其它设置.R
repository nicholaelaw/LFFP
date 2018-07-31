div(
  id = '返佣设置',
  h4('返佣设置'),
  fluidRow(
    column(8L, grid = 'xs',
      uiOutput('固定返佣ui')
    ),
    column(4L, grid = 'xs',
      switchInput(
        '固定返佣模式', label = NULL, onLabel = '按比例', offLabel = '按金额',
        value = TRUE, onStatus = 'warning', offStatus = 'info', size = 'normal', labelWidth = 0L
      )
    )
  ),
  fluidRow(
    column(6L, grid = 'xs',
      uiOutput('浮动返佣比例1ui')
    ),
    column(6L, grid = 'xs',
      uiOutput('浮动返佣比例2ui')
    )
  ),
  fluidRow(column(12L, uiOutput('贷后返佣比例ui'))),
  hr(),
  h4('成本设置'),
  fluidRow(
    column(6L, grid = 'xs',
      numericInput('GPS成本', label = 'GPS成本', value = 930, step = 0.1, width = '100%')
    ),
    column(6L, grid = 'xs',
      numericInput('征信成本', label = '征信成本', value = 0, step = 0.1, width = '100%')
    )
  ),
  fluidRow(
    column(6L, grid = 'xs',
      uiOutput('资金成本ui')
    ),
    column(6L, grid = 'xs',
      uiOutput('坏账损失ui')
    )
  ),
  fluidRow(
    column(6L, grid = 'xs',
      uiOutput('管理成本1ui')
    ),
    column(6L, grid = 'xs',
      uiOutput('管理成本2ui')
    )
  ),
  hr()
)
