library(shiny)

# Input widgets to use

loan <- sliderInput("loan", 
                    "How much is the initial loan amount?", 
                    value=130000, min=50000, max=250000, step=10000)
years <- sliderInput("years", "How many years?",
                     value=2, min=1, max=5, step=1)
frequency <- radioButtons("frequency", "Payment frequency?",
                         c("Every month"="12", "Every 2 months"="6",
                           "Every 3 months"="4", "Every 4 month"="3",
                           "Every 6 months"="2"),
                         selected="4")
rate <- selectInput("rate", "Annual rate?",
                    c("12%"=0.12, "13%"=0.13, "14%"=0.14, "15%"=0.15),
                    selected=0.14)

shinyUI(pageWithSidebar(
        headerPanel("Developing Data Products Course Project"),
        sidebarPanel(
                h3("Credit data"),
                loan, years, frequency, rate
        ),
        mainPanel(
                h3("This app is a annuity calculator."),
                br(),
                h4("From credit data (left size) makes the corresponding 
                   calculations considering a fixed periodic amount (annuity)
                   to pay during the indicated time (years)."),
                h4("In the left panel, you can setup different options and this
                   application automatically updates the interest and payments
                   information. The options are limited according to the
                   associated financial institution Bank of ..."),
                br(),
                h4("Initial amount of loan:"),
                verbatimTextOutput("loan"),
                h4("Total amount of loan (plus interest):"),
                verbatimTextOutput("total"),
                h4("Amount of interest:"),
                verbatimTextOutput("interest"),
                h4("Number of payments to make:"),
                verbatimTextOutput("payments"),
                h4("Amount of periodic payment:"),
                verbatimTextOutput("payment")
        )
))