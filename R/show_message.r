## Consider our example stagerunner from before:
##
##   * import data
##   * clean data
##      * impute variable 1
##      * discretize variable 2
##   * train model
##
## Our goal is to display progress when executing the stagerunner:
##
## ![runner](http://i.imgur.com/NKN3hnk.png)
##
#' Show a progress message when executing a stagerunner.
#'
#' @name show_message
#' @param stage_names character.
#' @param stage_index integer.
#' @param begin logical. Whether we are showing the begin or end message.
#' @param nested logical. Whether or not this is a nested stage (i.e.
#'    contains another stageRunner).
#' @param depth integer. How many tabs to space by (for nested stages).
#' @return the message to standard output
#' @examples 
#' \dontrun{
#' show_message(c('one', 'two'), 2) # Will print "Beginning one stage..."
#' }
show_message <- function(stage_names, stage_index, begin = TRUE, nested = FALSE, depth = 1) {
  stage_name <- stage_names[stage_index]
  if (is.null(stage_name) || stage_name == "")
    stage_name <- list('first', 'second', 'third')[stage_index][[1]] %||%
                  paste0(stage_index, 'th')
  stage_name <- if (begin) crayon::green(stage_name) else crayon::blue(stage_name)
  stage_name <- gsub("(?:Begin|Run) (.*) stage(\\.{3})?", "\\1", stage_name)
  depth <- paste(rep("  ", depth - 1), collapse = '')
  stage_name <- paste0(stage_index, ". ", stage_name)
  if (nested) cat(paste0(depth, if (begin) "Beginn" else "End", "ing ", stage_name, " stage...\n"))
  else if (begin) cat(paste0(depth, "Running ", stage_name, "...\n"))
}
