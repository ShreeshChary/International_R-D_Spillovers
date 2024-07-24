# Load necessary libraries
library(dplyr)
library(gridExtra)
library(ggplot2)
setwd("C:/Users/shree/OneDrive/Desktop/MSc Dissertation")

R_Replication_Stylised <- read_excel("C:/Users/shree/OneDrive/Desktop/MSc Dissertation/Data/R_Replication_Stylised.xlsx")

plot2<-ggplot(Data_Dissertation_Alternate, aes(x = lp, y = lf, color= Country)) +
  geom_smooth(method = "lm", formula = y ~ poly(x,1), se = FALSE, aes(group = Country), size = 1) +  # Linear fits for each country
  geom_smooth(method = "lm",formula = y ~ poly(x,1), se = TRUE, color = "black", size = 1, linetype = "dashed") +  # Linear fit for pooled model
  theme_minimal() +
  xlab("Foreign R&D Stocks") +
  ylab("Log of TFP") +
  ggtitle("Panel B")+
  scale_color_viridis_d()+
  theme(legend.position = "none")


plot1<-ggplot(Data_Dissertation_Alternate, aes(x = lsd, y = lf, color= Country)) +
  geom_smooth(method = "lm",formula = y ~ poly(x, 1), se = FALSE, aes(group = Country), size = 1) +  # Linear fits for each country
  geom_smooth(method = "lm", formula = y ~ poly(x, 1), se = TRUE, color = "black", size = 1, linetype = "dashed") +  # Linear fit for pooled model
  theme_minimal() +
  xlab("Domestic R&D Stocks") +
  ylab("Log of TFP") +
  ggtitle("Panel A")+
  scale_color_viridis_d()+
  theme(legend.position = "none")

  
plot4<-ggplot(Data_Dissertation_Alternate, aes(x = lp, y = lf, color= Country)) +
  geom_smooth(method = "lm", formula = y ~ poly(x,2), se = FALSE, aes(group = Country), size = 1) +  # Linear fits for each country
  geom_smooth(method = "lm",formula = y ~ poly(x,2), se = TRUE, color = "black", size = 1, linetype = "dashed") +  # Linear fit for pooled model
  theme_minimal() +
  xlab("Foreign R&D Stocks") +
  ylab("Log of TFP") +
  ggtitle("Panel D")+
  scale_color_viridis_d()+
  theme(legend.position = "none")

plot3<-ggplot(Data_Dissertation_Alternate, aes(x = lsd, y = lf, color= Country)) +
  geom_smooth(method = "lm",formula = y ~ poly(x, 2), se = FALSE, aes(group = Country), size = 1) +  # Linear fits for each country
  geom_smooth(method = "lm", formula = y ~ poly(x, 2), se = TRUE, color = "black", size = 1, linetype = "dashed") +  # Linear fit for pooled model
  theme_minimal() +
  xlab("Domestic R&D Stocks") +
  ylab("Log of TFP") +
  ggtitle("Panel C")+
  scale_color_viridis_d()+
  theme(legend.position = "none")

combined_plot <- grid.arrange(plot1, plot2, plot3, plot4, ncol = 2, nrow = 2)
print(combined_plot)
ggsave("combined_plot.png", combined_plot, width = 14, height = 10)

####################################################################################################################




