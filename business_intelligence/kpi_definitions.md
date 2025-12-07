# KPI Definitions

This document defines the Key Performance Indicators (KPIs) for the Loyalty System.

---

## Customer KPIs
- **Total Customers**: COUNT of rows in CUSTOMERS.
- **Active Customers**: Customers with purchases in the last 30 days.
- **Top 5 Customers by Points**: Highest total_points values.

## Reward KPIs
- **Most Redeemed Reward**: Reward with highest redemption count.
- **Total Points Redeemed**: SUM(points_deducted).
- **Average Points per Redemption**: AVG(points_deducted).

## Purchase KPIs
- **Monthly Sales**: SUM(total_amount) grouped by month.
- **Weekend vs Weekday Sales Ratio**: Weekend sales ÷ Weekday sales.
- **Average Purchase Value**: AVG(total_amount).

## Audit KPIs
- **Denied vs Allowed Ratio**: COUNT(DENIED) ÷ COUNT(ALLOWED).
- **Operations by Type**: Distribution of INSERT, UPDATE, DELETE attempts.
- **Holiday Restriction Effectiveness**: Number of DENIED attempts on holiday dates.
