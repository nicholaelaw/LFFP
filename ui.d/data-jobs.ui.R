div(
  id = 'section-数据工作',
  fluidRow(
    column(4L, grid = 'xs',
      dateInput('rDate-input', '选择报告日', value = monthStart(today()), language = 'zh-CN')
    ),
    column(4L, grid = 'xs',
      selectizeInput('job-select', '选择数据类型', choices = c('风控月报', '财务月报'))
    )
  ),
  fluidRow(
    column(4L, grid = 'xs',
           dateInput('rDate-input', '选择报告日', value = monthStart(today()), language = 'zh-CN')
    ),
    column(4L, grid = 'xs',
           selectizeInput('job-select', '选择数据类型', choices = c('风控月报', '财务月报'))
    )
  )
)
