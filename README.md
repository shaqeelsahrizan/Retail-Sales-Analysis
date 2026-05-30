# Retail-Sales-Analysis
### Breakdown of Retail Sales through Power BI and SQL
### Tools: SQL Server · Power BI
### Dataset: Retail Sales Dataset — Kaggle
### Skills demonstrated: CTEs, aggregations, CASE segmentation, date functions, business interpretation
## Project Overview
### This project analyses a retail sales dataset to answer five core business questions around revenue, product performance, customer segmentation, seasonal trends, and pricing behaviour. Each analysis concludes with a data-backed business recommendation.
## Questions Findings
1. Which customers generate the most revenue? Top 10 customers contribute ~4.4% of total revenue — a well-distributed base
2. Which product categories lead in revenue vs volume? Electronics leads in revenue; Clothing leads in units sold; Beauty underperforms on frequency
3. Which customer segments are underperforming? Under 25 and 60+ age groups generate lower total revenue than mid-age segments
4. What are the peak revenue months? Revenue peaks in May, October, and December; November and January underperform
5. Does basket size affect average spend? Spend is evenly distributed across basket sizes — multi-buy promotions could increase transaction value
## Key SQL Techniques Used
- CTEs (WITH clauses) for multi-step revenue concentration analysis
- CASE WHEN for custom age group segmentation
- Window aggregations with GROUP BY across multiple dimensions
- FORMAT() for month-based time series grouping
- TOP N filtering for customer ranking
## Strategic Recommendations Summary
- Loyalty programs — Increase spend from high-value customers through personalised targeting
- Beauty category — Introduce lower-cost, high-frequency products and bundle promotions
- Demographic targeting — Tailor product range for Under 25 (trend-driven, affordable) and 60+ (practical, accessible)
- Seasonal campaigns — Launch staggered promotions ahead of Black Friday and New Year to capture holiday demand
- Multi-buy incentives — Introduce "Buy 2 Get 1" style promotions to increase average basket size
## Power BI Dashboard
### The SQL findings are extended into an interactive Power BI dashboard covering:
1. Monthly revenue trends with peak period annotations
2. Category performance (revenue vs units sold vs avg price)
3. Customer segment breakdown by age group and gender
4. Top 10 customer revenue contribution
## About
### Built as a portfolio project to demonstrate practical SQL analysis and business communication skills.
Connect with me on LinkedIn
