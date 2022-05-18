---
title       : 'First'
subtitle    : 'NEw'
author      : 'WhiteStrawberry'
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Slide 1.

First slide to be presented.

--- 

## Slide 2.

Second slide to be presented.


```r
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
```

--- 

## Slide 3.


```r
ui <- fluidPage(
    titlePanel("My Star Wars App"),
    sidebarLayout(
        sidebarPanel(),
        mainPanel(
            h2("In order to run app please input the longitude and latitude and then click : NEW points.", align = "center"),
            h2("The place will be displayed on the map.", align = "center")
        )),
    
    
    leafletOutput("mymap"),
    fluidRow(
        column(3, 
               numericInput("long", 
                            h3("Input longitude"), 
                            value = 19),
               numericInput("lat", 
                            h3("Input latitude"), 
                            value = 51)), 
        p(),
        actionButton("recalc", "New points"))
)
```

--- 

## Slide 4.

Fourth slide to be presented.

--- 

## Slide 5.

Last slide to be presented. 







