### Approach

The approach to mapping tree species sensitivity builds upon Dr. Joan Dudney and Dr. Robert Heilmayr's on-going project to understand how trees respond to climate change.


**Tree sensitivity** quantifies the relationship between a species' growth and changes in climate. The primary climate variable used for predicted sensitivity is *climatic water deficit (CWD)*, which is related to  water availability. Negative values indicate higher sensitivity and are commonly seen in species living in water-limited areas. Conversely, positive sensitivity indicates a species is benefiting from changes in CWD.

To estimate tree-level sensitivity, we used a site-level model that predicted Ring Width Index (RWI) as a function of Climatic Water Deficit (CWD) and Potential Evapotranspiration (PET). Then we aggregated the coefficients of CWD and PET and ran a second regression with historic average CWD and PET as predictor variables. This created a single estimate of sensitivity to CWD across a species’ range.

The end product of estimating sensitivity is “combined_predictions.csv,” a data frame output for each species with columns representing latitude, longitudes, sensitivity, and species code. The values for the sensitivity column were used to fill each pixel with the raster for the tree sensitivity map.

We developed a reproducible workflow to measure and map how reactive trees are to changes in terms of historic climatic water deficit and energy availability. To view our reproducible workflow, visit our [github page](https://github.com/ClimaTree).


### Data

The data sources for this sensitivity mapping 
1. The International Tree-Ring Data Bank is the world's largest public archive of tree ring data. The ITRDB includes raw ring width, wood density, isotope measurements, and site growth index chronologies from more than 5,000 sites on six continents.

2. TerraClimate: TerraClimateerra is a dataset of monthly climate and climatic water balance for global terrestrial surfaces from 1958-2019 by the Climatology Lab

3. Data access can be found on [Dryad](https://datadryad.org/stash/dataset/doi:10.5061/dryad.m905qfv97)