## ClimaTree Dashboard 💻
Shiny App Development for ClimaTree

This repository develops an interactive dashboard with maps of categorized tree sensitivity to drought across species ranges. Users will be able to efficiently view species and regions of interest and download the data required to recreate these maps.

The ClimaTree project is a Masters in Environmental Data Science capstone project at the Bren School of Environmental Science & Management (UCSB)

Faculty Advisor and Client: Dr. Joan Dudney

The team consists of [Rosemary Juarez](https://github.com/rosemaryjuarez), [Briana Barajas](https://github.com/briana-barajas), [Fletcher McConnell](https://github.com/fletcher-m) and [Vanessa Salgado](https://github.com/Vanessa-Salgado). 

Primary Contributor / Client: Dr. Joan Dudney

Other Contributors: Dr. Robert Heilmeyer, Dr. Frances C. Moore

## Drought Sensitivity in Water Availability

Forests cover approximately 30% of Earth's land surface, absorb more carbon than all other terrestrial ecosystems, and provide trillions of dollars’ worth of ecosystem services (Food and Agriculture Organization of the United Nations, 2005). However, forests are increasingly threatened by climate change-induced shifts in drought frequency and severity. As temperatures increase, it is critical to develop effective management strategies and identify techniques to prioritize management interventions. For example, developing cutting-edge models that can identify regions within a species’ range that are more vulnerable to drought can bolster restoration efforts, particularly for threatened species and species exposed to frequent droughts. 


## About the ClimaTree Dashboard 🗺️

To this end, this Dashboard assesses species-specific sensitivity to drought by quantifying variation in drought-sensitivity across tree species’ ranges. This localized information is critical  for land managers to develop targeted drought-adaptation strategies. By analyzing variation in drought-sensitivity for 26 tree species, we demonstrate that the impacts of drier conditions vary by species and across species’ ranges. Our findings suggest that effective management strategies will need to consider species-level variation in drought sensitivity to sustain ecosystem services under climate change.

We hope this dashboard can act as a tool for land management partners to identify regions where management interventions may be needed under climate change. We also created a data tab for the public.

## Data Info

**Ancillary data sets:** This workflow builds off the existing
	framework developed by our client Dr. Joan Dudney, and her colleagues Dr. Robert Heilmayr, and Dr. Frances C Moore. Original
	code scripts and available at the following repository:

	-   GitHub Repository -
    	[Treeconomics](https://github.com/rheilmayr/Treeconomics)

3.  **Raw data derivation:** Raw data was accessed from the following
	public sources:

	-   **Tree ring data** - [International Tree Ring Data
    	Bank](https://www.ncei.noaa.gov/products/paleoclimatology/tree-ring)

    	-   **Date of Access:** 2020-07-05
    	-   **Version:** ITRDB v.7.22

	-   **Climate data** - [Terra
    	Climate](https://www.climatologylab.org/terraclimate.html)
            	-   **Date of Access:** 2024-04-02
    	-   **Version:** Annual data (1958-present)
   	 
To recreate our data, please refer to our [Github page](https://github.com/ClimaTree/climatree-mapping-repo).


To access our data, please refer to our [Dryad webpage](https://datadryad.org/stash/dataset/doi:10.5061/dryad.m905qfv97)

To access our technical documentation, please refer to our [Bren Webpage](https://bren.ucsb.edu/projects/mapping-tree-species-drought-sensitivity-under-climate-change)

## Repository structure:
  
    |── shinydashboard/                                   # folder containing the code for App #3, a shinydashboard 
    |   └── global.R                                        # packages, objects, etc. used by ui & server
    |   └── ui.R                                            # user interface code
    |   └── server.R                                        # server code
    |   └── data/                                         # folder containing pre-processed data used by the app
    |     └── combined_pred.csv                       # processed data (.csv) (raw file in ~/raw_data, processing script in ~/R/data_processing_app3_shinydashboard.R)
    |   └── text/                                         # folder containing markdown files with styled text embedded in app
    |     └── approach.md                                   # welcome page approach info text      
    |     └── background.md                                 # welcome page background citation text
    |     └── dashboard-about.md                            # welcome page dashboard explanaition text
    |     └── mapping-tree-vulnerabilty.md                  # welcome page mapping tree text
    |     └── research.md                                   # welcome pagge research info text
    |   └── www/                                          # special directory in shiny for images, stylesheets, etc. 
    |      └── sass-style.css                               # generate css style sheet
    |      └── sass-style.scss                              # sass style sheet                         
