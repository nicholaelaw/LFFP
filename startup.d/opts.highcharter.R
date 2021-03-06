# highcharter options -----------------------------------------------------
hcoptslang <- getOption('highcharter.lang')
hcoptslang$contextButtonTitle <- "导出"
hcoptslang$decimalPoint       <- "."
hcoptslang$downloadJPEG       <- "下载JPEG"
hcoptslang$downloadPDF        <- "下载PDF"
hcoptslang$downloadPNG        <- "下载PNG"
hcoptslang$downloadSVG        <- "下载SVG"
hcoptslang$downloadCSV        <- "下载CSV"
hcoptslang$downloadXLS        <- "下载XLS"
hcoptslang$viewData           <- "查看数据"
hcoptslang$drillUpText        <- "返回{series.name}"
hcoptslang$invalidDate        <- NULL
hcoptslang$loading            <- "加载中……"
hcoptslang$months             <- c(
  "一月", "二月", "三月", "四月", "五月", "六月",
  "七月", "八月", "九月", "十月", "十一月", "十二月"
)
hcoptslang$noData             <- "无可显示数据"
hcoptslang$numericSymbolMagnitude <- 10000L
hcoptslang$numericSymbols     <- c("万", "亿")
hcoptslang$printChart         <- "打印图表"
hcoptslang$resetZoom          <- "重置缩放"
hcoptslang$resetZoomTitle     <- "重置缩放比例1:1"
hcoptslang$shortMonths        <- c(
  "一月", "二月", "三月", "四月", "五月", "六月",
  "七月", "八月", "九月", "十月", "十一月", "十二月"
)
hcoptslang$thousandsSep       <- ","
hcoptslang$shortWeekdays           <- c(
  "日", "一", "二", "三", "四", "五", "六"
)
hcoptslang$weekdays           <- c(
  "周日", "周一", "周二", "周三", "周四", "周五", "周六"
)
options(highcharter.lang = hcoptslang)
