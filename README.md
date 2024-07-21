**README: Heterogeneity and Non-Linearities in International Knowledge Spillovers**

**Title:** Heterogeneity and Non-Linearities in International Knowledge Spillovers: Evidence Using Novel Panel Estimators

**1. Description:**
This study examines how domestic and foreign R&D efforts influence total factor productivity (TFP) for a panel of 23 OECD countries over a period of 49 years. This study updates and expands upon existing literature by addressing the frequently disregarded unobserved common spillovers and shocks by utilizing advanced panel-time series techniques. It uses both dynamic and static common correlated effects (CCE) estimators using linear and non-linear specifications to understand underlying dynamics. The findings reveal statistically insignificant long-run effects of both domestic and foreign knowledge stocks on TFP. Additionally, the study explores heterogeneity in coefficients caused by a country's proximity to the knowledge frontier, finding that productivity returns diminish as countries approach the frontier. Furthermore, despite the theoretical motivations for non-linearities, empirical evidence for such effects is inconclusive.

**2. Dataset Structure**
The project contains multiple files organized as follows:

Clean R&D Data: Cleaned data on R&D expenditures.
Clean Domestic Knowledge Stocks: Domestic knowledge stocks for each country.
Clean Foreign Knowledge Stocks: Foreign knowledge stocks for each country.
TFP Data: Total factor productivity data for each country.
Transformation of Foreign Knowledge Stocks: Transformed foreign knowledge stocks for each country.
Compiled Data: Data compiled and arranged for analysis.

**3. Main Variables**
TFP: Business level total factor productivity.
R&D Data: Research and development expenditures.
Domestic Knowledge Stocks: Knowledge stocks generated domestically.
Foreign Knowledge Stocks: Knowledge stocks sourced from foreign entities.
Human Capital: Data from Barro and Lee (2013).

**4. Data Sources**

The main data sources used in this study are:

OECD ANBERD Database
Penn World Tables (Feenstra et al., 2015)
Barro and Lee (2013) Education Attainment Data

**5. Software Requirements**
To work with this data, the following software are required:

Stata
R

**6. Methodology**
The methodology involves testing the Coe and Helpman (1995) specification using foreign knowledge constructed using the Lichtenberg and van Pottelsberghe de la Potterie (1998) method. The study first applies the classic panel DOLS method and then checks if the results hold when using the CCE-ECM method to account for common shocks and spillovers that are unobserved, leading to cross-sectional dependency.

**7. Instructions for Reproducing Results**
To reproduce the results:

Use the clean data file.
Import the data into Stata.
Run the provided do-file in Stata to perform the analysis.
The code is inspired by the econometric routines of Eberhardt and Presbitero's (2015) JIE article, on Dr. Eberhardt's GitHub repository.

**8. Acknowledgments**
This study acknowledges the data sources and literature that have been fundamental in conducting this research. I also thank Professor Eberhardt for sharing his stata routines.
