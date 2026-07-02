# 🎬 Netflix Data Analysis using MySQL

<p align="center">
  <img src="netflix.jpeg" width="900">
</p>


An end-to-end data analytics project that combines **MySQL** for data cleaning and transformation with **Tableau** for building a fully interactive dashboard.

The project demonstrates SQL querying, data preprocessing, view creation, and interactive data visualization using the Netflix Movies & TV Shows dataset.

---

## 📌 Project Overview

This project analyzes Netflix content to uncover insights about:

- Movies vs TV Shows
- Rating distribution
- Top countries producing Netflix content
- Most popular genres
- Top Indian actors
- Content added over the years
- Good vs Bad content classification based on descriptions

The dashboard is fully interactive, allowing users to filter all visualizations by selecting any chart.

---

## 🛠️ Tech Stack

- **Database:** MySQL
- **Visualization:** Tableau Desktop
- **Language:** SQL
- **Dataset:** Netflix Movies & TV Shows

---

## 📁 Repository Structure

```
📦 netflix-sql-data-analysis
│
├── README.md
├── NETFLIX.sql                 # SQL analysis queries
├── netflix_views.sql           # SQL views used in Tableau
├── Netflix_Dashboard.twbx      # Interactive Tableau dashboard
├── dashboard.png               # Dashboard preview
└── netflix_titles.csv          # Dataset
```

---

# 📊 Interactive Tableau Dashboard

## Dashboard Features

- Interactive cross-filtering across all charts
- Dashboard actions using related SQL views
- Netflix-inspired dashboard theme
- Dynamic tooltips
- SQL-powered data transformations
- Relationships using `show_id`
- Fully interactive visual analytics


# 📈 Dashboard Visualizations

- 🎬 Movies vs TV Shows
- ⭐ Rating Distribution
- 🌍 Top 5 Countries
- 🎭 Top Genres
- 🎬 Top Indian Actors
- 📅 Content Added by Year
- 🎞️ Good vs Bad Content Category

---

# 🗄️ SQL Features

- Data Cleaning
- Data Transformation
- SQL Views
- Aggregate Functions
- CASE Statements
- Common Table Expressions (CTEs)
- JSON_TABLE()
- String Manipulation
- Date Functions
- GROUP BY
- ORDER BY
- Subqueries

---

# 📂 SQL Views Used

The Tableau dashboard is powered using custom SQL views:

- `vw_movies_vs_tv`
- `vw_rating_distribution`
- `vw_top_countries`
- `vw_top_genres`
- `vw_top_indian_actors`
- `vw_content_by_year`
- `vw_content_category`

All views are related using **Show ID**, enabling interactive dashboard filtering.

---

# 🚀 Key Insights

- Movies significantly outnumber TV Shows.
- TV-MA is the most common content rating.
- The United States contributes the largest share of Netflix content.
- Dramas and International Movies dominate the catalog.
- Indian actors frequently appear in Netflix's Indian content.
- Netflix experienced rapid content growth after 2015.

---

# ▶️ How to Run

1. Import the Netflix dataset into MySQL.
2. Execute `NETFLIX.sql`.
3. Execute `netflix_views.sql`.
4. Open `Netflix_Dashboard.twbx` in Tableau Desktop.
5. Interact with the dashboard using chart selections and filters.

---

# ⭐ Highlights

- End-to-end analytics project
- SQL + Tableau integration
- Interactive dashboard actions
- Cross-filtering using related data sources
- Portfolio-ready business dashboard

---

## 👨‍💻 Author

**Pavan Bathula**

If you found this project helpful, consider giving it a ⭐ on GitHub!
