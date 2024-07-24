################################################################################################################
#                                              Shreesh Chary
# Heterogeneity and Non-Linearities in International Knowledge Spillovers: Evidence Using Novel Panel Estimators
################################################################################################################
#			   	                           Created: 20th July 2024				
#			   	                                    Revised: 					
################################################################################################################
#  	 		                   School of Economics, University of Nottingham,			
#		                 University Park, Nottingham NG7 2RD, United Kingdom			
#			                           email: shreeshchary@gmail.com; lexsc28@nottingham.ac.uk				
################################################################################################################

library(dplyr)
library(gridExtra)
library(ggplot2)
library(ggrepel)

lsdch<- ggplot(Data_Dissertation_Alternate, aes(x = ADTF, y = lsdch)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Average Distance to Frontier") +
  ylab("Coefficient of Domestic Knowledge Stocks (CH)") +
  ggtitle("Panel A") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

lsfch<- ggplot(Data_Dissertation_Alternate, aes(x = ADTF, y = lsfch)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Average Distance to Frontier") +
  ylab("Coefficient of Foreign Knowledge Stocks (CH)") +
  ggtitle("Panel B") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

lsdlp<- ggplot(Data_Dissertation_Alternate, aes(x = ADTF, y = lsdlp)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Average Distance to Frontier") +
  ylab("Coefficient of Domestic Knowledge Stocks (LP)") +
  ggtitle("Panel C") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

lsflp<- ggplot(Data_Dissertation_Alternate, aes(x = ADTF, y = lsflp)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Average Distance to Frontier") +
  ylab("Coefficient of Foreign Knowledge Stocks (LP)") +
  ggtitle("Panel D") +
  scale_color_viridis_d() +
  theme(legend.position = "none")


combined_plot <- grid.arrange(lsdch, lsfch, lsdlp, lsflp, ncol = 2, nrow = 2)
print(combined_plot)

ggsave("coefficients.png", combined_plot, width = 14, height = 10)

##################################################################################################################################################

lsdch<- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsdch)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Imports") +
  ylab("Coefficient of Domestic Knowledge Stocks (CH)") +
  ggtitle("Panel A") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

lsfch<- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsfch)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Imports") +
  ylab("Coefficient of Foreign Knowledge Stocks (CH)") +
  ggtitle("Panel B") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

lsdlp<- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsdlp)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Imports") +
  ylab("Coefficient of Domestic Knowledge Stocks (LP)") +
  ggtitle("Panel C") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

lsflp<- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsflp)) +
  geom_point(aes(group = Country), size = 1) +  # Points for each country
  geom_text(aes(label = Country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Imports") +
  ylab("Coefficient of Foreign Knowledge Stocks (LP)") +
  ggtitle("Panel D") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

combined_plot <- grid.arrange(lsdch, lsfch, lsdlp, lsflp, ncol = 2, nrow = 2)
print(combined_plot)

####################################################################################################################


