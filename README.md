# CloudScale-SaaS-Consumption-to-Cash-Analytics_personal_project
A personal project to practice data and technical skills. Project is focused on CloudScale SaaS consumption to cash. 
Tech Stack
- PostgreSQL
- Python
- Google Sheets
- Google Gemini (AI)
Python
- Created synthetic data
- transferred data from python to PostgreSQL
PostgreSQL
- Query data
- executive pipeline summary
- risk usage vs commitment
- sales pipeline
Sheets (super simple usage)
- Data viz


Data Architecture
The project utilizes a relational star schema in PostgreSQL:
Accounts Table: Customer metadata (Segments, Regions, Commitments).
Daily Usage Table: Time-series compute logs (DBUs consumed).
Sales Pipeline: Forward-looking CRM data for weighted forecasting.

Key Skills Demonstrated
1. Empirical Financial Modeling (SQL)
I developed a Pacing Model that calculates the "Burn Rate" of every customer.
Logic: Compares cumulative usage against the contractual "Committed Spend."
Risk Identification: Created SQL Views to flag "Silent Churn" (accounts with <25% utilization) and "Upsell Candidates" (>90% utilization).

2. Usage Trend Analysis (Python)
Using Python, I analyzed daily usage fluctuations to identify platform-specific trends (AWS vs. Azure vs. GCP).
Visualization: Built a Quadrant Analysis scatter plot to visually segment the customer base for the VP of Sales.
Data Integrity: Implemented error handling and type-casting to manage messy CSV-to-DB transitions.

4. Forecasting & Strategic Recommendations
By joining the Sales Pipeline with current Burn Rates, I provided a risk-adjusted forecast for Q1 revenue.
Weighted Pipeline: Calculated $Expected Value \times Probability$ to determine if new bookings cover the identified churn risk in Enterprise accounts.
