# AdventureWorks-Data-Engineering-Project
This project demonstrates a complete Azure-based data engineering pipeline using the Adventure Works dataset (sourced from Kaggle). It showcases how to ingest, transform, and store data in a structured lakehouse architecture using Azure services. <br>
Dataset link : https://www.kaggle.com/datasets/ukveteran/adventure-works

**Architecture**

![1735069395363](https://github.com/user-attachments/assets/4871c7b4-ea03-4f24-b1eb-d69dbd554d10)


🚀 What This Project Covers:<br>

✅ Built a dynamic ADF pipeline to load data directly from GitHub into ADLS (Bronze layer).<br>
✅ Applied transformations and data cleaning using Azure Databricks.<br>
✅ Loaded cleaned and processed data into the Silver layer of ADLS for further analytics.<br>


🛠️ Technologies Used <br>
✅ Azure Data Factory (ADF): Fetched data from the AdventureWorks dataset hosted on GitHub and loaded it into the ADLS.<br>
✅ Azure Databricks & PySpark: Processed and transformed data, storing the results in the Silver layer.<br>
✅ Azure Synapse Analytics: Further transformed data and saved it as tables in the Gold layer of the data lake.<br>
✅ Azure Data Lake Storage: Served as the centralized storage repository for all data layers.<br>
✅ Power BI: Created dashboards to visualize key insights and trends.<br>


## Project Steps
________________________________________________________________________________________________
*1. Data Ingestion Using Azure Data Factory (ADF)<br>*

A Web Activity retrieves a predefined list of CSV file names from GitHub, which is then passed into a ForEach activity to iterate over each file. Within the loop, a Copy Data activity dynamically loads each CSV from GitHub and writes it to the bronze container in Azure Data Lake Storage.The pipeline uses parameters and expressions to construct dynamic file paths and dataset references, making it reusable for different files or environments.

![image](https://github.com/user-attachments/assets/cd62e4aa-bbf4-4a3a-bd2e-d56e0bbb23d9) <br>

*2. Data Transformation process in Azure Databricks using PySpark* <br> 

Ingested raw CSV files from the ADLS bronze container into Spark DataFrames.Performed data transformations such as created additional fields like Year, Month from OrderDate, removed nulls, dropped duplicates etc. Saved transformed and structured data to the ADLS silver container in Parquet format for optimized querying and downstream use. Merged datasets such as Sales and Products using join() to perform some analysis and visualisation. <br>

✅ Created interactive visualizations using line graphs directly in Databricks notebooks to analyze Monthly/Yearly order trends as shown below <br>

  <table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/711af48c-b7ca-4f8f-a690-5eb518860080" width="800"/></td>
    <td><img src="https://github.com/user-attachments/assets/1aaa2a1f-beb3-4db4-8da7-a371c4bc644a" width="800"/></td>
  </tr>
</table>   
 <br>

✅ Created Pie chart to visualize total quantity of each product sold.<br>

  <table>
  <tr>
     <td><img src="https://github.com/user-attachments/assets/8263de4d-08aa-4af4-9a08-7af9c0446cc0" width="800"/></td>
    <td><img src="https://github.com/user-attachments/assets/f8e01809-bac4-4ce3-93d5-824dadcb83d2" width="800"/></td>
  </tr>
</table>  <br>

*3. Data Serving and Reporting with Azure Synapse & Power BI* <br> 
Once data is transformed and stored in the Silver layer of Azure Data Lake Storage Gen2, the following steps are performed in Azure Synapse for efficient reporting: <br>
1. Create Views using OPENROWSET as shown below. Use Synapse Serverless SQL pool to create views over Parquet files in the Silver layer. <br>

![image](https://github.com/user-attachments/assets/11b9c348-6d26-4d70-a02c-de14444b971b)

2. Build External Tables on Views as shown below. Define external tables on top of these views to act as the Gold layer. <br>
![image](https://github.com/user-attachments/assets/7d4f0bc9-0d14-47d9-bfb8-fb66efca5e0f)

3. Model and Join for Reporting. Eg: join  sales and products tables to generate total sales of each product external table. <br>
![image](https://github.com/user-attachments/assets/e0abadad-617b-4cb1-b317-ccb4bc55dab8)

4. Connect Power BI to  Synapse tables using Serverless SQL endpoint. <br>
![image](https://github.com/user-attachments/assets/6b799924-f661-4fd1-ae33-2d3650ed2ca2)



