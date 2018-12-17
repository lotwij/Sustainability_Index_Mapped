function(input, output,session) {

output$Year <- renderUI({
  list(
    selectInput("Year", 
                label=h5("Year"),
                choices = unique(df$Year), 
                selected = NULL, multiple = FALSE)
  )
})

output$leafmap <- renderLeaflet({
  leaflet() %>% 
    addProviderTiles("Esri.WorldTerrain")%>% setView(48.409703, 14.776540, zoom = 2)
  
  
})

observeEvent(input$goButton, {
    p<-leafletProxy("leafmap", data = df) %>%
      addLabelOnlyMarkers(lng = ~Longitude, lat = ~Latitude, label = ~htmlEscape(Country),
                          labelOptions = labelOptions(noHide = TRUE, textOnly = TRUE,
                                                      direction = "bottom", offset = c(0,-10))) %>%
      addMinicharts(df$Longitude, df$Latitude, type = "bar",
                    chartdata = df[,c("Environmental.Wellbeing", "Economic.Wellbeing","Human.Wellbeing")], 
                    width = 20, height =15)
    return(p)
  })





}