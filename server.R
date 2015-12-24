calcAirDensity <- function(air.temp, air.pressure, air.RH = NA) {
  #air.temp in degrees Celsius
  #air.pressure in Pascal
  #air.RH in % (if not entered, not used)
  
  ## Constants
  constant.Kelvin <- 273.15
  constant.DryAir <- 287.058
  constant.WaterVapour <- 461.5
  
  if (is.na(air.RH)) {
    # Relative Humidity not specified
    air.temp <- air.temp + constant.Kelvin
    air.density <- air.pressure / (constant.DryAir * air.temp)
    
  } else {
    # Use RH correction
    
    tmp.exponent <- (7.5*air.temp) / (air.temp + 237.3)
    air.vapourpressure <- air.RH * 6.1078 * (10^tmp.exponent)
    
    air.temp <- air.temp + constant.Kelvin
    
    air.density <- (air.pressure-air.vapourpressure) / (constant.DryAir*air.temp)
    air.density <- air.density + (air.vapourpressure/(constant.WaterVapour*air.temp))
    
  }
  
  return(air.density)
  
}

shinyServer(
  function(input, output, session) {
    output$temperature <- renderPrint({input$temperature})
    output$pressure <- renderPrint({input$pressure})
    output$humidity <- renderPrint({input$humidity})
    
    output$density <- renderText({
      calcAirDensity(input$temperature, input$pressure, input$humidity)
      })
    
    observeEvent(input$resetSTP, {
      updateNumericInput(session, 'temperature', value = 20)
      updateNumericInput(session, 'pressure', value = 101325)
      updateNumericInput(session, 'humidity', value = 0)
    })
    
  }
  
)