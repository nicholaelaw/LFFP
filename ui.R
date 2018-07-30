source(file.path('startup.d', 'specific.R'), encoding = 'UTF-8', local = FALSE)

# header ------------------------------------------------------------------
dsHeader <- dashboardHeader(
  title = appName
  # tags$li(
  #   class = 'dropdown menu',
  #   a(href = "#", class = "dropdown-toggle", `data-toggle` = "dropdown", icon('ellipsis-h'), NULL),
  #   tags$ul(
  #     class = "dropdown-menu",
  #     tags$li(tags$ul(
  #       class = "menu",
  #       tags$li(tags$a(
  #         id = 'showNotes', href = '#', icon('question-circle'), class = 'action-button',
  #         '使用说明'
  #       )),
  #       tags$li(tags$a(
  #         id = 'showResult', href = '#', icon('arrow-right'), class = 'action-button',
  #         '查看结果'
  #       ))
  #     ))
  #   )
  # )
)



# sidebar -----------------------------------------------------------------
# 基本参数 <- source(file.path('ui.d', '基本参数.R'), encoding = 'UTF-8', local = TRUE)$value
# 产品设置 <- source(file.path('ui.d', '产品设置.R'), encoding = 'UTF-8', local = TRUE)$value
# 其它设置 <- source(file.path('ui.d', '其它设置.R'), encoding = 'UTF-8', local = TRUE)$value
# 应用设置 <- source(file.path('ui.d', 'extra.R'),    encoding = 'UTF-8', local = TRUE)$value

dsSidebar <- dashboardSidebar(
  collapsed = FALSE,
  sidebarMenu(
    menuItem('数据工作', tabName = '数据工作'),
    menuItem('岗位交接', tabName = '岗位交接'),
    menuItem('数据文档', tabName = '数据文档'),
    menuItem('其它',     tabName = '其它')
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
  # tabsetPanel(
  #   id =  'resultPanel',
  #   tabPanel('主要', uiOutput('主要')),
  #   tabPanel('还款计划', uiOutput('还款计划')),
  #   tabPanel('Debugging', uiOutput('debugging'))
  # )
  tabItems(
    tabItem(
      tabName = '数据工作',
      fluidPage(
        fluidRow(
          dateInput('rDate', label = '选择报告日')
        )

      )
    ),
    tabItem(
      tabName = '岗位交接',
      h1('hello2')
    ),
    tabItem(
      tabName = '数据文档',
      a('hello3')
    ),
    tabItem(
      tabName = '其它',
      span('hello4')
    )
  )
)




# Make UI -----------------------------------------------------------------
function(request) {
  dashboardPage(dsHeader, dsSidebar, dsBody, title = appName, skin = 'red')
}
