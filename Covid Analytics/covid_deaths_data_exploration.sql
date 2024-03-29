SELECT location, date, total_cases, new_cases, total_deaths, population
 FROM `covid-19-vac-access-project.covid19deaths.cov19_2` 
 
 WHERE continent is not null

 ORDER BY 1,2 
 LIMIT 100



 --looking at total cases vs total deaths in the United States

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
 FROM `covid-19-vac-access-project.covid19deaths.cov19_2` 
 
WHERE location = 'United States'

-ORDER BY date 



 --looking at countries with the highest infection rate compared to population

 SELECT location, population, (total_cases/population)*100 as InfectedPercentage
  FROM `covid-19-vac-access-project.covid19deaths.cov19_2` 
  ORDER BY InfectedPercentage desc

  --50% doesn't seem right...Reason being total cases sums all cases up until that point. If you want to mirror reality a little better, using new_cases will give you a better estimate of infection rate



--Looking at total deaths, percentage of population lost
  SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount, MAX((cast(total_deaths as int)/population))*100 as PopPercentageDead
   FROM `covid-19-vac-access-project.covid19deaths.cov19_2` 
   WHERE continent is not null
   GROUP BY location
   ORDER BY PopPercentageDead desc




--Looking at total cases vs population
SELECT location, date, population, total_cases, (total_cases/population)*100 as InfectedPercentage
 FROM `covid-19-vac-access-project.covid19deaths.cov19_2`
 WHERE continent is not null
 ORDER BY InfectedPercentage desc




--Looking at Countries with Highest Infection Rate compared to Population
SELECT location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
  FROM `covid-19-vac-access-project.covid19deaths.cov19_2`
  WHERE location = 'United States'
  GROUP BY location, population
  order by PercentPopulationInfected desc


--Let's look at continental data
Select location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM `covid-19-vac-access-project.covid19deaths.cov19_2`
WHERE continent is null
GROUP BY location
order by TotalDeathCount desc


--note that income types are included. Low income deaths being so low causes intuition to suggest low-income data is underreported
