### **Project Overview**

This project involved conducting a **Market Potential Analysis** for a coffee product retailer aiming to expand its store presence across various cities. The objective was to leverage sales, customer, and city data from existing stores to identify optimal locations for new store openings. Key factors analyzed included city sales performance, consumer demographics, estimated coffee consumption, and operational metrics like average rent and sales per customer.

### **Project Description**

Using SQL queries and data from relational databases, this analysis focused on answering critical business questions to support the retailer's decision-making process. The key tasks included:

1. **Top Cities for Sales**: Identified cities with the highest revenue and potential growth based on historical sales data.
2. **Customer Insights**: Segmented customers by city to determine the distribution of unique and active buyers.
3. **Rent vs. Sales Analysis**: Evaluated the average rent and sales per customer in each city to assess profitability.
4. **Coffee Consumer Estimates**: Projected the number of coffee consumers per city based on population data.
5. **Product Performance**: Analyzed the sales count and revenue for individual products to identify best-sellers in each city.
6. **Sales Trends**: Computed the monthly sales growth rate to understand seasonal trends and performance dynamics.
7. **Recommendations**: Formulated actionable insights to guide store expansion strategies, focusing on cities with high profitability, substantial customer bases, and favorable rent-to-sales ratios.

### **Schema Description**

The database schema used for the analysis consisted of the following key tables:

1. **City Table**:
   - **Columns**: `city_id`, `city_name`, `population`, `estimated_rent`, `estimated_coffee_consumers`
   - **Purpose**: Contains demographic and economic data for cities, including population, rent, and coffee consumption estimates.

2. **Customers Table**:
   - **Columns**: `customer_id`, `city_id`, `customer_name`, `email`
   - **Purpose**: Stores customer information, including the city they belong to.

3. **Sales Table**:
   - **Columns**: `sale_id`, `customer_id`, `product_id`, `sale_date`, `total`
   - **Purpose**: Tracks sales transactions, including the product sold, sale amount, and associated customer.

4. **Products Table**:
   - **Columns**: `product_id`, `product_name`, `category`, `price`
   - **Purpose**: Provides information on coffee products, including names and prices.

### **Key Insights**

- **City Recommendations**: Based on high revenue, large customer bases, and low rent-to-sales ratios, Pune, Delhi, and Jaipur were recommended as ideal cities for new store openings.
- **Customer Behavior**: Delhi exhibited the highest number of coffee consumers, while Pune showed the best profitability metrics.
- **Product Trends**: Top-selling products were identified by volume and revenue contribution, aiding inventory planning.
- **Seasonal Insights**: Monthly growth analysis revealed specific periods of heightened demand, critical for marketing campaigns.

This analysis provided actionable insights to the retailer, combining financial, customer, and operational metrics to ensure data-driven decision-making for store expansion.