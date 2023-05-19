WITH YearlyData AS (
	 SELECT*,
		DATENAME(month, created_at) AS Ticket_Month,
		DATENAME(year, created_at) AS Ticket_Year
	 FROM Zendesk_Tickets zt 
	 JOIN GH_Org gho ON  zt.organization_id = gho.zendesk_organization_id
	 JOIN Salesforce_Account sfa ON gho.salesforce_account_id = sfa.account_id
	 WHERE (created_at > DATEADD(year,-1,GETDATE())) --AND Month(created_at) <=12
	 )

---- Question 1-----
SELECT
	COUNT(ticket_id) AS Tickets_Count,
	Ticket_Month,
	Ticket_Year,
	segment
FROM YearlyData 
GROUP BY Ticket_Month, segment, Ticket_Year
ORDER BY Ticket_Year

--- Question 2 -------
SELECT channel,
	  COUNT(ticket_id) AS Total_Tickets,
	  COUNT(ticket_id) * 100 / (SELECT COUNT(*) FROM YearlyData) AS ticket_percentage
	 FROM YearlyData
	 GROUP BY channel


---- Question 3 -----

	 SELECT TOP 10
		--created_at, 
		zt.topic AS Topics,
		COUNT (zt.ticket_id) AS Tickets
				--COUNT(zt.ticket_id),
		--DATENAME(month, created_at) AS Ticket_Month,
		--DATENAME(year, created_at) AS Ticket_Year
	 FROM Zendesk_Tickets zt 
	 JOIN GH_Org gho ON  zt.organization_id = gho.zendesk_organization_id
	 JOIN Salesforce_Account sfa ON gho.salesforce_account_id = sfa.account_id
	 WHERE (created_at > DATEADD(month,-6,GETDATE())) --AND Month(created_at) <=12
	 GROUP BY zt.topic
	 ORDER BY Tickets DESC;
-------------
