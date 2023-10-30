require(quantmod)
require(PerformanceAnalytics)
require(xtsExtra)
require(rCharts)


# get S&P 500 data from FRED (St. Louis Fed)
sp500 <- na.omit( 
  getSymbols(
    "SP500",
    src = "FRED",
    from = "1949-12-31",
    auto.assign = FALSE
  )
)

# use monthly data
sp500.monthly <- sp500[endpoints(sp500, on ="months")]
#########################################################
#ggplot2 requires conversion of xts to data.frame
#we will use the data.frame from the plot.default example

#  To use xts with ggplot2, a simple conversion to a wide or long format data.frame is necessary.

ggplot( sp500.df, aes(date) ) + 
  geom_line( aes( y = sp500 ) ) +
  labs( title = "S&P 500 (ggplot2::ggplot)")
  
##########################################################
