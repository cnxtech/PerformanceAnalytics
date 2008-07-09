\name{chart.StackedBar}
\alias{chart.StackedBar}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ create a stacked bar plot }
\description{
   This creates a stacked column chart with time on the horizontal axis and values in categories.  This kind of chart is commonly used for showing portfolio 'weights' through time, although the function will plot any values by category.
}
\usage{
chart.StackedBar(w, colorset = NULL, space = 0.2, cex.legend = 0.8, cex.names = 1, las=3, legend.loc="under",  element.color = "darkgray", unstacked = FALSE, xlab=NULL, ... ) 
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{w}{ a matrix, data frame or zoo object of values to be plotted.  Rownames should contain dates or period labels; column names should indicate categories.  See examples for detail. }
  \item{colorset}{ color palette to use, set by default to rational choices }
  \item{space}{ the amount of space (as a fraction of the average bar width) left before each bar, as in \code{\link{barplot}}. Default is 0.2. }
  \item{cex.legend}{ The magnification to be used for sizing the legend relative to the current setting of 'cex', similar to \code{\link{plot}}. }
  \item{cex.names}{ The magnification to be used for sizing the bar labels relative to the current setting of 'cex', as in \code{\link{barplot}}. }
  \item{las}{ sets the orientation of the axis labels, as described in \code{\link{par}}.  Defaults to '3'. }
  \item{legend.loc}{ places a legend into a location on the chart similar to \code{\link{chart.TimeSeries}}. The default, "under," is the only location currently implemented for this chart.  Use 'NULL' to remove the legend. }
  \item{element.color}{ provides the color for drawing less-important chart elements, such as the box lines, axis lines, etc. }
  \item{unstacked}{ logical.  If set to 'TRUE' \emph{and} only one row of data is submitted in 'w', then the chart creates a normal column chart.  If more than one row is submitted, then this is ignored.  See examples below. }
  \item{xlab}{ the x-axis label, which defaults to 'NULL'. }
  \item{\dots}{ arguments to be passed to \code{\link{barplot}}. These can include further arguments (such as 'axes', 'asp' and 'main') and graphical parameters (see 'par') which are passed to 'plot.window()', 'title()' and 'axis'. }
}
\details{
  This function is a wrapper for \code{\link{barplot}} but adds two additional capabilities.  First, it calculates and sets a bottom margin for long column names that are rotated vertically.  That doesn't always result in the prettiest chart, but it does ensure readable labels.  Second, it places a legend "under" the graph rather than within the bounds of the chart (which would obscure the data).  The legend is created from the column names.  The default is to create the legend when there's more than one row of data being presented.  If there is one row of data, the chart may be "unstacked" and the legend removed.
}
\value{
  Plots a column chart or stacked column chart to the current device.
}
\references{ 
     Chambers, J.M., Cleveland, W.S., Kleiner, B., and Tukey, P.A.
     (1983), Graphical Methods for Data Analysis, Belmont, CA:
     Wadsworth.

     Tufte, Edward R. (2006) Beautiful Evidence. The Graphics
     Press, Cheshire, Connecticut. See http://www.edwardtufte.com for
     this and other references.
}

\author{ Peter Carl }
\note{ The 'w' attribute is so named because this is a popular way to show portfolio weights through time.  That being said, this function isn't limited to any particular values and doesn't provide any normalization, so that the chart can be used more generally.

The principal drawback of stacked column charts is that it is very difficult for the reader to judge size of 2nd, 3rd, etc., data series because they do not have common baseline.  Another is that with a large number of series, the colors may be difficult to discern.  As alternatives, Cleveland advocates the use of trellis like displays, and Tufte advocates the use of small multiple charts.

}
\seealso{ \code{\link{barplot}}, \code{\link{par}} }
\examples{
data(weights)
head(weights)

# With the legend "under" the chart
chart.StackedBar(weights, legend.cex = 0.7, colorset=rainbow12equal)

# Without the legend
chart.StackedBar(weights, colorset=rainbow12equal, legend.loc=NULL)

# for one row of data, use 'unstacked' for a better chart
chart.StackedBar(weights[1,,drop=F], unstacked=T)

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ts }
\keyword{ multivariate }
\keyword{ hplot }