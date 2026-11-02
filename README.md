
# 🚕 NYC Yellow Taxi Analytics | Python, SQL & Power BI

## 📌 Project Overview

This project analyses **New York City Yellow Taxi trip data from January 2024** to uncover patterns in passenger demand, trip characteristics, and recorded financial activity.

Using **Python, MySQL, and Power BI**, I developed an end-to-end data analytics workflow covering data cleaning, exploratory data analysis (EDA), SQL-based business analysis, data validation, and interactive dashboard development.

The analysis began with approximately **2.96 million trip records**. After applying data quality filters, **2,867,591 trips** were retained for analysis.

The goal is to transform large-scale transportation data into actionable insights that can support operational planning, demand analysis, and data-driven decision-making.

---

## 🎯 Business Objectives

This project addresses five key business questions:

1. What are the busiest taxi pickup hours and boroughs in New York City?
2. How does taxi demand differ between weekdays and weekends?
3. How do trip distance and pickup time relate to journey duration?
4. How are recorded trip charges distributed across boroughs and payment methods?
5. How do average recorded charges compare between JFK Airport, LaGuardia Airport, and other Queens pickup locations?

---

## 🛠️ Tools & Technologies

| Technology | Application |
|------------|-------------|
| Python | Data cleaning, preprocessing, exploratory analysis, and feature engineering |
| Pandas & NumPy | Data manipulation, filtering, and aggregation |
| MySQL | Data validation, analytical queries, and business reporting |
| Power BI | Interactive dashboards, DAX measures, and KPI visualisation |
| Jupyter Notebook | Reproducible analytical workflow |
| VS Code | Development and project organisation |
| Git & GitHub | Version control and project documentation |

---

## 📂 Data Source

**Provider:** New York City Taxi and Limousine Commission (NYC TLC)

**Dataset:** January 2024 Yellow Taxi Trip Records

**Official Source:**
https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

The dataset contains:

- Pickup and drop-off timestamps
- Pickup and drop-off location IDs
- Trip distance
- Passenger count
- Fare and total amounts
- Payment method
- Additional trip charges and fees

The Taxi Zone Lookup dataset was used to identify pickup and drop-off boroughs.

**Data Availability:** The complete raw and cleaned datasets are excluded from this repository because of their file sizes. The analytical dataset can be recreated by downloading the source files and executing the Python notebook.

---

## 🔄 Project Methodology

The project follows an end-to-end analytical workflow:

**Data Collection → Data Cleaning → Feature Engineering → MySQL Analysis → Power BI Dashboard → Business Insights**

### 1. Data Collection

- Downloaded January 2024 Yellow Taxi trip records from NYC TLC.
- Obtained the official Taxi Zone Lookup dataset.
- Loaded the source files into Python using Pandas.
- Examined data types, missing values, statistical distributions, and data quality.

### 2. Data Cleaning and Preparation

- Restricted the analysis to trips with pickup timestamps in January 2024.
- Removed records with invalid trip durations and distances.
- Excluded records with non-positive fare or total amounts.
- Joined Taxi Zone Lookup information to identify pickup and drop-off boroughs.
- Created analytical features including:
  - Pickup hour
  - Day of week
  - Weekday/weekend classification
  - Trip duration in minutes
  - Trip distance categories
- Prepared a cleaned, **19-column reporting dataset containing 2,867,591 trips**.

### 3. SQL Analysis

Imported the cleaned reporting dataset into MySQL and performed analytical queries to investigate:

- Hourly taxi pickup demand
- Borough-level trip distribution
- Weekday versus weekend travel patterns
- Average trip distance and duration
- Recorded trip charges by borough
- Payment method distributions
- Airport pickup comparisons

SQL aggregations and grouped calculations were used to generate business metrics and validate the analytical results.

### 4. Power BI Dashboard Development

Developed a **three-page interactive Power BI report**.

**Page 1 — Executive Overview**
- Total trips
- Total recorded charges
- Average recorded charge per trip
- Average trip distance and duration
- Hourly pickup demand
- Borough-level demand

**Page 2 — Demand Analysis**
- Weekday versus weekend demand
- Pickup patterns by hour
- Average trip duration
- Trip distance distribution
- Distance-category comparisons

