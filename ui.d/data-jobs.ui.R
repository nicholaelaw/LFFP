reportList <- c(
  '1001 风控月报数据',
  '2001 当月收租及存量收益',
  '2002 坏账计提',
  '2003 来年收益',
  '3001 对外汽车资产明细'
)

div(
  id = 'section-数据工作',
  # fluidRow(
  #   column(4L, grid = 'xs',
  #     dateInput('rDate-input', '选择报告日', value = monthStart(today()), language = 'zh-CN')
  #   ),
  #   column(4L, grid = 'xs',
  #     selectizeInput('job-select', '选择数据类型', choices = reportList)
  #   )
  # ),
  # box(height = 200L)
  downloadLink('1001-20180801', '风控月报数据@20180801'),
  downloadLink('2001-20180801', '当月收租及存量收益@20180801'),
  downloadLink('2002-20180801', '坏账计提@20180801'),
  downloadLink('2003-20180801', '来年收益@20180801'),
  downloadLink('2004-20180801', '零首付明细@20180801')
)
