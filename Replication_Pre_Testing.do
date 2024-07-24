****************************************************************************************************************
*                                              Shreesh Chary
* Heterogeneity and Non-Linearities in International Knowledge Spillovers: Evidence Using Novel Panel Estimators
****************************************************************************************************************
*			   	                           Created: 20th July 2024				
*			   	                                    Revised: 					
****************************************************************************************************************
*  	 		                   School of Economics, University of Nottingham,			
*		                 University Park, Nottingham NG7 2RD, United Kingdom			
*			                           email: shreeshchary@gmail.com; lexsc28@nottingham.ac.uk				
****************************************************************************************************************
**Importing data
import excel "C:\Users\shree\OneDrive\Desktop\MSc Dissertation\Data Dissertation Alternate.xlsx",//
 sheet("Clean") firstrow

**Changing working directory
cd "C:\Users\shree\OneDrive\Desktop\MSc Dissertation"

**Panel Settings
encode Country, gen(c)
xtset c Year, yearly
drop if Year==2020

****************************************************************************************************************

*Descriptive Graphs
xtline ch
xtline lp
xtline avg
xtline dom
xtline f
xtline hc
//Data appears non-stationary

**Cross sectional dependency
xtcd lsfch
xtcd lsflp
xtcd avg
xtcd lsd
xtcd lf
xtcd lh
xtcd lto
xtcd mlsflp

****************************************************************************************************************

**Evaluating unit roots using maxlags=8
xtcips lsfch, maxlags(8) bglags(8) q
xtcips lsflp, maxlags(8) bglags(8) q
xtcips lsd, maxlags(8) bglags(8) q
xtcips lf, maxlags(8) bglags(8) q
xtcips lh, maxlags(8) bglags(8) q
xtcips lto, maxlags(8) bglags(8) q
xtcips mlsflp, maxlags(8) bglags(8) q
xtcips mlsfch, maxlags(8) bglags(8) q

//evaluating I(1)
xtcips d.lsfch, maxlags(8) bglags(8) q
xtcips d.lsflp, maxlags(8) bglags(8) q
xtcips d.lsd, maxlags(8) bglags(8) q
xtcips d.lf, maxlags(8) bglags(8) q
xtcips d.lh, maxlags(8) bglags(8) q
xtcips d.mlsflp, maxlags(8) bglags(8) q
xtcips d.mlsfch, maxlags(8) bglags(8) q

**Multipurt
multipurt lf lsd lsflp lsfch mlsflp mlsfch m lh, lags(4)

***Variables are I(1)

****************************************************************************************************************

**Checking slope heterogeneity; H0: Slopes are homogenous across panels
xthst lf lsd lsfch
xthst lf lsd lsflp
xthst lf lsd mlsfch 
xthst lf lsd mlsflp
xthst lf lsd lsfch lh
xthst lf lsd lsflp lh
xthst lf lsd mlsfch lh
xthst lf lsd mlsflp lh

//Null rejected in each case; evidence of heterogenous slopes, cross sectional dependency, and non-stationarity

****************************************************************************************************************

**Pedroni cointegration
xtpedroni lf lsd lsfch, lags(3) lagselect(aic)
xtpedroni lf lsd lsflp, lags(3) lagselect(aic)
xtpedroni lf lsd mlsfch, lags(3) lagselect(aic)
xtpedroni lf lsd mlsflp, lags(3) lagselect(aic)
xtpedroni lf lsd lsfch lh, lags(3) lagselect(aic)
xtpedroni lf lsd lsflp lh, lags(3) lagselect(aic)
xtpedroni lf lsd mlsfch lh, lags(3) lagselect(aic)
xtpedroni lf lsd mlsflp lh, lags(3) lagselect(aic)


**Westerlund Cointegration
xtwest lf lsd lsfch, lags(3 0) leads(3 0) lrwindow(3)
xtwest lf lsd lsflp, lags(3 0) leads(3 0) lrwindow(3)
xtwest lf lsd mlsfch, lags(3 0) leads(3 0) lrwindow(3)
xtwest lf lsd mlsflp, lags(3 0) leads(3 0) lrwindow(3)
xtwest lf lsd lsfch lh, lags(3 0) leads(3 0) lrwindow(3)
xtwest lf lsd lsflp lh, lags(3 0) leads(3 0) lrwindow(3)
xtwest lf lsd mlsfch lh, lags(3 0) leads(3 0) lrwindow(3)
xtwest lf lsd mlsflp lh, lags(3 0) leads(3 0) lrwindow(3)


//Data are cointegrated according to the Westerlund test

****************************************************************************************************************

clear