**Page 3 — Financial Analysis**
- Recorded charges by borough
- Payment method comparisons
- Average charges by pickup location
- JFK and LaGuardia airport comparisons

### 5. Data Validation and Interpretation

- Cross-checked key trip counts and financial aggregates between analytical outputs.
- Verified that the Python notebook could reproduce the 19-column reporting dataset.
- Reviewed analytical metrics for consistency.
- Documented assumptions and limitations to ensure responsible interpretation.

**Important:** Recorded trip charges represent amounts reported in the TLC dataset and should not automatically be interpreted as payments successfully collected.

---

## 📊 Key Findings & Business Insights

The following findings are based on **2,867,591 cleaned NYC Yellow Taxi trips from January 2024**.

### 1. Overall Trip Activity

| KPI | Result |
|-----|--------|
| Total Trips | 2,867,591 |
| Total Recorded Charges | $78.39 Million |
| Average Recorded Charge per Trip | $27.34 |
| Average Trip Distance | 3.29 Miles |
| Average Trip Duration | 14.96 Minutes |

**Business Insight:**

These metrics establish a baseline for understanding Yellow Taxi activity, average trip characteristics, and recorded charges during January 2024.

They provide a foundation for comparing operational patterns across different pickup times and locations.

### 2. Pickup Demand by Borough

| Borough | Pickup Trips | Share of Trips |
|---------|--------------|----------------|
| Manhattan | 2,571,717 | 89.68% |
| Queens | 257,500 | 8.98% |
| Brooklyn | 22,240 | 0.78% |

**Business Insight:**

Manhattan accounted for approximately **89.68% of analysed Yellow Taxi pickups**, demonstrating a strong concentration of recorded demand.

This suggests that Manhattan is a particularly important area for evaluating taxi availability and observed pickup patterns.

The results describe Yellow Taxi activity in the analysed dataset and do not represent all transportation demand across New York City.

### 3. Peak Pickup Hours

- **Busiest pickup hour:** 6 PM, with 206,134 trips.
- **Lowest pickup hour:** 4 AM, with 15,252 trips.
- **Weekday peak demand:** Approximately 6 PM.
- **Weekend peak demand:** Approximately 4 PM.

The weekday and weekend comparisons are based on average trips per day.

**Business Insight:**

Pickup demand varies throughout the day, with different patterns on weekdays and weekends.

These findings may help transportation operators identify periods when driver availability, scheduling, and demand monitoring deserve closer attention.

### 4. Trip Distance and Duration

- **Average trip distance:** 3.29 miles.
- **Average trip duration:** 14.96 minutes.
- Trips beginning at **4 PM** had the highest average duration, approximately **16.90 minutes**.
- Trips beginning at **5 AM** had the highest average distance, approximately **6.23 miles**.
- Average trip duration increased across the five trip-distance categories.

**Business Insight:**

Trip characteristics vary according to pickup time and travel distance.

The longer average trip duration observed at 4 PM may reflect differences in traffic conditions, trip composition, or travel patterns. However, the dataset alone does not establish the cause.

Understanding these variations can support more informed analysis of trip efficiency and transportation demand.

### 5. Financial Analysis

The financial analysis investigates:

- Distribution of recorded charges across pickup boroughs.
- Differences in recorded charges by payment method.
- Average recorded charges for JFK Airport, LaGuardia Airport, and other Queens pickup locations.
- Variations in financial metrics across trip categories.

**Business Insight:**

Examining recorded charges alongside trip locations and payment methods helps identify differences in trip financial characteristics.

These comparisons provide descriptive insights rather than direct measurements of profitability or successfully collected revenue.

---

## 📈 Power BI Dashboard

The Power BI report contains three interactive pages covering overall taxi activity, demand patterns, and financial analysis.

### 1. Executive Overview

Provides a high-level summary of key performance indicators, pickup activity, and borough-level demand.

![NYC Taxi Executive Overview](Images/01_executive_overview.png)

### 2. Demand Analysis

Explores hourly pickup patterns, weekday versus weekend demand, trip duration, and distance characteristics.

![NYC Taxi Demand Analysis](Images/02_demand_analysis.png)

### 3. Financial Analysis

Examines recorded charges, payment methods, borough comparisons, and airport pickup characteristics.

