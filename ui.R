sidebar <- dashboardSidebar(
  sidebarMenu(
    div(style="height: 20px;"),
    div(style="width: 150px;",uiOutput("Year")),
    actionButton("goButton", "Map it",style='padding:10px; font-size:80%')
    
  )
)



dashboardPage( 
  dashboardHeader(title = "Sustainability Index"),
  
  sidebar,
  dashboardBody(
    fluidRow(
      tags$style(type = "text/css", "label { font-size: 15px; }",".content, .container-fluid {background-color: #ffffff;}"
      ),
      #tags$style(type = "text/css", "#leafmap {height: calc(100vh - 80px) !important;}"),
      tabsetPanel(type = "tabs",
                  tabPanel("Map",
                           leafletOutput("leafmap") %>% withSpinner(color="#00688B")
                           
                  ))
    )
    
  )
)