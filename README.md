# state
This project gathers US state-level population data by race, sex, slave-status, 
and age from years 1790 to the present. The data is from the decennial 
census through NHGIS or ICPSR.

There is a source file for each decade in the code/ folder. At the top of each
file is documentation regarding the source of the data (NHGIS vs ICPSR) and any
missing data points (e.g., we might be missing sex data for slaves or granular
age ranges).

The first priority is getting race (and/or slave status) x sex data, but age
data is also of interest where possible.

The following table indicates the current progress on data for each
decade. The box is not checked off unless all appropriate data has been 
gathered such that it intersects with the previous variables (e.g., sex is 
not complete unless we have all race x sex data for all available races).

NOTE: Slavery was abolished in 1865

| year | race     | sex      | age      |
|------|----------|----------|----------|
| 1790 | &check;  |          |          |
| 1800 | &check;  |          |          |
| 1810 | &check;  |          |          |
| 1820 | &check;  | &check;  | &check;  |
| 1830 | &check;  | &check;  | &check;  |
| 1840 | &check;  | &check;  | &check;  |
| 1850 | &check;  | &check;  | &check;  |
| 1860 | &check;  | &check;  | &check;  |
| 1870 | &check;  |          |          |
| 1880 | &check;  | &check;  |          |
| 1890 | &check;  | &check;  |          |
| 1900 | &check;  | &check;  |          |
| 1910 | &check;  | &check;  | &check;  |
| 1920 | &check;  | &check;  | &check;  |
| 1930 | &check;  | &check;  | &check;  |
| 1940 | &check;  | &check;  | &check;  |
| 1950 | &check;  | &check;  |          |
| 1960 | &check;  | &check;  |          |
| 1970 | &check;  |          |          |
| 1980 | &check;  | &check;  | &check;  |
| 1990 | &check;  | &check;  | &check;  |
| 2000 | &check;  | &check;  | &check;  |
| 2010 |          |          |          |
| 2020 |          |          |          |