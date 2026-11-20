# Movie Watching Habits and Audience Preferences Analysis

## 1. Project Overview

This is a Minor Project developed using **R Programming** as part of Data Mining and Analytics (DMA).

The main purpose of this project is to analyze people's movie-watching habits, favourite movie genres, preferred Indian movie industries, watching platforms, and factors that influence their movie choices.

The project uses survey response data stored in an Excel file. R programming is used to clean, process, analyze, and visualize the collected data using different graphs and charts.

## 2. Objectives

The main objectives of this project are:

- To identify people's favourite movie genres.
- To analyze preferred Indian movie industries.
- To understand how frequently people watch movies.
- To compare movie-watching frequency with platform preferences.
- To identify the factors that influence people's movie choices.
- To understand which platforms people commonly use to watch movies.
- To analyze the factors that make a movie successful.

## 3. Technologies Used

| Technology | Purpose |
|---|---|
| R Programming | Data analysis and processing |
| RStudio | Writing and executing R code |
| Excel | Storing survey responses |
| ggplot2 | Creating graphs and charts |
| dplyr | Data manipulation |
| tidyr | Data cleaning and transformation |
| stringr | Removing unwanted spaces |
| readxl | Reading Excel files |

## 4. Dataset Description

The dataset is collected through a survey about movie-watching habits and audience preferences.

The dataset contains responses related to:

- Favourite movie genre.
- Preferred Indian movie industry.
- Movie-watching frequency.
- Movie-watching platforms.
- Important factors when choosing a movie.
- Factors influencing movie-watching decisions.
- Factors that make a movie successful.

**Dataset File:** `Responses.xlsx`

## 5. Data Cleaning and Preprocessing

Before performing the analysis, the dataset is cleaned using R.

The following operations are performed:

1. Importing the Excel dataset using the `readxl` package.
2. Removing unnecessary spaces from character columns using `str_trim()`.
3. Converting movie-watching frequency into numerical scores using `case_when()`.
4. Handling missing values during analysis.
5. Separating multiple selections into individual rows using `separate_rows()`.

### Movie Watching Frequency Score

| Watching Frequency | Score |
|---|---:|
| Rarely | 1 |
| 2–3 times a month | 2 |
| Once a week | 3 |
| 2–3 times a week | 4 |
| Almost every day | 5 |

## 6. Data Visualization and Analysis

A total of **10 visualizations** are created to understand the survey results.

### Plot 1: Favourite Movie Genres
A bar chart showing the number of responses for each favourite movie genre.

### Plot 2: Preferred Indian Movie Industry
A pie chart representing the percentage of people who prefer different Indian movie industries.

### Plot 3: Movie Watching Frequency Distribution
A histogram showing how frequently people watch movies.

### Plot 4: Watching Frequency by Platform Preference
A box plot comparing movie-watching frequency scores with theatre and OTT preferences.

### Plot 5: Favourite Genre by Watching Frequency
A stacked bar chart showing the relationship between favourite movie genres and watching frequency.

### Plot 6: Heatmap – Genre vs Watching Frequency
A heatmap representing the relationship between movie genres and watching frequency.

### Plot 7: Most Important Factor When Choosing a Movie
A bar chart showing the factors people consider when selecting a movie.

### Plot 8: Most Popular Movie Watching Platforms
A bar chart showing the most commonly selected movie-watching platforms.

### Plot 9: Factors That Make a Movie Successful
A bar chart showing the factors people believe contribute to a movie's success.

### Plot 10: Factors Influencing Movie Watching Decisions
A bar chart representing the factors that influence people's decisions to watch a movie.

## 7. Project Folder Structure

```text
DMA_Project/
│
├── Responses.xlsx
│
├── plot1_genre_bar.png
├── plot2_industry_pie.png
├── plot3_frequency_histogram.png
├── plot4_platform_boxplot.png
├── plot5_stacked_bar.png
├── plot6_heatmap.png
├── plot7_selection_factor.png
├── plot8_platform_bar.png
├── plot9_success_factors.png
├── plot10_influencing_factors.png
│
└── README.md
```

## 8. Required R Packages

Install the following packages before running the project:

```r
install.packages("readxl")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("tidyr")
install.packages("stringr")
```

Load the required libraries:

```r
library(readxl)
library(ggplot2)
library(dplyr)
library(tidyr)
library(stringr)
```

## 9. How to Run the Project

Follow these steps to execute the project:

1. Install R and RStudio on your computer.
2. Download or copy the project folder.
3. Place the `Responses.xlsx` file in the project folder.
4. Install all the required R packages.
5. Open the R script in RStudio.
6. Make sure the Excel file path in the code is correct.
7. Run the complete R script.
8. View the generated graphs in the RStudio plot window.
9. The generated PNG images will be saved in the working directory.

## 10. Expected Output

After successfully executing the R script, the project generates 10 different visualizations.

These visualizations help us understand:

- Audience movie preferences.
- Popular movie genres and industries.
- Movie-watching frequency.
- Theatre and OTT platform preferences.
- Factors influencing movie selection.
- Popular movie-watching platforms.
- Audience opinions about movie success.

## 11. Conclusion

This project provides an understanding of audience preferences and movie-watching habits through survey data analysis.

Using R programming, the collected survey responses are cleaned, processed, and represented through different visualizations.

The 10 graphs help identify patterns and relationships in audience preferences, movie genres, watching frequency, and platform choices.

Overall, this project demonstrates how data analysis and visualization can be used to understand real-world survey data and extract meaningful insights.

---

**Project Domain:** Data Mining and Analytics (DMA)

**Project Type:** Minor Project

**Programming Language:** R
