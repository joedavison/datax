library(shiny)

ui <- fluidPage(
  headerPanel('⌂ Real Estate Price Predictor'),
  sidebarLayout(
    sidebarPanel(
      tags$h4("House Info:", style="color:violetred"),  
      sliderInput(inputId= "Tot.SF", label="Size (Square Feet)", value=2500, min=500, max=5000),
      sliderInput(inputId = "BR", label="Number of Bedrooms", value=3, min=0, max=12),
      sliderInput(inputId = "Age", label="Age of House (Years)", value=7, min=0, max=100),
      selectInput(inputId = "Heating", label="Heating", choice= list("Forced hot air & cool","Forced hot air-elec","Forced hot air-gas","Forced hot air-oil","Heat pump","Heatpump - Ductless","Hot water","Electric baseboard","Geothermal","Radiant - ceiling","Radiant - floor","Wall units","No heat-wood stove/insert"), selected = "Forced hot air & cool"),
      selectInput(inputId = "Situs_City", label = "City",choice= list("ALBANY","ALSEA","CORVALLIS","MONROE","JUNCTION CITY","PHILOMATH"), selected="A city")
    ),
    
    mainPanel(
      br(),
      tags$h4("Predicted Price:", style="color:violetred"),  
      tags$h1(textOutput("pred.price"),style="color:dodgerblue"),
      br(),
      tags$h4("Expected Range:", style="color:gray"),
      tags$h1(textOutput("intervalx"),"~",textOutput("intervaly"),style="color:gray"),
      br(),
      tags$h4("Documentation", style="color:gray"),
      helpText(a("Click for the User Guide", href="https://docs.google.com/document/d/1nCBWieFva6fKpLgFUYwWo59sxWG6ZTrGAJ44MW2SDuw/edit"))
      #output$pred.price <- renderText()
    )
  )
)
