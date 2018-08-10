# Set encoding ------------------------------------------------------------
encoding <- getOption("shiny.site.encoding", default = "UTF-8")

# custom --------------------------------------------------------------------------------------
monthStart <- function(DATE) {
  result <- DATE
  day(result) <- 1L
  return(result)
}

monthEnd   <- function(DATE) {
  return(monthStart(DATE) + months(1L) - days(1L))
}




# patched functions ---------------------------------------------------------------

# includeMarkdown for Chinese
includeMarkdown <- function(path) {
  html <- markdown::markdownToHTML(path, fragment.only = TRUE, encoding = encoding)
  return(HTML(html))
}

## function to render .Rmd files to html - does not embed image or add css
## stolen from https://github.com/vnijs/shiny-site/raw/master/global.R
includeRmd <- function(path, r_env = parent.frame()) {
  paste(
    readLines(path, warn = FALSE, encoding = 'UTF-8'),
    collapse = '\n'
  ) %>% knitr::knit2html(
    text = .,
    fragment.only = TRUE,
    envir = r_env,
    options = "",
    stylesheet = "",
    encoding = encoding
  ) %>% gsub(
    "&lt;!--/html_preserve--&gt;", "", . ## knitr adds this
  ) %>% gsub(
    "&lt;!--html_preserve--&gt;", "", . ## knitr adds this
  ) %>% HTML
}


# More options for actionButton
# See gist: https://gist.github.com/xiaodaigh/7012930
actionButton <- function(inputId, label, icon = NULL, style = '',
                          size = 'default', extra.class = '', disabled = FALSE,
                          width = NULL, ...) {
  require(shiny)

  if (style == '') {
    btnStyle <- 'btn-default'
  } else {
    btnStyle <- paste0('btn-', style)
  }

  if (size == 'default') {
    btnSize <- ''
  } else {
    btnSize <- paste0('btn-', size)
  }

  if (disabled) {
    btnDis <- 'disabled'
  } else {
    btnDis <- ''
  }

  btnClass <- paste(
    'btn', btnStyle, btnSize, btnDis, 'action-button', extra.class,
    sep = ' '
  )

  value <- shiny::restoreInput(id = inputId, default = NULL)
  tags$button(
    id = inputId, style = if (!is.null(width))
    paste0("width: ", shiny::validateCssUnit(width), ";"), type = "button",
    class = btnClass, `data-val` = value,
    list(shiny:::validateIcon(icon), label), ...)
}

# patching column to use xs grid
column <- function(width, ..., grid = 'sm', offset = 0) {
  if (!is.numeric(width) || (width < 1) || (width > 12))
    stop("column width must be between 1 and 12")
  colClass <- paste0("col-", grid, "-", width, collapse = ' ')
  if (offset > 0)
    colClass <- paste0(
      colClass,
      paste0(" col-", grid, "-offset-", offset, collapse = ' ')
    )
  div(class = colClass, ...)
}

# patching sidebarPanel and mainPanel
sidebarPanel <- function(..., grid = 'sm', width = 4) {
  div(class = paste0("col-", grid, "-", width, collapse = ' '), tags$form(class = "well",
    ...))
}

mainPanel <- function (..., grid = 'sm', width = 8) {
  div(class = paste0("col-", grid, "-", width, collapse = ' '), ...)
}

actionLinkButton <- function(inputId, href = '#', ...) {
  tags$a(
    id = inputId, href = href, class = 'action-button', style = 'display: inline', ...
  )
}

# simple text formatting, line by line
pfline <- function(label, value, width = 80L, pad = ' ',
                   output = c('list', 'vector', 'string'),
                   rep = FALSE, withHTML = FALSE) {
  stopifnot(require(stringi))
  if (missing(output)) {output <- 'list'}
  if (withHTML) {
    output  <- 'vector'
    newline <- TRUE
  } else {
    newline <- FALSE
  }

  labelStr <- as.character(label)
  if (rep) {
    result <- strtrim(paste0(rep(labelStr, width), collapse = ''), width)
    return(paste0(ifelse(newline, '\n', ''), result))
  }
  valueStr <- stri_pad_left(value, width = width - stri_width(labelStr), pad = pad)
  result   <-
    if (output == 'list') {
      as.list(paste0(ifelse(newline, '\n', ''), labelStr, valueStr))
    } else if (output == 'vector') {
      paste0(ifelse(newline, '\n', ''), labelStr, valueStr)
    } else if (output == 'string') {
      paste0(ifelse(newline, '\n', ''), labelStr, valueStr, collapse = '\n')
    }

  return(result)
}

pftitle <- function(title, width = 80L, pad = ' ', withHTML = FALSE) {
  stopifnot(require(stringi))
  if (withHTML) {newline <- TRUE} else {newline <- FALSE}
  titleStr <- as.character(title)

  result <- stri_pad_both(titleStr, width = width, pad = pad)
  return(paste0(ifelse(newline, '\n', ''), result))
}

f.str2money <- function(str, digits = 2L) {
  x <- as.numeric(str)
  result <- format(
    round(x, digits = digits),
    big.mark = ',', nsmall = digits
  )
  return(result)
}


f.str2per <- function(str, digits = 1L, asis = TRUE) {
  x <- as.numeric(str)
  result <- format(
    round(ifelse(asis, x, x * 100), digits = digits),
    big.mark = ',', nsmall = digits
  )
  return(paste0(result, '%'))
}

f.str2ct <- function(str) {
  x <- as.numeric(str)
  result <- format(
    round(x, digits = 0L),
    big.mark = ',', nsmall = 0L
  )
  return(result)
}
