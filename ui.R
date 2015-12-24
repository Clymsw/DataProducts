library("shiny")

shinyUI(
  fluidPage(
    tags$head(
      tags$style(HTML("
                      @import url('//fonts.googleapis.com/css?family=Oxygen:400,700');
                      @import url('//fonts.googleapis.com/css?family=Alegreya+Sans:400,700');
                      
                      h1 {
                      font-family: 'Oxygen', sans-serif;
                      font-weight: 700;
                      line-height: 1.1;
                      color: CornflowerBlue;
                      }

                      h4 {
                      font-family: 'Alegreya+Sans', sans-serif;
                      font-weight: 400;
                      line-height: 1;
                      color: #000000;
                      }

                      h3 {
                      font-family: 'Alegreya+Sans', sans-serif;
                      font-weight: 400;
                      line-height: 1;
                      color: #000000;
                      text-decoration: underline;
                      }
                      
                      "))
    ),
    
    withMathJax(),
    
    #Title
    titlePanel(
      h1("Air Density Calculator")
    ),
    
    #Inputs
    fluidRow(
      
      column(4, 
             tags$h4(HTML("Enter the air temperature (&deg;C): ")),
             numericInput('temperature', '', 20, min = -273, max = 200, step = 1)
      ),
      
      column(4, 
             h4("Enter the air pressure (Pascal): "),
             numericInput('pressure', '', 101325, min = 5, max = 200000, step = 5)
      ),
      
      column(4, 
             h4("Enter the relative humidity (%): "),
             numericInput('humidity', '', 0, min = 0, max = 100, step = 1)
      )
      
    ),
    #     mainPanel(
    #       #Inputs
    #       checkboxInput('useRH', 'Use Relative Humidity', FALSE),
    #       conditionalPanel(
    #         condition = "useRH == true",
    #         numericInput('humidity', '[Optional] Enter the relative humidity (%): ', 
    #                      100, min = 0, max = 100, step = 1)
    #       ),
    
    #submitButton('Calculate air density'),
    
    tags$br(),
    
    #Reset to default values
    actionButton('resetSTP', 'Reset'),
    
    tags$br(),
    tags$br(),
    
    #Output
    column(3, 
           h4(HTML(paste('Air density (kg/m',tags$sup(3),'): ', sep = "")))
    ),
    column(3, 
           h3(textOutput("density"))
    ),

    width = 12
    
  )
)


