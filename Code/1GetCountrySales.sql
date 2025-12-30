CREATE PROCEDURE usp_GetCountrySales

AS
BEGIN
WITH Country AS (
    SELECT TOP 1
        st.CountryRegionCode
    FROM Sales.SalesOrderHeader soh
    JOIN Sales.SalesTerritory st
        ON soh.TerritoryID = st.TerritoryID
    GROUP BY st.CountryRegionCode
    ORDER BY SUM(soh.SubTotal) DESC
)
SELECT 
    st.Name AS Region,
   ROUND(SUM(soh.SubTotal), 2)  AS RegionalSales
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st 
    ON soh.TerritoryID = st.TerritoryID
WHERE st.CountryRegionCode = (SELECT CountryRegionCode FROM Country)
GROUP BY st.Name
ORDER BY RegionalSales DESC;
END