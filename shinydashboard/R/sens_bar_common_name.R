sens_bar_common_name <- function(input) {

  combined_pred_common_name  <- reactive ({
    combined_pred %>% 
      filter(common_name %in% input$common_name)
  })

  renderPlot({
    ggplot(data = combined_pred_common_name(), aes(x = drought_sens, y = sens_level)) +
      geom_point()

  })
}