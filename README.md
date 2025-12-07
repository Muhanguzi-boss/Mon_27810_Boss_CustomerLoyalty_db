# Customer Loyalty and Reward Tracker
**Student:** MUHANGUZI BOSS
**ID:** 27810  
**Group:** Monday (Group A)  
**Course:** Database Development with PL/SQL (INSY 8311)  
**Institution:** Adventist University of Central Africa (AUCA)  
**Lecturer:** Eric Maniraguha  

---

## 📌 Project Overview
The Customer Loyalty and Reward Tracker is a PL/SQL-based system designed to help businesses improve customer retention by automating the process of awarding and redeeming loyalty points. Purchases are recorded, points are calculated using PL/SQL functions and procedures, and customer records are updated in real time through triggers. The system also provides analytical insights through PL/SQL cursors and BI dashboards.

---

## 🎯 Objectives
- Automate loyalty point assignment using PL/SQL triggers and stored procedures.  
- Enable customers to redeem accumulated points for rewards.  
- Maintain accurate and real-time customer loyalty data.  
- Provide analytical reports to help businesses understand customer activity.  

---

## 📂 Repository Structure

├── scripts/                # SQL scripts for schema, procedures, triggers
│   ├── schema_tables.sql
│   ├── phase_v_tables_data.sql
│   ├── phase_vi_procedures.sql
│   ├── phase_vi_functions.sql
│   ├── phase_vi_triggers.sql
│   ├── phase_vii_audit_log.sql
│   └── test_cases.sql
│
├── queries/                # Organized query sets
│   ├── data_retrieval.sql
│   ├── analytics_queries.sql
│   └── audit_queries.sql
│
├── documentation/          # Project documentation
│   ├── data_dictionary.md
│   ├── architecture.md
│   └── design_decisions.md
│
├── business_intelligence/  # BI requirements and dashboards
│   ├── bi_requirements.md
│   ├── dashboards.md
│   └── kpi_definitions.md
│
├── diagrams/               # ER & BPMN diagrams
│   ├── er_diagram.png
│   ├── bpmn_diagram.png
│   └── architecture.png
│
├── screenshots/            # Evidence of tests and results
│   ├── phase_vi/
│   ├── phase_vii/
│   └── bi/
│
└── README.md               # Project overview

---

## 📑 Documentation Links
- [Phase II – Business Process Modeling (Word Doc)](database/documentation/Phase_II_Business_Process_Modeling_Documentation_Generated(1).docx)  
- [Phase III – Logical Database Design (Word Doc)](database/documentation/Phase_III_Logical_Database_Design.docx)  

   ## 📊 Business Intelligence
The system integrates **Business Intelligence (BI)** features to provide managers with actionable insights into customer behavior, reward usage, and operational compliance.

### Dashboards
- **Customer Dashboard:** Top customers by points, points earned vs redeemed, customer growth trends.  
- **Rewards Dashboard:** Most redeemed rewards, total points redeemed per reward, redemption trends by month.  
- **Purchases Dashboard:** Monthly sales trend, weekend vs weekday purchases, average purchase value per customer.  
- **Audit Dashboard:** Allowed vs denied operations, operations by type (INSERT/UPDATE/DELETE), audit timeline.  

### KPIs
- **Customer KPIs:** Total customers, active customers (last 30 days), top 5 customers by points.  
- **Reward KPIs:** Most redeemed reward, total points redeemed, average points per redemption.  
- **Purchase KPIs:** Monthly sales, weekend vs weekday sales ratio, average purchase value.  
- **Audit KPIs:** Denied vs allowed ratio, operations by type, holiday restriction effectiveness.  

### Reports
- Monthly sales and purchase trends.  
- Reward redemption summaries.  
- Audit log summaries for compliance monitoring.  

---

## ✅ Results
- Successfully implemented **Phases I–VII** with schema, procedures, functions, triggers, auditing, and BI queries.  
- Verified restrictions:  
  - Weekday operations → **DENIED**  
  - Weekend operations → **ALLOWED**  
  - Holiday operations → **DENIED**  
- Audit log captures all DML attempts with user, action type, status, and reason.  
- BI queries and dashboards provide clear insights for managers and decision‑makers.  

---

## 🏆 Conclusion
This project demonstrates how PL/SQL can be used to build a **secure, auditable, and analytics‑driven loyalty system**. It integrates:  
- Robust database design (ER + BPMN diagrams).  
- Business rules enforced via triggers.  
- Error handling and auditing for accountability.  
- BI dashboards and KPIs for strategic insights.  





