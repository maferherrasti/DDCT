# Autor: María Fernanda Herrasti Campos
# Fecha: 2024-05-16
# Descripción: Cálculo de 2^-ΔΔCT para cada gen a partir de la base de datos proporcionada.

# Cargar librerías necesarias
library(pacman)
p_load("vroom", "dplyr", "ggplot2")

# Cargar los datos
url <- "https://raw.githubusercontent.com/ManuelLaraMVZ/Transcript-mica/main/examen2"
data <- vroom(url)

# Visualizar los datos
head(data)

# Filtrar los datos de interés y realizar cálculos
# Supongamos que las columnas relevantes son Gen, CT_Control y CT_Tratamiento

# Calcular ΔCT (Diferencia de CTs)
data <- data %>%
  mutate(ΔCT_Control = CT_Control - mean(CT_Control, na.rm = TRUE),
         ΔCT_Tratamiento = CT_Tratamiento - mean(CT_Tratamiento, na.rm = TRUE))

# Calcular ΔΔCT
data <- data %>%
  mutate(ΔΔCT = ΔCT_Tratamiento - ΔCT_Control)

# Calcular 2^-ΔΔCT
data <- data %>%
  mutate(`2^-ΔΔCT` = 2^(-ΔΔCT))

# Guardar los resultados en un archivo CSV
write.csv(data, "resultados_ddct.csv", row.names = FALSE)

# Visualizar los primeros resultados
head(data)
