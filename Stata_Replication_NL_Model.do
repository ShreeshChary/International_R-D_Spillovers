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
import excel "C:\Users\shree\OneDrive\Desktop\MSc Dissertation\Data Dissertation Alternate.xlsx", sheet("Clean") firstrow

**Changing working directory
cd "C:\Users\shree\OneDrive\Desktop\MSc Dissertation"

**Panel Settings
encode Country, gen(c)
encode imp, gen(cat)
xtset c Year, yearly
drop if Year==2020
gen mlsd=m*lsd

****************************************************************************************************************

**Non-Linearities

xtcce lf lsd lsflp mlsflp mlsd, res(n1)
eststo n1
xtcd n1
xtcce lf lsd lsflp mlsd mlsflp lh, res(n2)
eststo n2
xtcd n2
xtcce lf lsd lsflp mlsflp mlsd if cat==2, res(n3)
eststo n3
xtcd n3
xtcce lf lsd lsflp mlsd mlsflp lh if cat==2, res(n4)
eststo n4
xtcd n4
xtcce lf lsd lsflp mlsflp mlsd if cat!=2, res(n5)
eststo n5
xtcd n5
xtcce lf lsd lsflp mlsd mlsflp lh if cat!=2, res(n6)
eststo n6
xtcd n6
esttab n1 n2 n3 n4 n5 n6, keep(lsd lsflp mlsflp mlsd lh) star(* 0.1 ** 0.05 *** 0.01) se(3) b(3) r2

****************************************************************************************************************
**Non-Linearities AMG

xtmg lf lsd lsflp mlsflp mlsd, aug res(a1)
eststo a1
xtcd a1
xtmg lf lsd lsflp mlsd mlsflp lh, aug res(a2)
eststo a2
xtcd a2
xtmg lf lsd lsflp mlsflp mlsd if cat==2, aug res(a3)
eststo a3
xtcd a3
xtmg lf lsd lsflp mlsd mlsflp lh if cat==2, aug res(a4)
eststo a4
xtcd a4
xtmg lf lsd lsflp mlsflp mlsd if cat!=2, aug res(a5)
eststo a5
xtcd a5
xtmg lf lsd lsflp mlsd mlsflp lh if cat!=2, aug res(a6)
eststo a6
xtcd a6
esttab a1 a2 a3 a4 a5 a6, keep(lsd lsflp mlsflp mlsd lh) star(* 0.1 ** 0.05 *** 0.01) se(3) b(3) r2

****************************************************************************************************************

clear






