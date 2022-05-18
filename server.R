library(shiny)
library(leaflet)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()


server <- function(input, output, session) {
    
    points <- eventReactive(input$recalc, {
        cbind(rnorm(2) + input$long, rnorm(2) + input$lat)
    }, ignoreNULL = FALSE)
    # output$value <- renderText({points() })
    output$mymap <- renderLeaflet({
        leaflet() %>%
            addProviderTiles(providers$Stamen.TonerLite,
                             options = providerTileOptions(noWrap = TRUE)
            ) %>%
            addMarkers(data = points())
    })
}

