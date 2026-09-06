# Hotel-booking-demand-analytics
Data analysis of hotel booking demand, featuring data cleaning models, core metric tracking, and Power-Bi visualization

---

## Hotel Booking Demand & Revenue Analytics

An end-to-end business intelligence and data analytics project exploring hotel reservation patterns, seasonal pricing dynamics, and guest cancellation drivers using historical booking demand data.

##  Project Overview
This project simulates a real-world revenue management and hospitality analytics workflow. The objective is to transform raw booking data into actionable business intelligence through a multi-page interactive Power BI dashboard, identifying key drivers of revenue leakage and booking behaviors.
* **Dataset Source:** The analysis is based on the [Hotel Booking Demand Dataset on Kaggle] (https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand)
---

##  Tech Stack & Tools
* **Data Modeling & Transformation:** Power Query / SQL
* **Calculations & Metrics:** DAX (Data Analysis Expressions)
* **Visualization:** Power BI 
* **Version Control:** Git & GitHub

---

##  SQL Data Transformation & Cleaning
Prior to dashboard development, data was inspected and prepared using SQL to ensure integrity and performance. Key operations included:
* Handling missing values and standardizing categorical fields.
* Validating core metrics (such as cancellation ratios and lead time groupings) at the database level.
* *You can check the complete SQL scripts in the `sql/` folder of this repository.*

---

##  Key Performance Indicators (KPIs) & Data Model
* **Total Bookings:** Comprehensive volume tracking across various segments.
* **Cancellation Rate %:** Monitoring cancellation risk to address revenue leakage.
* **Average Daily Rate (ADR):** Tracking pricing fluctuations and seasonal yield.
* **Custom Bins:** Grouping `lead_time` intervals (30-day buckets) to analyze correlation with cancellation behavior.
* **Chronological Sorting:** Implemented custom month-number sorting logic to resolve default alphabetical sorting issues in time-series visuals.

---

##  Key Business Insights
1. **Seasonality & Pricing Trends:** Booking volumes heavily peak during the summer months (led by August), directly aligning with higher Average Daily Rates (ADR) that gradually taper off toward the winter season.
2. **Lead Time vs. Cancellation Risk:** A clear positive correlation exists between long lead times and cancellation rates—reservations made months in advance carry a significantly higher probability of cancellation compared to last-minute bookings.
3. **Market Segmentation:** Identifies primary high-value booking channels and source markets, offering strategic visibility for targeted revenue management campaigns.

---

##  Dashboard Structure
* **Page 1: Overview** — Overview of core KPIs, monthly seasonality, pricing trends, and geographic breakdown.
* **Page 2: Customer & Market Insights** — Deep-dive analysis focusing on guest behavior, segment performance, and lead-time/cancellation risk correlation.


