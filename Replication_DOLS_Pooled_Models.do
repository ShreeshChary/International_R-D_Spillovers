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

**Variable Construction

gen dlf=d.lf
gen dlsd=d.lsd
gen dlsflp=d.lsflp
gen dlsfch=d.lsfch
gen dlh=d.lh
gen llf=l.lf
gen llsd=l.lsd
gen llsflp=l.lsflp
gen llsfch=l.lsfch
gen llh=l.lh
gen ldlf=l.d.lf
gen ldlsd=l.d.lsd
gen ldlsflp=l.d.lsflp
gen ldlsfch=l.d.lsfch
gen ldlh=l.d.lh
gen l2dlf=l2.d.lf
gen l2dlsd=l2.d.lsd
gen l2dlsflp=l2.d.lsflp
gen l2dlsfch=l2.d.lsfch
gen l2dlh=l2.d.lh
gen l3dlf=l3.d.lf
gen l3dlsd=l3.d.lsd
gen l3dlsflp=l3.d.lsflp
gen l3dlsfch=l3.d.lsfch
gen l3dlh=l3.d.lh

****************************************************************************************************************
 
*Constructing cross sectional averages for CCEP

qui xtreg d.lf l.lf l.lsd l.lsflp d.lsd d.lsflp, fe
sort Year c

by Year: egen dlfT1=mean(dlf) if e(sample)
by Year: egen dlfT=mean(dlfT1)
by Year: egen llfT1=mean(llf) if e(sample)
by Year: egen llfT=mean(llfT1)
by Year: egen llsdT1=mean(llsd) if e(sample)
by Year: egen llsdT=mean(llsdT1)
by Year: egen llsflpT1=mean(llsflp) if e(sample)
by Year: egen llsflpT=mean(llsflpT1)
by Year: egen dlsdT1=mean(dlsd) if e(sample)
by Year: egen dlsdT=mean(dlsdT1)
by Year: egen dlsflpT1=mean(dlsflp) if e(sample)
by Year: egen dlsflpT=mean(dlsflpT1)
by Year: egen ldlfT1=mean(ldlf) if e(sample)
by Year: egen ldlfT=mean(ldlfT1)
by Year: egen l2dlfT1=mean(l2dlf) if e(sample)
by Year: egen l2dlfT=mean(l2dlfT1)
by Year: egen ldlsdT1=mean(ldlsd) if e(sample)
by Year: egen ldlsdT=mean(ldlsdT1)
by Year: egen l2dlsdT1=mean(l2dlsd) if e(sample)
by Year: egen l2dlsdT=mean(l2dlsdT1)
by Year: egen ldlsflpT1=mean(ldlsflp) if e(sample)
by Year: egen ldlsflpT=mean(ldlsflpT1)
by Year: egen l2dlsflpT1=mean(l2dlsflp) if e(sample)
by Year: egen l2dlsflpT=mean(l2dlsflpT1)

drop l2dlsflpT1 ldlsflpT1 l2dlsdT1 ldlsdT1 l2dlfT1 ldlfT1 dlsflpT1 dlsdT1 llsflpT1 llsdT1 llfT1 dlfT1

***************************************************************************************************************


**Panel Dynamic OLS

xtpedroni lf lsd lsfch, lags(3) lagselect(aic) notest
xtpedroni lf lsd lsflp, lags(3) lagselect(aic) notest
xtpedroni lf lsd mlsfch, lags(3) lagselect(aic) notest
xtpedroni lf lsd mlsflp, lags(3) lagselect(aic) notest
xtpedroni lf lsd lsfch lh, lags(3) lagselect(aic) notest
xtpedroni lf lsd lsflp lh, lags(3) lagselect(aic) notest
xtpedroni lf lsd mlsfch lh, lags(3) lagselect(aic) notest
xtpedroni lf lsd mlsflp lh, lags(3) lagselect(aic) notest

****************************************************************************************************************

**2FE ECM

qui xtreg dlf llf llsd llsflp dlsd  dlsflp i.Year, robust fe 
nlcom (_b[llsd]/(-_b[llf]))  (_b[llsflp]/(-_b[llf]))  , post 
mat a=e(b)
mat b=e(V)
scalar domb=a[1,1]
scalar domse=sqrt(b[1,1])
scalar foreignb=a[1,2]
scalar foreignse=sqrt(b[2,2])
scalar tsig=-999
xtreg dlf llf llsd llsflp dlsd dlsflp i.Year, robust fe 
scalar rmse=e(rmse)
predict e2FE
xtcd e2FE
scalar drop _all

*****************************************************************************************************************

**CCEP

set seed 1102012
sort c Year
xi: reg dlf llf llsd llsflp  dlsd  dlsflp   ///
	i.c|dlfT i.c|llfT i.c|llsdT i.c|llsflpT ///
	i.c|dlsdT i.c|dlsflpT i.c
nlcom (_b[llsd]/(-_b[llf]))  (_b[llsflp]/(-_b[llf])) , post 
mat a=e(b)
mat b=e(V)
scalar domesticb=a[1,1]
scalar domesticse=sqrt(b[1,1])
scalar foreignb=a[1,2]
scalar foreignse=sqrt(b[2,2])
scalar tsig=-999
set seed 1102012
xi: reg dlf llf llsd llsflp  dlsd  dlsflp   ///
	i.c|dlfT i.c|llfT i.c|llsdT i.c|llsflpT ///
	i.c|dlsdT i.c|dlsflpT i.c,  vce(bootstrap)
scalar rmse=e(rmse)
predict eCCEP
xtcd eCCEP 

*****************************************************************************************************************

**MG

xtmg dlf llf llsd llsflp dlsd  dlsflp, robust trend res(eMGt) 
mat testb=e(betas)
scalar mse=e(sigma)
scalar rmse=sqrt(mse)
scalar tsig=e(trend_sig)
nlcom (_b[llsd]/(-_b[llf]))  (_b[llsflp]/(-_b[llf])) , post 
mat a=e(b)
mat b=e(V)
scalar domb=a[1,1]
scalar domse=sqrt(b[1,1])
scalar forb=a[1,2]
scalar forse=sqrt(b[2,2])
xtmg dlf llf llsd llsflp  dlsd  dlsflp, robust trend 
xtcd eMG

*****************************************************************************************************************

**CCEMG

xtcaec lf lsd lsflp, lags(0) calags(0) res(eCCEMG)
xtcd eCCEMG

*****************************************************************************************************************

clear




