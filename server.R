library(shiny)

payments <- function(frequency, years) {
        # Conversion needed
        frequency <- as.numeric(frequency)
        # Return result
        return( years * frequency )
}

payment <- function(loan, annual.rate, frequency, years) {
        # Conversion needed
        annual.rate <- as.numeric(annual.rate)
        frequency <- as.numeric(frequency)
        # Period rate and number of payments
        rate <- annual.rate / frequency
        payments <- years * frequency
        # Return result
        return( (loan*rate) / (1-(1+rate)^(-payments)) )
}

total <- function(loan, annual.rate, frequency, years) {
        # Conversion needed
        annual.rate <- as.numeric(annual.rate)
        frequency <- as.numeric(frequency)
        # Period rate and number of payments
        rate <- annual.rate / frequency
        payments <- years * frequency
        # Return result
        return( loan * (1+rate)^(payments) )
}

interest <- function(loan, annual.rate, frequency, years) {
        # Conversion needed
        annual.rate <- as.numeric(annual.rate)
        frequency <- as.numeric(frequency)
        # Period rate and number of payments
        rate <- annual.rate / frequency
        payments <- years * frequency
        # Return result
        return( loan * ((1+rate)^(payments) - 1) )
}

shinyServer(function(input, output) {
        output$loan <- renderPrint({ input$loan })
        output$total <- renderPrint({ 
                total(input$loan, input$rate, input$frequency, input$years) })
        output$interest <- renderPrint({
                interest(input$loan, input$rate, input$frequency, input$years) })        
        output$payments <- renderPrint({
                payments(input$frequency, input$years) })        
        output$payment <- renderPrint({ 
                payment(input$loan, input$rate, input$frequency, input$years) })
})

