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
gen g7=(c==4|c==7|c==8|c==11|c==12|c==22|c==23)

****************************************************************************************************************

***Error Correction Model (Code based on Eberhardt and Presbitero (2015) JIE paper, SSC constructed by Korbinian Nagel)

xtcaec lf lsd lsflp, lags(1) calags(2) select res(D1) avlr mg
xtcd D1
xtcaec lf lsd lsflp lh, lags(1) calags(2) select res(D2) avlr mg
xtcd D2
xtcaec lf lsd lsflp if g7==1, lags(1) calags(2) select res(D3) avlr mg
xtcd D3
xtcaec lf lsd lsflp lh if g7==1, lags(1) calags(2) select res(D4) avlr mg
xtcd D4
xtcaec lf lsd lsflp if g7==0, lags(1) calags(2) select res(D5) avlr mg
xtcd D5
xtcaec lf lsd lsflp lh if g7==0, lags(1) calags(2) select res(D6) avlr mg
xtcd D6

****************************************************************************************************************

clear





