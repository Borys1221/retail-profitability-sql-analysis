\# Retail Sales \& Profitability Analysis (SQL Project)



\## 1. Business Context



A U.S.-based retail company operates nationwide across three main product categories: Technology, Office Supplies, and Furniture. 



Despite strong revenue generation, management has identified concerns regarding uneven profitability across categories and regions. 



The objective of this analysis is to identify key profitability drivers, detect loss-making products and regions, and evaluate the impact of discount strategy on overall margin performance.



---



\## 2. Dataset Description



The dataset contains 9,994 retail transactions, including detailed information about product category, product name, sales revenue, profit, discount rate, region, customer segment, and order date.



This structure enables multi-dimensional profitability analysis across product, regional, and pricing dimensions.



---



\## 3. Executive Summary



The company generates $2.3M in revenue with an overall profit margin of 12.47%.



While the business is profitable, profitability is unevenly distributed across categories and regions. 



The primary driver of margin erosion is aggressive discounting, particularly in the Furniture category and Central region.



---



\## 4. Category Analysis



Technology and Office Supplies are strong profit drivers with margins above 17%.



Furniture generates comparable revenue but operates at a critically low margin of 2.49%, significantly reducing overall profitability.



This indicates structural pricing or cost inefficiencies within the Furniture category.



---



\## 5. Discount Impact Analysis



Profitability sharply declines once discount levels exceed 20%.



Orders discounted between 20–40% already generate negative margins, while discounts above 40% result in severe losses (average margin -108.9%).



This confirms that the current discount strategy is structurally destroying value and requires pricing policy revision.



---



\## 6. Regional Performance Analysis



The Central region demonstrates the weakest profitability (7.92% margin).



Further analysis shows that Central has the highest average discount (24%) and the largest share of high-discount orders (20%).



This directly explains its margin underperformance compared to West (14.94%) and East (13.48%).



---



\## 7. Product-Level Analysis (Window Functions)



Window functions (RANK() with PARTITION BY Category) were used to identify the top and bottom performing products within each category.



High-performing products (e.g., Canon copiers, premium chairs) contribute significantly to total profit.



However, several high-value items (3D printers, conference tables) generate substantial losses when heavily discounted.



Large and premium products appear highly sensitive to aggressive discount strategies.



---



\## 8. Business Recommendations



1\. Implement a discount cap policy (avoid discounts above 20% unless strategically justified).

2\. Review pricing and cost structure in the Furniture category.

3\. Audit discount governance in the Central region.

4\. Introduce profitability monitoring dashboards segmented by discount level.



---



\## 9. AI-Assisted Workflow



AI tools were used to accelerate SQL query drafting and logic structuring.



All AI-generated outputs were manually validated and refined to ensure correctness and business relevance.



AI was particularly helpful in:

\- Structuring window functions

\- Optimizing aggregation queries

\- Stress-testing business hypotheses

