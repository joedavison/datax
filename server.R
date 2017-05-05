library(shiny)
# pre save the price prediction model
model <- readRDS("model.rds")

shinyServer(function(input, output) {
  
  #deal with the input variables as reactive
  pred.price <- reactive({
    pred.price <- predict(model, newdata = data.frame("Tot.SF"=input$Tot.SF,"BR"=input$BR, "Age"=input$Age,"Heating"=input$Heating,"Situs_City"=input$Situs_City), interval = "confidence", level = 0.95)
  })
  output$pred.price <- renderText({
    paste('$',formatC(array(max(1000,pred.price()[1])), big.mark=',', format = 'd'))
  })
  output$intervalx <- renderText({
    paste('$',formatC(array(max(1000,pred.price()[2])), big.mark=',', format = 'd'))
  })
  output$intervaly <- renderText({
    paste('$',formatC(array(max(1000,pred.price()[3])), big.mark=',', format = 'd'))    
  })
  output$re.image <- renderImage(list(src="images/re-icon.png"))
})
