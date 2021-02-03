#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinythemes)
library(ggplot2)
library(dplyr)

# Define UI for application that draws a histogram
ui <- 
    
    fluidPage(
        
        dashboardPage(
            
            dashboardHeader(title = "Basic dashboard"),
            
            dashboardSidebar(
                
                sidebarMenu(
                    menuItem("Barras", tabName = "Barras", icon = icon("dashboard")),
                    menuItem("Imagenes del postwork 3", tabName = "imgP", icon = icon("file-picture-o")),
                    menuItem("Data Table", tabName = "data_table", icon = icon("table")),
                    menuItem("Imagenes de ganancia minima y maxima", tabName = "imgG", icon = icon("file-picture-o"))
                )
                
            ),
            
            dashboardBody(
                
                tabItems(
                    
                    # Grafica de barras
                    tabItem(tabName = "Barras",
                            fluidRow(
                                titlePanel("Grafica de barras"), 
                                selectInput("x", "Seleccione el valor de X",
                                            choices = c("FTHG","FTAG")),
                                box(plotOutput("plot1", height = 500,width = 500),height = 500,width = 500),
                            )
                    ),
                    
                    # Imagenes postwork 3
                    tabItem(tabName = "imgP", 
                            fluidRow(
                                titlePanel(h3("Imágen de grafica de frecuencia en goles de casa")),
                                img( src = "pos3-1.jpeg", 
                                     height = 300, width = 500),
                                titlePanel(h3("Imágen de grafica de frecuencia en goles de visitante")),
                                img( src = "pos3-2.jpeg", 
                                     height = 300, width = 500),
                                titlePanel(h3("Imágen de grafica de frecuencia entre goles de casa y visitante")),
                                img( src = "pos3-3.jpeg", 
                                     height = 300, width = 500)
                            )
                    ),
                    
                    
                    
                    tabItem(tabName = "data_table",
                            fluidRow(        
                                titlePanel(h3("Data Table")),
                                dataTableOutput ("data_table")
                            )
                    ), 
                    
                    tabItem(tabName = "imgG",
                            fluidRow(
                                titlePanel(h3("Imagen de una grafica de ganancia maxima")),
                                img(src = "max.png", 
                                     height = 300, width = 500),
                                titlePanel(h3("Imágen de una grafica de ganancia minima")),
                                img( src = "min.png", 
                                     height = 300, width = 500)
                            )
                    )
                    
                )
            )
        )
    )

# Define server logic required to draw a histogram
server <- function(input, output) {
    library(ggplot2)
    library(dplyr)
    soccer<-as.data.frame(read.csv("data.csv"))
    
    output$plot1 <- renderPlot({
        ggplot(soccer,aes(soccer[,input$x]))+facet_wrap(soccer$FTAG)+xlab(input$x)+geom_bar(stat="bin")
    })
    
    output$data_table <- renderDataTable( {soccer}, 
                                          options = list(aLengthMenu = c(5,25,50),
                                                         iDisplayLength = 5)
    )
}

# Run the application 
shinyApp(ui = ui, server = server)
