library(tidyverse)

clean_data <- read_rds("clean_data.rds")

billboard_plot <- clean_data |>
  ggplot(aes(x = week, y = rank, group = track)) +
  geom_line(alpha = 0.25, color = "steelblue") +
  geom_vline(xintercept = 20, linetype = "dashed", color = "firebrick", alpha = 0.7) +
  geom_hline(yintercept = 50, linetype = "dashed", color = "firebrick", alpha = 0.7) +
  annotate(
    "text",
    x = 22,
    y = 75,
    label = "Recurrent rule zone:\nDropped if rank > 50\nafter week 20",
    hjust = 0,
    color = "firebrick",
    size = 3.5
  ) +
  scale_y_reverse() +
  theme_minimal() +
  labs(
    title = "Billboard Top 100 Song Trajectories (2000)",
    subtitle = "Songs falling below rank 50 after 20 weeks drop off the chart",
    x = "Week on Chart",
    y = "Chart Rank",
    caption = "Source: tidyr::billboard"
  )

ggsave("billboard.png", billboard_plot)
