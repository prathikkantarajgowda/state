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

NOTE: Slavery was abolished in 1865, so lack of slave data past then is not 
an issue

| year | race     | slave    | sex      | age      |
|------|----------|----------|----------|----------|
| 1790 | &check;  | &check;  |          |          |
| 1800 | &check;  | &check;  |          |          |
| 1810 | &check;  | &check;  |          |          |
| 1820 | &check;  | &check;  | &check;  | &check;  |
| 1830 | &check;  | &check;  | &check;  | &check;  |
| 1840 | &check;  | &check;  | &check;  | &check;  |
| 1850 | &check;  | &check;  | &check;  | &check;  |
| 1860 | &check;  | &check;  | &check;  | &check;  |
| 1870 |          |          |          |          |
| 1880 |          |          |          |          |
| 1890 |          |          |          |          |
| 1900 |          |          |          |          |
| 1910 |          |          |          |          |
| 1920 |          |          |          |          |
| 1930 |          |          |          |          |
| 1940 |          |          |          |          |
| 1950 |          |          |          |          |
| 1960 |          |          |          |          |
| 1970 |          |          |          |          |
| 1980 |          |          |          |          |
| 1990 |          |          |          |          |
| 2000 |          |          |          |          |
| 2010 |          |          |          |          |
| 2020 |          |          |          |          |