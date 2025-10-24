library("shiny")
install.packages("ggplot2")
library("ggplot2")
ui <- fluidPage()
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#mtcars
mtcars

#Add plain text to the UI
ui <- fluidPage("my first shiny app",
                "mtcars")
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Add formatted text and other HTML elements
ui <- fluidPage(h1("my first shiny app"),
                br(),
                strong("mtcars"),
                div("this is blue", style = "color: blue;"))
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Add title
ui <- fluidPage(titlePanel("MTCARS Dashboard"))
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Add a layout
ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input")),
                  mainPanel(h2("Output"))
                ))
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

print(ui)

#Add inputs to the UI
mtcars
range(mtcars$mpg)

#Slider Input
ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input"),  # nolint # nolint # nolint # nolint
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20)), # nolint
                  mainPanel(h2("Output"))
                ))
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Radio Buttons
unique(mtcars$gear)

ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                sidebarPanel(h2("Input"),  # nolint # nolint
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20), # nolint
                               radioButtons("gears", "# of Gears",choices = c(3,4,5), selected = 4)), # nolint # nolint
                mainPanel(h2("Output"))
                ))
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Select Input

ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input"), 
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20), # nolint
                               radioButtons("gears", "# of Gears",choices = c(3,4,5), selected = 4), # nolint
                               selectInput("vs", "VS Type",choices = c(0,1))),
                  mainPanel(h2("Output"))
                ))
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Output

ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input"), 
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20), # nolint
                               radioButtons("gears", "# of Gears",choices = c(3,4,5), selected = 4), # nolint
                               selectInput("vs", "VS Type",choices = c(0,1))),
                  mainPanel(
                    h2("Output"),
                    plotOutput("plot"),
                    br(),br(),
                    tableOutput("results")
                    ) # nolint
                ))
server <- function(input, output) {}
shinyApp(ui = ui, server = server)

#Implement Server Logic to Create Outputs

ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input"), 
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20), # nolint
                               radioButtons("gears", "# of Gears",choices = c(3,4,5), selected = 4), # nolint
                               selectInput("vs", "VS Type",choices = c(0,1))), # nolint # nolint
                  mainPanel(
                    h2("Output"),
                    plotOutput("plot"),
                    br(),br(),
                    tableOutput("results")
                  )
                ))
server <- function(input, output) {
  output$plot <- renderPlot({
    plot(rnorm(100))
  })
}
shinyApp(ui = ui, server = server)

#Making an Output React to an Input

ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input"), 
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20), # nolint
                               radioButtons("gears", "# of Gears",choices = c(3,4,5), selected = 4), # nolint # nolint
                               selectInput("vs", "VS Type",choices = c(0,1))), # nolint
                  mainPanel(
                    h2("Output"),
                    plotOutput("plot"),
                    br(),br(),
                    tableOutput("results")
                  )
                ))
server <- function(input, output) {
  output$plot <- renderPlot({
    plot(rnorm(input$mpg))
  })
}
shinyApp(ui = ui, server = server)

#Building the Plot Output

mtcars

ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input"), 
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20), # nolint
                               radioButtons("gears", "# of Gears",choices = c(3,4,5), selected = 4), # nolint
                               selectInput("vs", "VS Type",choices = c(0,1))), # nolint
                  mainPanel(
                    h2("Output"),
                    plotOutput("plot"),
                    br(),br(),
                    tableOutput("results")
                  )
                ))
server <- function(input, output) {
  output$plot <- renderPlot({
     # nolint
    filtered_data <- mtcars[mtcars$mpg <= input$mpg &
                            mtcars$gear == input$gears & # nolint
                            mtcars$vs == input$vs,]
     # nolint
    ggplot(data = filtered_data, aes(x = wt, y = mpg)) + # nolint # nolint
    geom_point() # nolint # nolint
  })
}
shinyApp(ui = ui, server = server)

#Building the Table Output

ui <- fluidPage(titlePanel("MTCARS Dashboard"),
                sidebarLayout(
                  sidebarPanel(h2("Input"), 
                               sliderInput("mpg", "MPG", min = 10, max = 35, step = 1, round = TRUE, value = 20), # nolint
                               radioButtons("gears", "# of Gears",choices = c(3,4,5), selected = 3), # nolint
                               selectInput("vs", "VS Type",choices = c(0,1))), # nolint
                  mainPanel(
                    h2("Output"),
                    plotOutput("plot"),
                    br(),br(), # nolint
                    tableOutput("results")
                  )
                ))
server <- function(input, output) {
  output$plot <- renderPlot({
     # nolint
    filtered_data <- mtcars[mtcars$mpg <= input$mpg &
                              mtcars$gear == input$gears &
                              mtcars$vs == input$vs,]
     # nolint
    ggplot(data = filtered_data, aes(x = wt, y = mpg)) + # nolint
      geom_point()
  })
  output$results <- renderTable({
     # nolint
    filtered_data <- mtcars[mtcars$mpg <= input$mpg &
                              mtcars$gear == input$gears &
                              mtcars$vs == input$vs,]
     # nolint
    filtered_data
  })
}
shinyApp(ui = ui, server = server)