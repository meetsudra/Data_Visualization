----1

select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(new_deaths)/SUM(new_cases)*100 as DeathPercentage
from mydatabase..CovidDeaths$
where continent is not null
order by 1,2

-- 2. 

select continent, SUM(cast(new_deaths as int)) as Totaldeathcounts
from mydatabase..CovidDeaths$
where continent is not null
Group by continent 
order by Totaldeathcounts desc

--3

Select Location, Population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From mydatabase..CovidDeaths$
Group by Location, Population
order by PercentPopulationInfected desc

-- 4.

Select Location, Population,date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
From mydatabase..CovidDeaths$
--Where location like '%states%'
Group by Location, Population, date
order by PercentPopulationInfected desc


--5

Select Location, date, population, total_cases, total_deaths
From mydatabase..CovidDeaths$
--Where location like '%states%'
where continent is not null 
order by 1,2