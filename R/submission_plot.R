#' submission_plot
#'
#' @param n_obs Number of rows to return
#'
#' @export submission_plot
submission_plot <- function (n_obs = 100)
{
  con <- connection_postgres()
  on.exit(dbDisconnect(con))
  submissions <- tbl(con, in_schema("public", "submissions_count")) %>%
    mutate_if(is.numeric, as.numeric) %>%
    collect
}
