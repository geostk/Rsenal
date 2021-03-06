#' Add a caption to a lattice or ggplot2 object 
#' 
#' @description
#' this function adds a caption to an existing plot object 
#' (either \strong{lattice} or \strong{ggplot2}). \code{\link{strwrap}} 
#' is used to automatically wrap text at column 75. Clipping is off, 
#' so long text will continue downward outside the plotting region. 
#' Keep this in mind when setting the height of your graphics device.
#' 
#' 
#' @param obj the \strong{lattice} or \strong{ggplot2} object to which the 
#' caption should be added
#' @param txt the cpation text
#' @param width target column for wrapping lines, see \code{\link{strwrap}}
#' @param ... additional parameters passed on to \code{\link{gpar}}. These 
#' can be used to adjust the fontsize, fontfamily etc. Note that the 
#' default value for fontsize is 16 pt.
#' 
#' @author
#' Tim Appelhans
#' 
#' @examples
#' ## lattice example
#' library(lattice)
#' 
#' p1 <- levelplot(volcano)
#' txt <- "Fig 1.: Elevation of Maunga Whau (Mt Eden) volcano in Auckland. 
#' Axes are standardised values."
#' 
#' figureCaption(p1, txt)
#' 
#' ## change font size
#' figureCaption(p1, txt, fontsize = 12)
#' 
#' ## ggplot2 example
#' library(ggplot2)
#' 
#' p2 <- qplot(1:10, rnorm(10), colour = runif(10))
#' figureCaption(p2, "Fig. 2: Some color coded random numbers.", 
#'               fontface = "italic")
#' 
#' @export figureCaption
#' @aliases figureCaption

figureCaption <- function(obj, txt, width = 75L, ...) {

  d <- sapply(lapply(txt, strwrap, width = width), paste, collapse="\n")
  
  grid.newpage()
  
  ## setup viewports
  vps <- vpList(viewport(x = 0, y = 1, 
                         height = 0.9, width = 1, 
                         just = c("left", "top"),
                         name = "plt.vp"),
                viewport(x = 0, y = 0, 
                         height = 0.1, width = 1, 
                         just = c("left", "bottom"),
                         clip = "off", name = "cap.vp"))
  
  ## plot
  pushViewport(vps)
  seekViewport("plt.vp")
  print(obj, newpage = FALSE)
  
  ## caption
  seekViewport("cap.vp")
  grid.text(label = d, x = 0.1, y = 0.9,
            just = c("left", "top"),
            gp = gpar(...))
  
  popViewport()
}