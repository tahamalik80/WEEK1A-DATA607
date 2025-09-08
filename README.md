# Movie Ratings Assignment – SQL & R

## Overview

This project demonstrates collecting movie ratings, storing them in a normalized SQL database, and analyzing them using R. I chose six recent popular movies and asked five friends to rate the ones they saw on a scale from 1 to 5. The workflow includes data collection, database design, handling missing data, and statistical analysis.

---

## Steps

### 1. Data Collection

I selected six movies released in 2023:
- Oppenheimer
- Barbie
- Spider-Man: Across the Spider-Verse
- Guardians of the Galaxy Vol. 3
- Mission: Impossible – Dead Reckoning Part One
- John Wick: Chapter 4

Five friends (Alice, Bob, Carol, David, Eve) rated the movies they watched.

### 2. SQL Database Design

A normalized schema was used with three tables:
- `friends`: Stores friend names
- `movies`: Stores movie titles and years
- `ratings`: Stores the rating each friend gave for each movie

See [`sql_schema.sql`](./sql_schema.sql) for table creation and data insertion.

### 3. Loading Data Into R

The R Markdown file (`WEEK1A_movie_ratings_analysis.Rmd`) connects to MySQL, loads and joins the tables, and transforms the data into a matrix for analysis.

### 4. Handling Missing Data

Not every friend watched every movie, resulting in missing ratings. The R analysis quantifies missing data per friend and movie, and demonstrates approaches for handling these gaps.

### 5. Analysis and Visualization

The report calculates average ratings for each movie, standardizes ratings to account for individual scoring biases, and visualizes results with bar charts.

### 6. Reflection

The assignment highlights key data science skills: database normalization, SQL-R integration, missing data handling, and reproducible analysis.

---

## Files

- `sql_schema.sql`: SQL schema and data inserts for MySQL
- `WEEK1A_movie_ratings_analysis.Rmd`: Main R Markdown analysis
- `README.md`: This file

---

## How to Run

1. **Set up MySQL**  
   Run the commands in `sql_schema.sql` to create the database and tables, and insert the data.

2. **Configure R**  
   Open `WEEK1A_movie_ratings_analysis.Rmd` in RStudio.  
   Edit the database connection info (user, password) at the top of the file.

3. **Knit the Report**  
   Knit to HTML to see the analysis, matrix, missing data summaries, and plots.

---
