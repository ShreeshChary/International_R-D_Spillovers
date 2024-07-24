library(dplyr)
library(gridExtra)
library(ggplot2)
library(ggrepel)
setwd("C:/Users/shree/OneDrive/Desktop/MSc Dissertation/Drafts")

##############################################################################################################################

#### Figure 4. Boxplots to Assess Heterogeneity

library(readxl)
R_Replication_Panel <- read_excel("C:/Users/shree/OneDrive/Desktop/MSc Dissertation/Data/R_Replication_Panel.xlsx")
View(R_Replication_Panel)

A <-ggplot(R_Replication_Panel, aes(x = factor(G7), y = Mag, fill = Coef)) +
  geom_boxplot(position = position_dodge(width = 0.8), outlier.shape = NA, alpha = 0.6) +
  scale_x_discrete(labels = c("0" = "Non-G7", "1" = "G7")) +
  xlab("Country Category") +
  ylab("Coefficient Values") +
  ggtitle("Panel A") +
  theme_minimal(base_size = 15) +
  scale_fill_manual(values = c("#00BFC1", "#F8766D"), labels = c("Domestic R&D", "Foreign R&D")) +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(), # Remove legend title
    panel.grid.major = element_line(size = 0.2, linetype = 'dotted', colour = "gray"),
    panel.grid.minor = element_blank()
  ) +
  guides(fill = guide_legend(override.aes = list(alpha = 0.6)))

B <-ggplot(R_Replication_Panel, aes(x = factor(HC_quartile), y = Mag, fill = Coef)) +
  geom_boxplot(position = position_dodge(width = 0.8), outlier.shape = NA, alpha = 0.6) +
  xlab("Human Capital Index (Quartiles)") +
  scale_x_discrete(labels = c("1" = "Q1", "2" = "Q2", "3"="Q3", "4"="Q4")) +
  ylab("Coefficient Values") +
  ggtitle("Panel B") +
  theme_minimal(base_size = 15) +
  scale_fill_manual(values = c("#00BFC1", "#F8766D"), labels = c("Domestic R&D", "Foreign R&D")) +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(), # Remove legend title
    panel.grid.major = element_line(size = 0.2, linetype = 'dotted', colour = "gray"),
    panel.grid.minor = element_blank()
  ) +
  guides(fill = guide_legend(override.aes = list(alpha = 0.6)))

combinedbox <- grid.arrange(A, B, ncol = 2, nrow = 1)

ggsave("boxplots.png", combinedbox, width = 14, height = 10)

#################################################################################################################################################


#### Figure 5. Heterogeneity Based on Import Intensity

R_Replication_Cross <- read_excel("C:/Users/shree/OneDrive/Desktop/MSc Dissertation/Data/R_Replication_Cross.xlsx")
View(R_Replication_Cross)

G <- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsd)) +
  geom_point(aes(group = country), size = 0) +  # Points for each country
  geom_text(aes(label = country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm",  se = FALSE, color = "blue") +  # Add a linear smooth line
  geom_smooth(method = "lm", data = subset(Data_Dissertation_Alternate, G7 == 1), se = FALSE, color = "red") +
  geom_smooth(method = "lm", data = subset(Data_Dissertation_Alternate, G7 == 0),se = FALSE, color = "black") +
  theme_minimal() +
  xlab("Imports (% of GDP)") +
  ylab("Coefficient of Domestic R&D Stocks") +
  ggtitle("Panel A") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

H <- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsflp)) +
  geom_point(aes(group = country), size = 0) +  # Points for each country
  geom_text(aes(label = country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", se = FALSE, color = "blue") +  # Add a linear smooth line
  geom_smooth(method = "lm", data = subset(Data_Dissertation_Alternate, G7 == 1),se = FALSE, color = "red") +
  geom_smooth(method = "lm", data = subset(Data_Dissertation_Alternate, G7 == 0), se = FALSE, color = "black") +
  theme_minimal() +
  xlab("Imports (% of GDP)") +
  ylab("Coefficient of Foreign R&D Stocks") +
  ggtitle("Panel B") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

E <- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsd)) +
  geom_point(aes(group = country), size = 0) +  # Points for each country
  geom_text(aes(label = country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm",  formula = y ~ poly(x,2), se = FALSE, color = "blue") +  # Add a linear smooth line
  geom_smooth( data = subset(Data_Dissertation_Alternate, G7 == 1), method = "lm",formula = y ~ poly(x,2), se = FALSE, color = "red") +
  geom_smooth( data = subset(Data_Dissertation_Alternate, G7 == 0), method = "lm",formula = y ~ poly(x,2), se = FALSE, color = "black") +
  theme_minimal() +
  xlab("Imports (% of GDP)") +
  ylab("Coefficient of Domestic R&D Stocks") +
  ggtitle("Panel C") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

F <- ggplot(Data_Dissertation_Alternate, aes(x = m, y = lsflp)) +
  geom_point(aes(group = country), size = 0) +  # Points for each country
  geom_text(aes(label = country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm", formula = y ~ poly(x,2), se = FALSE, color = "blue") +  # Add a linear smooth line
  geom_smooth( data = subset(Data_Dissertation_Alternate, G7 == 1), method = "lm",formula = y ~ poly(x,2), se = FALSE, color = "red") +
  geom_smooth( data = subset(Data_Dissertation_Alternate, G7 == 0), method = "lm",formula = y ~ poly(x,2), se = FALSE, color = "black") +
  theme_minimal() +
  xlab("Imports (% of GDP)") +
  ylab("Coefficient of Foreign R&D Stocks") +
  ggtitle("Panel D") +
  scale_color_viridis_d() +
  theme(legend.position = "none")


combined <- grid.arrange(G, H,E, F, ncol = 2, nrow = 2)
print(combined)

ggsave("HC_IMP.png", combined, width = 14, height = 15)

#####################################################################################################################################################




