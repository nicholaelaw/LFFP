div(
  id = 'extras',
  includeMarkdown('notes.md'),
  div(HTML(paste(
    icon('code fa-fw'), 'with', icon('heart fa-fw'), 'and',
    icon('beer fa-fw'), 'in', icon('cube fa-fw'), 'by',
    icon('child fa-fw')
  )), style = 'text-align: center; margin-top: 3em;'),
  hr()
)
