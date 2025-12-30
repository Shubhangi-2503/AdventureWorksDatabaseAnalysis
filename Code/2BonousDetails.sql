CREATE PROCEDURE [dbo].[usp_BonusDetails]  
  
AS  
BEGIN  
SELECT 
    e.BusinessEntityID,
    e.VacationHours AS AnnualLeaveTaken,
    sp.Bonus
FROM HumanResources.Employee e
JOIN Sales.SalesPerson sp
    ON e.BusinessEntityID = sp.BusinessEntityID
  
END  
