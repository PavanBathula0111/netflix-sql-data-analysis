# 🎬 Netflix Data Analysis using MySQL

<p align="center">
  <img src="images/netflix-banner.jpg" alt="Netflix Banner" width="900">
</p>

## 📌 Project Overview

This project explores the **Netflix Movies and TV Shows** dataset using **MySQL 8.4**. It answers 15 real-world business questions using SQL and demonstrates practical data analysis techniques such as data cleaning, aggregation, window functions, JSON processing, Common Table Expressions (CTEs), and date manipulation.

---

## 📂 Dataset

- **Source:** Netflix Movies and TV Shows Dataset
- **Records:** 8,807
- **Database:** MySQL 8.4
- **Tool:** MySQL Workbench

### Dataset Columns

- Show ID
- Type
- Title
- Director
- Cast
- Country
- Date Added
- Release Year
- Rating
- Duration
- Genre (`listed_in`)
- Description

---

## 🛠️ Technologies Used

- MySQL 8.4
- MySQL Workbench
- SQL

---

## 📚 SQL Concepts Demonstrated

- SELECT Statements
- WHERE Clause
- GROUP BY
- ORDER BY
- Aggregate Functions
- CASE Statements
- Common Table Expressions (CTEs)
- Window Functions (`RANK()`)
- JSON_TABLE()
- String Functions
- Date Functions
- Data Cleaning
- Filtering
- Pattern Matching (`LIKE`)
- CAST()
- TRIM()

---

## 📈 Business Problems Solved

1. Count the number of Movies vs TV Shows.
2. Find the most common rating for Movies and TV Shows.
3. List all Movies released in a specific year.
4. Find the top 5 countries with the most Netflix content.
5. Identify the longest Movie.
6. Find content added to Netflix in the last 5 years.
7. Find all Movies and TV Shows directed by **Rajiv Chilaka**.
8. List all TV Shows with more than 5 seasons.
9. Count the number of content items in each genre.
10. Find the top 5 years with the highest percentage of Indian content released on Netflix.
11. List all Documentary Movies.
12. Find all content without a director.
13. Find how many Movies actor **Salman Khan** appeared in during the last 10 years.
14. Find the top 10 actors who appeared in the highest number of Indian Netflix Movies.
15. Categorize content as **Good** or **Bad** based on keywords in the description.

---

## 📁 Repository Structure

```
netflix-sql-data-analysis/
│
├── images/
│   └── netflix-banner.jpg
│
├── NETFLIX.sql
├── netflix_titles.csv
├── README.md
└── screenshots/
    ├── query1.png
    ├── query2.png
    └── ...
```

---

## 📷 Project Preview

<p align="center">
  <img src="images/netflix-banner.jpg" width="900">
</p>

---

## 💡 Key Learnings

During this project, I practiced:

- Writing complex SQL queries
- Solving business problems using SQL
- Working with real-world datasets
- Handling comma-separated values using `JSON_TABLE()`
- Using Window Functions
- Building Common Table Expressions (CTEs)
- Data cleaning and transformation
- Date manipulation in MySQL
- Converting PostgreSQL queries into MySQL equivalents

---

## 🚀 How to Run

1. Clone this repository.

```bash
git clone https://github.com/<your-username>/netflix-sql-data-analysis.git
```

2. Open MySQL Workbench.

3. Create a database.

```sql
CREATE DATABASE Netflix;
USE Netflix;
```

4. Create the table using the schema in `NETFLIX.sql`.

5. Import `netflix_titles.csv`.

6. Run the SQL queries from `NETFLIX.sql`.

---

## 📌 Sample Output

Example query:

```sql
SELECT type, COUNT(*)
FROM netflix_schema
GROUP BY type;
```

---

## ⭐ Future Improvements

- Create interactive Power BI Dashboard
- Build Tableau Dashboard
- Visualize insights using Python (Matplotlib & Seaborn)
- Perform Exploratory Data Analysis (EDA)
- Build recommendation analytics

---

## 👨‍💻 Author

**Pavan Kumar Bathula**

- GitHub: https://github.com/<your-username>
- LinkedIn: https://linkedin.com/in/<your-linkedin>

---

### ⭐ If you found this project useful, consider giving it a star!
