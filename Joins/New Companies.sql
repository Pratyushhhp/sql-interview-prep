select c.company_code as company_code, c.founder as foundername, 
count(distinct lm.lead_manager_code) as total_lead_managers, 
count(distinct sm.senior_manager_code) as total_senior_managers, 
count(distinct m.manager_code) as total_managers, 
count(distinct e.employee_code) as total_employee
from company c 
left join lead_manager lm on c.company_code = lm.company_code
left join senior_manager sm on c.company_code = sm.company_code
left join manager m on c.company_code = m.company_code
left join employee e on c.company_code = e.company_code
group by c.company_code, c.founder