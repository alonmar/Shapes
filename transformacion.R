library(sf)
shp <- st_read("input/shapemunicipios/e20_municipio.shp", 
               options = "ENCODING=WINDOWS-1252", 
               stringsAsFactors = F)


st_write(shp,     "output/oaxaca.gpkg", "municipios")
