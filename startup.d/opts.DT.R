# DT options --------------------------------------------------------------
options(
  DT.options = list(
    dom = 'Bfrtip',
    pageLength = 10L,
    searching = FALSE,
    rownames = FALSE,
    autoHideNavigation = TRUE,
    language = list(
      url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json',
      buttons = list(
        copy = '复制', csv = 'csv', excel = 'xlsx', pdf = 'PDF',
        print = '打印', colvis = '选择列', colvisRestore = '恢复',
        copyTitle = '复制到剪贴板',
        copySuccess = list(
          `_` = '复制了%d条数据',
          `1` = '复制了1条数据'
        )
      )
    )
  )
)
