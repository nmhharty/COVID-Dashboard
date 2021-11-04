#UI for INTERNAL Routt County COVID-19 Dashboard
#Created 11/2/2021
#Last updated 11/2/2021

#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    # titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    # sidebarLayout(
    #     sidebarPanel(
    #         sliderInput("bins",
    #                     "Number of bins:",
    #                     min = 1,
    #                     max = 50,
    #                     value = 30)
    #     ),
    # 
    #     # Show a plot of the generated distribution
    #     mainPanel(
    #         plotOutput("distPlot")
    #     )
    # )
    
    fluidRow(
        includeHTML("INTERNAL Routt County COVID Dashboard.html")
    )
    
))
