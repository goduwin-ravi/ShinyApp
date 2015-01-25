#ui.R

library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Miles Per Gallon"),

  sidebarPanel( 
    helpText("Analyze MPG data by a given parameter. 
             The scope of data may be restricted to a specific number of cylinders (4,6, or 8)
             and also to the type of transmission (Manual or Automatic). 
             Optiionally, you may also include or exclude outlier data from your analysis."),
    
    selectInput("variable", "Parameter:",
                list("Cyliners" = "cyl",
                     "Transmission Type" = "am",
                     "Gears" = "gear",
                     "Weight" = "wt",
                     "Horse Power" = "hp")),

    br(),
    
    sliderInput("cyl", "Cylinders:", 
                min=4, max=8, step=2, value=4),
    
    br(),
    
    radioButtons("am", "Transmission type:",
                 list("Automatic" = "0",
                      "Manual" = "1")),
    
    br(),
    
    checkboxInput("outliers", "Show outliers", FALSE)),

  mainPanel(
    h3(textOutput("caption")),

    plotOutput("mpgPlot"))
))