source(file.path('startup.d', 'specific.R'), encoding = 'UTF-8', local = FALSE)
source(file.path('ui.d',   '其它工作.ui.R'), encoding = 'UTF-8', local = FALSE)

# header ------------------------------------------------------------------
dsHeader <- dashboardHeader(
  title = appName
)



# sidebar -----------------------------------------------------------------
# 基本参数 <- source(file.path('ui.d', '基本参数.R'), encoding = 'UTF-8', local = TRUE)$value
# 产品设置 <- source(file.path('ui.d', '产品设置.R'), encoding = 'UTF-8', local = TRUE)$value
# 其它设置 <- source(file.path('ui.d', '其它设置.R'), encoding = 'UTF-8', local = TRUE)$value
数据工作 <- source(file.path('ui.d', 'data-jobs.ui.R'),encoding = 'UTF-8', local = TRUE)$value

# 数据文档 <- source(file.path('ui.d', 'extra.R'),    encoding = 'UTF-8', local = TRUE)$value

dsSidebar <- dashboardSidebar(
  collapsed = FALSE,
  sidebarMenu(
    menuItem('数据工作',     tabName = '数据工作'),
    menuItem('数据文档',     tabName = '数据文档'),
    menuItem('其它工作',     tabName = '其它工作'),
    menuItem('交接清单及未竟事宜', tabName = '清单'),
    menuItem('其它',         tabName = '其它')
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
    tabItem(tabName = '数据工作', 数据工作),
    tabItem(
      tabName = '数据文档',
      includeMarkdown(file.path('www', 'doc', '数据工作简述.md'))
    ),
    tabItem(
      tabName = '其它工作',
      includeMarkdown(file.path('www', 'doc', '其它工作简述.md'))
    ),
    tabItem(
      tabName = '清单',
      includeMarkdown(file.path('www', 'doc', '文件交接清单.md'))
    ),
    tabItem(
      tabName = '其它',
      p('hello4')
    )
  )
)




# Make UI -----------------------------------------------------------------
function(request) {
  dashboardPage(dsHeader, dsSidebar, dsBody, title = appName, skin = 'red')
}
