# debugging ---------------------------------------------------------------
output$debugging <- renderUI({
  fluidPage(
    actionButton('reload-lib', 'Reload', icon = icon('refresh')),
    hr(),
    runcodeUI(code = '', type = 'text'),
    hr(),
    renderPrint({sessionInfo()}),
    renderPrint({
      rlist <- reactiveValuesToList(input)
      rlist[order(names(rlist))]
    }),
    renderPrint({reactiveValuesToList(session$clientData)}),
    renderPrint({
      rlist <- as.list(.GlobalEnv)
      rlist[order(names(rlist))]
    })
  )
})

runcodeServer()

observeEvent(input$`reload-lib`, {
  source('global.R', encoding = 'UTF-8', local = FALSE)
})
