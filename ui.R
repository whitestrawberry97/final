

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

