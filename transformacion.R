library(sf)
shp <- st_read("input/shapemunicipios/e20_municipio.shp", 
               options = "ENCODING=WINDOWS-1252", 
               stringsAsFactors = F)


st_write(shp,     "output/oaxaca.gpkg", "municipios")
#st_write(storms, "nc.gpkg", "storms", append = TRUE)


shp <- st_read("https://github.com/alonmar/Shapes/blob/master/output/oaxaca.gpkg?raw=true")
st_layers("https://github.com/alonmar/Shapes/blob/master/output/oaxaca.gpkg?raw=true")
