select gdp_growth.country,gdp_growth.growth_rate,literacy_rate.literacy_rate_all,literacy_rate.male_literacy_rate,
literacy_rate.female_literacy_rate,literacy_rate.gender_difference_percent_world,unemployement.unemployment_percentage,
youth.youth_percentage
from literacy_rate
full join gdp_growth
on gdp_growth.country = literacy_rate.country
full join youth
on youth.country = gdp_growth.country
full join unemployement
on unemployement.country = gdp_growth.country



--- countries with growth rate more than average growth rate

select avg(gdp_growth.growth_rate),country
from gdp_growth
where growth_rate > (select avg(growth_rate)
					from gdp_growth)
					group by country
					

----countries with highest growth rate

select growth_rate,country
from gdp_growth
order by growth_rate desc
limit 3

----countries with highest literacy rate with female and male literacy rate
 select country,literacy_rate_all,male_literacy_rate,female_literacy_rate
 from literacy_rate
order by literacy_rate_all desc
limit 3

---country with lowest literacy rate

select country, literacy_rate_all,female_literacy_rate,male_literacy_rate
from literacy_rate
order by literacy_rate_all 
limit 3

---country with maximum disparity between female and male literacy rate
 
select country,female_literacy_rate,male_literacy_rate,literacy_rate_all,(male_literacy_rate-female_literacy_rate)as gender_disparity
from literacy_rate
order by (male_literacy_rate-female_literacy_rate) desc

---country with maximum female literacy rate

select country,female_literacy_rate
from literacy_rate
order by female_literacy_rate desc


----country with maximum male literacy rate

select country, male_literacy_rate
from literacy_rate
order by male_literacy_rate desc

---country with maximum literacy rate
select country,literacy_rate_all
from literacy_rate
order by literacy_rate_all desc

---avg literacy rate of country

select avg(literacy_rate_all) as avg_literacy_rate
from literacy_rate

---country with literacy rate higher than average literacy rate
select country,avg(literacy_rate_all) as avg_literacy_rate
from literacy_rate
where literacy_rate_all > (select avg(literacy_rate_all) from literacy_rate)
group by country
order by avg(literacy_rate_all) desc

--- average feamle literacy rate

select avg(female_literacy_rate) as avg_female_literacy_rate
from literacy_rate

--average male literacy rate

select avg(male_literacy_rate) as avg_male_literacy_rate
from literacy_rate

---coutries with female literacy rate more than avg female literacy rate
 select avg(female_literacy_rate) as avg_female_literacy_rate,country
from literacy_rate
where female_literacy_rate >(select avg(female_literacy_rate) as avg_female_literacy_rate
from literacy_rate)
group by country

--countries with male literacy rate more than avg male literacy rate
 select avg(male_literacy_rate) as avg_male_literacy_rate,country
from literacy_rate
where male_literacy_rate > (select avg(male_literacy_rate) as avg_male_literacy_rate
from literacy_rate)
group by country

--how unemployement rate is effected by growth rate

select gdp_growth.growth_rate,gdp_growth.country,unemployement.unemployment_percentage
from gdp_growth
join unemployement
on unemployement.country = gdp_growth.country
order by unemployement.unemployment_percentage desc

--how unemployement rate is affected by literacy_rate
select literacy_rate.country,literacy_rate.literacy_rate_all,unemployement.unemployment_percentage
from literacy_rate
join unemployement
on unemployement.country = literacy_rate.country
order by unemployement.unemployment_percentage desc

---country with maximum unemployement rate

select country,unemployment_percentage
from unemployement
order by unemployment_percentage desc
--- average unemployment
select avg(unemployment_percentage)
from unemployement
-- youth population and unemployment percentage relationship
select youth.country,unemployement.unemployment_percentage,youth.youth_percentage
from youth
join unemployement
on unemployement.country = youth.country
order by youth.youth_percentage desc

--youth percentage with their literacy rate
select youth.country, literacy_rate.literacy_rate_all,youth.youth_percentage
from youth
join literacy_rate
on literacy_rate.country = youth.country
order by youth.youth_percentage desc

--- how growth rate is effected by literacy rate
select gdp_growth.country,gdp_growth.growth_rate,literacy_rate.literacy_rate_all
from literacy_rate
join gdp_growth
on gdp_growth.country = literacy_rate.country
order by literacy_rate.literacy_rate_all asc

--- how growth rate effected by youth population
select gdp_growth.country,gdp_growth.growth_rate,youth.youth_percentage
from gdp_growth
join youth
on youth.country = gdp_growth.country
order by youth.youth_percentage desc


					
