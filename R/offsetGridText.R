#' Insert offset text annotation into 'trellis' plot
#' 
#' @description
#' This is a wrapper function around \code{\link{calcOffsetGridText}} and 
#' \strong{grid}-based text drawing functions (currently including 
#' \code{\link{grid.text}} and \code{\link{grid.stext}}) that automatically adds
#' offset text annotations to a 'trellis' plot.
#' 
#' @param x Numeric. A vector containing x coordinates, or a 2-column
#' matrix containing x and y coordinates.
#' @param y Numeric. A vector containing y coordinates, or \code{NULL} 
#' if x is a two-column matrix.
#' @param labels Character. The text to be written.
#' @param xlim Numeric. X-axis limits (xmin, xmax) of the current plot. If not
#' supplied, limits are automatically calculated from supplied x and y
#' coordinates.
#' @param ylim Numeric. Y-axis limits (ymin, ymax) of the current plot. If not
#' supplied, limits are automatically calculated from supplied x and y
#' coordinates.
#' @param pos Integer. Text position specifier(s) as used by \code{\link{text}}.
#' If not supplied, optimal text positions will be determined with respect to 
#' neighboring locations using \code{\link{thigmophobe}}. 
#' @param stext Logical. If \code{TRUE}, shadow text will be drawn (see 
#' \code{grid.stext}) instead of ordinary \code{\link{grid.text}}.
#' @param offset Numeric. The desired offset in normalized parent coordinates
#' ("npc", see \code{\link{unit}}).
#' @param ... Further arguments passed on the chosen \strong{grid} text 
#' drawing function. 
#' 
#' @author
#' Florian Detsch
#' 
#' @examples
#' \dontrun{
#' #' bing satellite image of mt. kilimanjaro
#' rst_kili <- kiliAerial(minNumTiles = 12,
#'                        projection = "+init=epsg:4326")
#' spl_kili <- rgb2spLayout(rst_kili, alpha = .8)
#' 
#' #' kilimanjaro peaks
#' kibo <- c(-3.065053, 37.359031)
#' mawenzi <- c(-3.095436, 37.455061)
#' shira <- c(-3.038222, 37.210408)
#' 
#' mat_peaks <- rbind(kibo, mawenzi, shira)
#' df_peaks <- data.frame(peak = c("Kibo", "Mawenzi", "Shira"), 
#'                        x = mat_peaks[, 2], 
#'                        y = mat_peaks[, 1])
#' 
#' coordinates(df_peaks) <- ~ x + y
#' projection(df_peaks) <- "+init=epsg:4326"
#' 
#' #' visualization
#' library(latticeExtra)
#' 
#' xlim_kili <- c(37.15, 37.55)
#' ylim_kili <- c(-3.25, -2.9)
#' 
#' p_kili <- spplot(df_peaks, auto.key = FALSE, col.regions = "white", 
#'                  xlim = xlim_kili, ylim = ylim_kili, cex = 2, pch = 20,
#'                  scales = list(draw = TRUE), sp.layout = spl_kili) + 
#'   layer(sp.points(df_peaks, cex = 1.5, pch = 20, col = "black"))
#' 
#' print(p_kili)
#' 
#' library(grid)
#' downViewport(trellis.vpname(name = "figure"))
#' offsetGridText(x = coordinates(df_peaks), labels = c("Kibo", "Mawenzi", "Shira"),  
#'                xlim = xlim_kili, ylim = ylim_kili, stext = TRUE, offset = .02,
#'                gp = gpar(fontsize = 20, fontfamily = "Bookman Old Style"))
#' }
#'   
#' @name offsetGridText-deprecated
#' @usage offsetGridText(x, y = NULL, labels, xlim = NULL, ylim = NULL, 
#' pos = NULL, stext = FALSE, offset = 0.02, ...)     
#' @seealso \code{\link{Rsenal-deprecated}}  
#' @keywords internal
NULL

#' @rdname Rsenal-deprecated
#' @section \code{offsetGridText}:
#' For \code{offsetGridText}, use \code{\link[Orcs]{offsetGridText}} instead.
#' 
#' @export 
offsetGridText <- function(x, y = NULL, labels, xlim = NULL, ylim = NULL, 
                           pos = NULL, stext = FALSE, offset = .02, ...) {

  .Deprecated("Orcs::offsetGridText", "Rsenal")
  Orcs::offsetGridText(x, y, labels, xlim, ylim, pos, stext, offset, ...)
}