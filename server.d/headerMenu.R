# logics concerning the menu items to the right of the header
observeEvent(input$showNotes, {
  showModal(modalDialog(
    title = NULL, size = 'l', easyClose = TRUE, footer = modalButton('X'),
    includeMarkdown('notes.md')
  ))
})

observeEvent(input$showResult, {
  shinyjs::removeClass(selector = 'body', class = 'sidebar-open')
})

observe({
  if (input$sidebarCollapsed) {
    shinyjs::addClass(id = 'showResult', class = 'invisible')
  } else {
    shinyjs::removeClass(id = 'showResult', class = 'invisible')
  }
})
