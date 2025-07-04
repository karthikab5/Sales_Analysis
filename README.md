# Sales_Analysis
# Sales Analysis Dashboard using Power BI and MySQL

This project demonstrates a comprehensive sales analysis solution using a combination of MySQL for data processing and Power BI for interactive data visualization. It reflects real-world practices in data modeling, business intelligence, and dashboard design, suitable for decision-makers, analysts, and business users.

---

## Project Description

The goal of this project is to analyze and visualize retail sales data to uncover business insights and performance trends. A normalized relational database schema is created in MySQL, and SQL queries are used to build a consolidated reporting table. This data is then visualized in Power BI using a clean, well-designed interactive dashboard.

The dashboard provides metrics and visuals to answer key business questions such as:
- Who are the top customers by sales?
- Which products are the most sold?
- What is the profit classification across categories?
- Which customer segments are most profitable?
- Are there customers who have not placed any orders?

---

## Repository Contents

- **Sales_Analysis_Dashboard.pbix**  
  The main Power BI Desktop file containing the full interactive dashboard, KPIs, filters, and visuals.

- **sales_analysis_query.sql**  
  The SQL script used to create the normalized data schema, join the tables into a unified `sales_table`, and generate business insights.

- **README.md**  
  Project documentation explaining the workflow, features, and how to use the files.

---

## Tools and Technologies

- **MySQL**: Used for creating normalized tables, managing relational data, and writing analytical queries.
- **Power BI Desktop**: Used to develop a responsive, interactive dashboard with dynamic visuals and KPI cards.
- **SQL**: Used for data extraction, transformation, joining, and aggregating business metrics.
- **DAX**: Utilized within Power BI for calculated columns and measures where required.

---

## Data Modeling

The database is modeled using a normalized structure with the following tables:

- `customers`: Contains customer ID, name, segment, and region.
- `orders`: Contains order ID, order and shipping dates, customer ID, and region.
- `order_details`: Contains customer ID, product ID, quantity, sales, and profit.
- `products`: Contains product ID, category, sub-category, and product name.

All tables are joined using appropriate keys to create a single, consolidated reporting table called `sales_table`. This table serves as the primary source for Power BI visuals.

---

## Key Analytical Features

### SQL Logic
- **Profit Classification**  
  Products are categorized as "Profit", "Loss", or "No Profit No Loss" based on their profitability using conditional logic.

- **Top Customers by Sales**  
  Identifies the top five customers based on the total sales amount.

- **Customers with the Most Orders**  
  Returns the customer who placed the maximum number of orders.

- **Inactive Customers**  
  Lists customers who have never placed an order, which may be useful for marketing or retention strategies.

- **Average Profit by Segment**  
  Calculates the average profit across different customer segments.

- **Top Products by Units Sold**  
  Identifies the five most sold products based on quantity.

All queries are written in clean, readable SQL and can be reused or adapted for other datasets.

---

## Power BI Dashboard Features

The Power BI report includes the following visuals and functionality:

- KPI Cards:
  - Total Sales
  - Total Profit
  - Total Orders
  - Average Order Value
  - Profit Margin

- Visual Charts:
  - Donut chart displaying profit classification
  - Bar charts showing top customers and product sales
  - Line chart for monthly sales trends
  - Data table for regional sales by category

- Filters and Segments:
  - Slicers for customer segment, region, and product category
  - Responsive visuals that update dynamically with user input

The layout follows a clean, user-friendly design with clear headings, minimal color clutter, and consistent formatting.

---

## How to Use This Project

1. **Load SQL Data**  
   Execute the script in `sales_analysis_query.sql` on your MySQL server. It will create the necessary tables and populate the unified reporting table (`sales_table`).

2. **Open Power BI Report**  
   Open `Sales_Analysis_Dashboard.pbix` in Power BI Desktop.

3. **Connect Data Source**  
   Update the data source connection settings in Power BI to point to your local or hosted MySQL database. Use the appropriate credentials.

4. **Refresh the Report**  
   Click "Refresh" in Power BI to load the data and view the updated dashboard.

---

## Author

**Karthika Karthika**  
Mississauga, Ontario, Canada  
Email: karthikab214@gmail.com  

---

## License

This project is open for educational and professional showcase purposes. If you use or modify this work, please credit the original author.

---

## Summary

This end-to-end project demonstrates essential skills for a data analyst or BI developer, including:
- Data modeling and ETL in SQL
- KPI development and business insight extraction
- Interactive dashboard creation in Power BI

It provides a complete view of the analytics process, from raw data to insight-driven storytelling.
