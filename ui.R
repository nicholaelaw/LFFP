source(file.path('startup.d', 'specific.R'), encoding = 'UTF-8', local = FALSE)
source(file.path('ui.d',   '其它工作.ui.R'), encoding = 'UTF-8', local = FALSE)

# header ------------------------------------------------------------------
dsHeader <- dashboardHeader(
  title = appName
  # tags$li(
  #   class = 'dropdown menu',
  #   a(href="javascript:history.go(0)", icon('refresh'))
  # )
)



# sidebar -----------------------------------------------------------------
# 数据工作 <- source(file.path('ui.d', 'data-jobs.ui.R'),encoding = 'UTF-8', local = TRUE)$value
# 数据文档 <- source(file.path('ui.d', 'extra.R'),    encoding = 'UTF-8', local = TRUE)$value

dsSidebar <- dashboardSidebar(
  collapsed = TRUE,
  sidebarMenu(
    menuItem('数据下载', tabName = '数据下载'),
    menuItem(
      '数据文档', tabName = '数据文档', startExpanded = TRUE,
      menuSubItem('数据工作简述',       tabName = '数据工作简述'),
      menuSubItem('风控月报数据',       tabName = '风控月报数据'),
      menuSubItem('当月收租及存量收益', tabName = '当月收租及存量收益'),
      menuSubItem('坏账计提',           tabName = '坏账计提'),
      menuSubItem('来年收益',           tabName = '来年收益'),
      menuSubItem('对外汽车资产明细',   tabName = '对外汽车资产明细')
    ),
    menuItem(
      '其它工作', tabName = '其它工作', startExpanded = TRUE,
      menuSubItem('服务提供商',         tabName = '服务提供商'),
      menuSubItem('未竟事宜及交接清单', tabName = '清单')
    ),
    #menuItem('交接清单及未竟事宜', tabName = '清单'),
    menuItem(
      '其它', tabName = '其它', startExpanded = TRUE,
      menuSubItem('产品分类对照表',     tabName = '产品对照表'),
      menuSubItem('经销商省市对照表',   tabName = '经销商对照表'),
      menuSubItem('流程编号对照表',     tabName = '流程对照表'),
      menuSubItem('Todo',               tabName = 'todo')
    )
  )
)


# body --------------------------------------------------------------------
dsBody <- dashboardBody(
  tags$head(
    useShinyjs(),
    tags$link(rel = "stylesheet", type = "text/css", href = "app.css"),
    tags$link(rel = 'mainfest', href = 'manifest.json'),
    tags$script(HTML('
      var resizeTimer;
      $(window).resize(function() {
          clearTimeout(resizeTimer);
          resizeTimer = setTimeout(
            Shiny.onInputChange(
              "apWidth",
              $(".content-wrapper .tab-pane.active").width()),
          100);
      });
    ')),
    extendShinyjs(script = file.path('extendShinyjs.js'))
  ),
  tabItems(
    tabItem(tabName = '数据下载', uiOutput('dataDownload')),

    # 数据文档 ----
    tabItem(
      tabName = '数据工作简述',
      includeMarkdown(file.path('www', 'doc', '数据工作简述.md'))
    ),
    tabItem(
      tabName = '风控月报数据',
      includeMarkdown(file.path('www', 'doc', '风控月报数据说明.md'))
    ),
    tabItem(
      tabName = '当月收租及存量收益',
      includeMarkdown(file.path('www', 'doc', '当月收租及存量收益说明.md'))
    ),
    tabItem(
      tabName = '坏账计提',
      includeMarkdown(file.path('www', 'doc', '坏账计提说明.md'))
    ),
    tabItem(
      tabName = '来年收益',
      includeMarkdown(file.path('www', 'doc', '来年收益说明.md'))
    ),
    tabItem(
      tabName = '对外汽车资产明细',
      includeMarkdown(file.path('www', 'doc', '对外汽车资产明细说明.md'))
    ),

    # 其它工作 ----
    tabItem(
      tabName = '服务提供商',
      includeMarkdown(file.path('www', 'doc', '服务提供商.md'))
    ),
    tabItem(
      tabName = '清单',
      includeMarkdown(file.path('www', 'doc', '文件交接清单.md'))
    ),

    # 其它 ----
    tabItem(
      tabName = 'todo',
      includeMarkdown(file.path('www', 'doc', 'todo.md'))
    )
  )
)




# Make UI -----------------------------------------------------------------
function(request) {
  dashboardPage(dsHeader, dsSidebar, dsBody, title = appName, skin = 'red')
}
