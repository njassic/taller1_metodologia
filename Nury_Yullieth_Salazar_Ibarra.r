install.packages("gganimate")
install.packages("ggplot2")
install.packages("gifski")
install.packages("transformr")

library(gganimate)
library(ggplot2)
library(gifski)
library(transformr)

# Crear datos
df <- data.frame(
  x = rep(seq(0, 10, length.out = 100), times = 2),
  y = c(sin(seq(0, 10, length.out = 100)), cos(seq(0, 10, length.out = 100))),
  grupo = rep(c("Seno", "Coseno"), each = 100),
  frame = rep(1:100, times = 2)
)

# Crear gráfico animado
grafico <- ggplot(df, aes(x = x, y = y, color = grupo)) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "Movimiento de Puntos en una Onda", x = "Tiempo", y = "Valor") +
  transition_reveal(frame)

# Guardar animación
animate(grafico, renderer = gifski_renderer("grafico_animado.gif"))
