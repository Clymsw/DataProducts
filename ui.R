library("shiny")

shinyUI(
  fluidPage(
    
    #Title
    titlePanel(
      h1("Air Density Calculator")
    ),
    
    mainPanel(
      #Inputs
      numericInput('temperature', 'Enter the air temperature (degrees Celsius): ', 
                   20, min = -273, max = 200, step = 1),
      numericInput('pressure', 'Enter the air pressure (Pascal): ', 
                   101325, min = 5, max = 200000, step = 5),
      #checkBoxInput()
      numericInput('humidity', '[Optional] Enter the relative humidity (%): ', 
                   100, min = 0, max = 100, step = 1),
      #submitButton('Calculate air density'),
      
      #Output
      h4('Air density (kg/m^3): '),
      textOutput("density"),
      # verbatimTextOutput("humidity"),
      width = 12
    )
    
    
    
    
  )
)