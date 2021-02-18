select 
	COUNT(*)
	,SafetyStockLevel
from
	[Production].[Product]
group by
	SafetyStockLevel

select TOP 1 *
from [Production].[Product]
where SafetyStockLevel = 1000
order by Name

-- window functions
select * from 
(
select 
	ROW_NUMBER() OVER (order by ProductID) num,
	RANK() OVER (partition by SafetyStockLevel order by Name) rank,
	*
from [Production].[Product]
) q
where rank = 1
