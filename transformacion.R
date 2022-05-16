library(sf)
library(tidyverse)
#shp <- st_read("input/shapemunicipios/e20_municipio.shp", 
#               options = "ENCODING=WINDOWS-1252", 
#               stringsAsFactors = F)


#st_write(shp,     "output/oaxaca.gpkg", "municipios")
#st_write(storms, "nc.gpkg", "storms", append = TRUE)


shp <- st_read("https://github.com/alonmar/Shapes/blob/master/output/oaxaca.gpkg?raw=true")

shp <- shp %>% 
  mutate(REGION = if_else(REGION == "Ca¤ada","Cañada", REGION),
         REGION = if_else(REGION == "Papaloapam","Papaloapan", REGION))

shp_regiones <- shp %>% 
  group_by(REGION) %>% 
  summarise() %>% 
  mutate(REGION = if_else(REGION == "Ca¤ada","Cañada", REGION),
         REGION = if_else(REGION == "Papaloapam","Papaloapan", REGION))

st_write(shp,     "output/oaxaca.gpkg", "municipios")
st_write(shp_regiones, "output/oaxaca.gpkg", "regiones_group", append = TRUE)

st_layers("https://github.com/alonmar/Shapes/blob/master/output/oaxaca.gpkg?raw=true")
shp <- st_read("https://github.com/alonmar/Shapes/blob/master/output/oaxaca.gpkg?raw=true", layer = "regiones_group")

### write Oaxaca AGEB


shp <- st_read("../20_oaxaca/conjunto_de_datos/20a.shp", 
               options = "ENCODING=WINDOWS-1252", 
               stringsAsFactors = F)


st_write(shp,     "output/oaxaca_ageb_urb.gpkg", "ageb_urb")