![NYC Taxi Financial Analysis](Images/03_financial_analysis.png)

---

## 📁 Project Structure

```text
NYC-Taxi-Analytics/
│
├── Notebook/
│   └── 01_data_exploration.ipynb
│
├── SQL/
│   ├── 01_database_setup.sql
│   ├── 02_data_import.sql
│   └── 03_business_analysis.sql
│
├── Dashboard/
│   └── NYC_Taxi_Analytics_Dashboard.pbix
│
├── Images/
│   ├── 01_executive_overview.png
│   ├── 02_demand_analysis.png
│   └── 03_financial_analysis.png
│
├── Data/
│   └── [Local datasets excluded from GitHub]
│
├── .gitignore
├── requirements.txt
└── README.md
```

**Note:** Raw and cleaned datasets are stored locally and excluded from GitHub because of their file sizes.

---

## 🚀 How to Reproduce the Analysis

### Prerequisites

- Python 3.10 or later
- VS Code or Jupyter Notebook
- MySQL 8.0
- Power BI Desktop

### 1. Clone the Repository

```bash
git clone https://github.com/vishalakula09/NYC-Taxi-Analytics.git
cd NYC-Taxi-Analytics
```

### 2. Download the Dataset

Download the January 2024 Yellow Taxi trip records and Taxi Zone Lookup CSV from the official NYC Taxi and Limousine Commission website:

https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

Create a `Data/` folder in the project directory if it does not already exist.

Place the following files inside it:

```text
Data/
├── yellow_tripdata_2024-01.parquet
└── taxi_zone_lookup.csv
```

### 3. Set Up the Python Environment

Create a virtual environment:

```bash
python -m venv .venv
```

Activate the environment on Windows PowerShell:

```powershell
.\.venv\Scripts\Activate.ps1
```

Install the Python dependencies:

```bash
pip install -r requirements.txt
```

### 4. Run the Python Notebook

Open:

```text
Notebook/01_data_exploration.ipynb
```

Select the Python virtual environment as the notebook kernel.

Run the notebook from top to bottom, updating local dataset paths if required.

The notebook cleans, transforms, and enriches the source records before exporting the reporting dataset:

```text
Data/nyc_taxi_cleaned_jan2024.csv
```

### 5. Perform SQL Analysis

1. Open MySQL Workbench.
2. Execute the database setup script.
3. Review the CSV import script and update local file paths if required.
4. Import the cleaned reporting dataset.
5. Execute the business analysis queries.

SQL scripts are available in:

```text
SQL/
├── 01_database_setup.sql
├── 02_data_import.sql
└── 03_business_analysis.sql
```

### 6. Open the Power BI Dashboard

Open the Power BI project file:

```text
Dashboard/NYC_Taxi_Analytics_Dashboard.pbix
```

If the report cannot locate the cleaned CSV, update its data source to your local copy:

```text
Data/nyc_taxi_cleaned_jan2024.csv
```

Refresh the dataset to load the data into the dashboard.

---

## ⚠️ Project Limitations

- The analysis covers January 2024 only and does not establish longer-term or seasonal trends.
- Data quality filters exclude some original records, so results represent the cleaned dataset.
- The analysis is limited to NYC Yellow Taxi records and does not represent all transportation services.
- Pickup demand represents recorded trips rather than unmet passenger demand.
- Trip durations may be influenced by traffic conditions, routes, trip composition, and other factors not directly evaluated.
- Recorded total amounts should not be interpreted as confirmed collected revenue or profit.
- Borough and airport comparisons are descriptive and should not be interpreted as causal relationships.

---

## 💡 Skills Demonstrated

This project demonstrates practical capabilities in:

- End-to-end data analytics
- Large-scale data cleaning and preprocessing
- Exploratory data analysis
- Feature engineering
- SQL querying and aggregation
- Data validation
- Business intelligence and KPI reporting
- Power BI dashboard development
- Analytical interpretation and communication
- GitHub project documentation

---

## 👨‍💻 Author

**Vishal Akula**

Master of Data Science | Deakin University

Data Analyst | Business Intelligence | Python | SQL | Power BI

- [LinkedIn](https://www.linkedin.com/in/vishal-akula-6a80a8273/)
- [GitHub](https://github.com/vishalakula09)
