-- Creating indices takes the below query from roughly 290 sec to about 5 sec.

select servicecodedescription, servicetypecodedescription, count(*) as num_requests 
from dc311.requests 
group by servicecodedescription, servicetypecodedescription
order by num_requests desc;