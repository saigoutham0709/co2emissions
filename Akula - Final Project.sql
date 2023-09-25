SELECT * FROM ait580.`2005-19_local_authority_co2_emissions`;
select Country, avg(`Territorial emissions`) from
`2005-19_local_authority_co2_emissions` group by Country;
select `CO2 Sector`, avg(`Territorial emissions`) from
 `2005-19_local_authority_co2_emissions` group by `CO2 Sector`;
select `LA CO2 Sub-sector`, avg(`Territorial emissions`), `CO2 Sector`
from `2005-19_local_authority_co2_emissions` group by `LA CO2 Sub-sector`, `CO2 Sector`;
