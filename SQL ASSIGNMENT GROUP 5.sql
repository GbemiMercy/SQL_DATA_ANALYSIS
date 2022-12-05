CREATE DATABASE PROJECT
------GROUP 5


SELECT *
FROM CovidDeaths

---Which country has the highest covid cases

SELECT location, Sum(total_cases)
FROM CovidDeaths
WHERE continent is not NULL
GROUP BY location
ORDER BY Sum(total_cases) DESC



---Which date has the highest covid cases recorded
SELECT date, total_cases
FROM CovidDeaths
WHERE total_cases = (SELECT MAX(total_cases) FROM CovidDeaths)



---Which date has the highest death count
SELECT date, total_deaths
FROM CovidDeaths
WHERE total_deaths = (SELECT MAX(total_deaths) FROM CovidDeaths)



---What percentage of people got covid in Asia

SELECT location, continent, total_cases, new_cases, population,
(SELECT SUM(new_cases) FROM CovidDeaths where continent = 'Asia') * 100/population as 'percentage of people who got covid in Asia'
From CovidDeaths
where continent = 'Asia'



---Percentage of people who got covid

SELECT location, continent, total_cases, new_cases, population,
(SELECT SUM(new_cases) FROM CovidDeaths where location = 'wORLD') * 100/population as 'percentage of people who got covid'
From CovidDeaths
where location = 'World'



--- Death percentage for covid in Asia
SELECT location, continent, total_cases, new_deaths, population,
(SELECT SUM(total_deaths) FROM CovidDeaths where continent = 'Asia' and total_deaths IS NOT NULL) * 100/population as 'percentage of people who died in Asia'
From CovidDeaths
where continent = 'Asia'



---Death percentage for covid
SELECT location, continent, total_deaths, new_deaths, population,
(SELECT SUM(new_deaths) FROM CovidDeaths where location = 'wORLD') * 100/population as 'death percentage for covid'
From CovidDeaths
where location = 'World'


---GLOBAL NUMBERS
SELECT SUM(DISTINCT(POPULATION))
From CovidDeaths


---Countries with Highest Death Count per Population

SELECT location, continent, population,
(SELECT MAX(SUM(new_deaths)) FROM CovidDeaths) /population as 'death percentage for covid'
From CovidDeaths
where continent is not null

---Continents with Highest Death Count per Population
SELECT location, continent, population,
(SELECT MAX(SUM(new_deaths)) FROM CovidDeaths)/population as 'death percentage for covid'
From CovidDeaths
where continent is not null