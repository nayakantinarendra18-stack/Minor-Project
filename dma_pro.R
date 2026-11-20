library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)
df <- read_excel("C:/5th_SEMESTER/DMA_lab/DMA_project/Responses.xlsx")
df <- df %>%
  mutate(across(where(is.character), str_trim))
df$Watch_Score <- case_when(
  df$`5. How often do you watch movies?` == "Rarely" ~ 1,
  df$`5. How often do you watch movies?` == "2–3 times a month" ~ 2,
  df$`5. How often do you watch movies?` == "Once a week" ~ 3,
  df$`5. How often do you watch movies?` == "2–3 times a week" ~ 4,
  df$`5. How often do you watch movies?` == "Almost every day" ~ 5,
  TRUE ~ NA_real_
)

p1 <- df %>%
  count(`4. Which is your favourite movie genre?`) %>%
  ggplot(aes(
    x = reorder(`4. Which is your favourite movie genre?`, n),
    y = n
  )) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(
    title = "Favourite Movie Genres",
    x = "Genre",
    y = "Number of Responses"
  ) +
  theme_minimal()

print(p1)
ggsave("plot1_genre_bar.png", p1, width = 8, height = 5)

industry <- df %>%
  filter(!is.na(`2. Which Indian movie industry do you prefer?`)) %>%
  count(`2. Which Indian movie industry do you prefer?`) %>%
  mutate(percentage = round(n / sum(n) * 100, 1),
         label = paste0(percentage, "%"))

p2 <- ggplot(industry, aes(
  x = "",
  y = n,
  fill = `2. Which Indian movie industry do you prefer?`
)) +
  geom_col() +
  geom_text(aes(label = label),
            position = position_stack(vjust = 0.5)) +
  coord_polar(theta = "y") +
  labs(
    title = "Preferred Indian Movie Industry",
    fill = "Industry"
  ) +
  theme_void()

print(p2)
ggsave("plot2_industry_pie.png", p2, width = 7, height = 6)

p3 <- ggplot(df, aes(x = Watch_Score)) +
  geom_histogram(
    binwidth = 1,
    fill = "orange",
    color = "black"
  ) +
  scale_x_continuous(
    breaks = 1:5,
    labels = c(
      "Rarely",
      "2-3 times/month",
      "Once/week",
      "2-3 times/week",
      "Almost daily"
    )
  ) +
  labs(
    title = "Movie Watching Frequency Distribution",
    x = "Watching Frequency",
    y = "Number of Responses"
  ) +
  theme_minimal()

print(p3)
ggsave("plot3_frequency_histogram.png", p3, width = 8, height = 5)

p4 <- ggplot(
  df,
  aes(
    x = `9. Do you prefer watching movies in theatres or on OTT platforms?`,
    y = Watch_Score
  )
) +
  geom_boxplot(fill = "lightblue") +
  labs(
    title = "Watching Frequency by Platform Preference",
    x = "Platform Preference",
    y = "Watching Frequency Score"
  ) +
  theme_minimal()
print(p4)
ggsave("plot4_platform_boxplot.png", p4, width = 8, height = 5)

p5 <- ggplot(
  df,
  aes(
    x = `4. Which is your favourite movie genre?`,
    fill = `5. How often do you watch movies?`
  )
) +
  geom_bar() +
  labs(
    title = "Favourite Genre by Watching Frequency",
    x = "Favourite Genre",
    y = "Number of Responses",
    fill = "Frequency"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1
  ))

print(p5)
ggsave("plot5_stacked_bar.png", p5, width = 9, height = 6)

heat_data <- df %>%
  filter(
    !is.na(`4. Which is your favourite movie genre?`),
    !is.na(`5. How often do you watch movies?`)
  ) %>%
  count(
    `4. Which is your favourite movie genre?`,
    `5. How often do you watch movies?`
  )

p6 <- ggplot(
  heat_data,
  aes(
    x = `5. How often do you watch movies?`,
    y = `4. Which is your favourite movie genre?`,
    fill = n
  )
) +
  geom_tile(color = "white") +
  geom_text(aes(label = n), size = 4) +
  scale_fill_gradient(
    low = "lightyellow",
    high = "darkred"
  ) +
  labs(
    title = "Heatmap: Genre vs Watching Frequency",
    x = "Watching Frequency",
    y = "Favourite Genre",
    fill = "Responses"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(
    angle = 30,
    hjust = 1
  ))

print(p6)
ggsave("plot6_heatmap.png", p6, width = 9, height = 6)

p7 <- df %>%
  filter(!is.na(`7. What is most important to you when choosing a movie?`)) %>%
  count(`7. What is most important to you when choosing a movie?`) %>%
  ggplot(aes(
    x = reorder(`7. What is most important to you when choosing a movie?`, n),
    y = n
  )) +
  geom_col(fill = "darkorange") +
  coord_flip() +
  labs(
    title = "Most Important Factor When Choosing a Movie",
    x = "Factor",
    y = "Number of Responses"
  ) +
  theme_minimal()
print(p7)
ggsave("plot7_selection_factor.png", p7, width = 8, height = 5)
platform_data <- df %>%
  filter(!is.na(`6. Where do you usually watch movies?`)) %>%
  separate_rows(
    `6. Where do you usually watch movies?`,
    sep = ",\\s*"
  ) %>%
  count(`6. Where do you usually watch movies?`, sort = TRUE)

p8 <- ggplot(
  platform_data,
  aes(
    x = reorder(`6. Where do you usually watch movies?`, n),
    y = n
  )
) +
  geom_col(fill = "purple") +
  coord_flip() +
  labs(
    title = "Most Popular Movie Watching Platforms",
    x = "Platform",
    y = "Number of Selections"
  ) +
  theme_minimal()

print(p8)
ggsave("plot8_platform_bar.png", p8, width = 8, height = 5)

success_data <- df %>%
  filter(!is.na(`14. What makes a movie successful according to you?`)) %>%
  separate_rows(
    `14. What makes a movie successful according to you?`,
    sep = ",\\s*"
  ) %>%
  count(`14. What makes a movie successful according to you?`,
        sort = TRUE)

p9 <- ggplot(
  success_data,
  aes(
    x = reorder(`14. What makes a movie successful according to you?`, n),
    y = n
  )
) +
  geom_col(fill = "seagreen") +
  coord_flip() +
  labs(
    title = "Factors That Make a Movie Successful",
    x = "Success Factor",
    y = "Number of Selections"
  ) +
  theme_minimal()

print(p9)
ggsave("plot9_success_factors.png", p9, width = 9, height = 6)

p10 <- df %>%
  filter(!is.na(`8. Which factor influences your decision to watch a movie the most?`)) %>%
  count(`8. Which factor influences your decision to watch a movie the most?`) %>%
  ggplot(aes(
    x = reorder(`8. Which factor influences your decision to watch a movie the most?`, n),
    y = n
  )) +
  geom_col(fill = "coral") +
  coord_flip() +
  labs(
    title = "Factors Influencing Movie Watching Decisions",
    x = "Influencing Factor",
    y = "Number of Responses"
  ) +
  theme_minimal()
print(p10)
ggsave("plot10_influencing_factors.png", p10, width = 8, height = 5)
cat("\nAll 10 plots generated successfully!\n")

