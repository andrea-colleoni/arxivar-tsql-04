select
	--*
	COUNT(*),
	Name
from 
	[Production].[Product]
group by
	Name
/*
order by
	2
*/