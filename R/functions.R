#' descriptive stats function
#'
#' @param data
#'
#' @return A data.frame/tibble
#'
descriptive_stats <- function(data) {
  data |>
    dplyr::group_by(metabolite) |>
    dplyr::summarise(dplyr::across(value, list(mean = mean, sd = sd))) |>
    dplyr::mutate(dplyr::across(where(is.numeric), ~ round(.x, digits = 1)))
}


#' histogram function
#'
#' @param data
#'
#' @return Histograms for metabolites
#'
plot_distributions <- function(data) {
  ggplot2::ggplot(data, ggplot2::aes(x = value)) +
    ggplot2::geom_histogram() +
    ggplot2::facet_wrap(ggplot2::vars(metabolite), scales = "free")
}



#' Convert a column's character values to snakecase format.
#'
#' @param data The lipidomics dataset.
#' @param columns The column you want to convert into the snakecase format.
#'
#' @return A data frame.
#'
column_values_to_snake_case <- function(data, columns) {
    data |>
        dplyr::mutate(dplyr::across({{ columns }}, snakecase::to_snake_case))
}


#' Convert data from long to wide format.
#'
#' @param data
#'
#' @return A wide data frame.
#'
metabolites_to_wider <- function(data){
    data |>
        tidyr::pivot_wider(
            names_from = metabolite,
            values_from = value,
            values_fn = mean,
            names_prefix = "metabolite_"
        )
}

#' A transformation recipe to pre-process the data.
#'
#' @param data The lipidomics dataset.
#' @param metabolite_variable The column of the metabolite variable.
#'
#' @return
#'
create_recipe_spec <- function(data, metabolite_variable) {
    recipes::recipe(data) |>
        recipes::update_role({{ metabolite_variable }}, age, gender, new_role = "predictor") |>
        recipes::update_role(class, new_role = "outcome") |>
        recipes::step_normalize(tidyselect::starts_with("metabolite_"))
}
