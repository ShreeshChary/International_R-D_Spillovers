#### Figure 6. Non-Linearity Threshold

R_Replication_Cross <- read_excel("C:/Users/shree/OneDrive/Desktop/MSc Dissertation/Data/R_Replication_Cross.xlsx")
View(R_Replication_Cross)

filtered_data <- subset(Data_Dissertation_Alternate, country %in% c("Australia", "Austria", "Canada", "France", "Italy", "Japan", "Korea", "Mexico", "Netherlands", "Norway", "Turkey"))
HC_data <- subset(Data_Dissertation_Alternate, country %in% c("Australia", "Austria", "Canada", "France", "Italy", "Japan", "Korea", "Mexico", "Netherlands", "Norway", "Turkey", "Belgium", "Finland", "Germany", "Greece", "Spain", "Sweden", "UK", "USA"))
Data_Dissertation_Alternate <- read_excel("C:/Users/shree/OneDrive/Desktop/MSc Dissertation/Data Dissertation Alternate.xlsx",sheet = "Coefficients")
View(Data_Dissertation_Alternate)

M <- ggplot(filtered_data, aes(x = m, y = Threshold)) +
  geom_point(aes(group = country), size = 0) +  # Points for each country
  geom_text(aes(label = country), vjust = -0.5, hjust = 0.5, size = 3) +  # Labels for each country
  geom_smooth(method = "lm",formula = y ~ poly(x,2), se = FALSE, color = "blue") +  # Add a linear smooth line
  theme_minimal() +
  xlab("Import Intensity (% of GDP)") +
  ylab("Non-linearity Threshold") +
  ggtitle("Panel A") +
  scale_color_viridis_d() +
  theme(legend.position = "none")

print(M)


N <-ggplot(filtered_data, aes(x = factor(Imp), y = Threshold, fill = Threshold)) +
  geom_boxplot(position = position_dodge(width = 0.8), outlier.shape = NA, alpha = 0.6) +
  scale_x_discrete(labels = c("1" = "<15%", "2" = "15%-30%", "3"=">30%")) +
  xlab("Import Intensity (% of GDP)") +
  ylab("Non-linearity Threshold") +
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

print(N)

O <-ggplot(filtered_data, aes(x = factor(HC_quartile), y = Threshold, fill = Threshold)) +
  geom_boxplot(position = position_dodge(width = 0.8), alpha = 0.6) +
  scale_x_discrete(labels = c("1" = "Q1", "2" = "Q2", "3"="Q3", "4"="Q4")) +
  xlab("Human Capital Quartile") +
  ylab("Non Linearity Threshold") +
  ggtitle("Panel C") +
  theme_minimal(base_size = 15) +
  scale_fill_manual(values = c("#00BFC1", "#F8766D"), labels = c("Domestic R&D", "Foreign R&D")) +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(), # Remove legend title
    panel.grid.major = element_line(size = 0.2, linetype = 'dotted', colour = "gray"),
    panel.grid.minor = element_blank()
  ) +
  guides(fill = guide_legend(override.aes = list(alpha = 0.6)))

print(O)

P <-ggplot(filtered_data, aes(x = factor(G7), y = Threshold, fill = Threshold)) +
  geom_boxplot(position = position_dodge(width = 0.8), alpha = 0.6) +
  scale_x_discrete(labels = c("0" = "Non-G7", "1" = "G7")) +
  xlab("Country Category") +
  ylab("Non Linearity Threshold") +
  ggtitle("Panel D") +
  theme_minimal(base_size = 15) +
  scale_fill_manual(values = c("#00BFC1", "#F8766D"), labels = c("Domestic R&D", "Foreign R&D")) +
  theme(
    legend.position = "bottom",
    legend.title = element_blank(), # Remove legend title
    panel.grid.major = element_line(size = 0.2, linetype = 'dotted', colour = "gray"),
    panel.grid.minor = element_blank()
  ) +
  guides(fill = guide_legend(override.aes = list(alpha = 0.6)))

print(P)

nl <- grid.arrange(M, N, O ,P , ncol = 2, nrow = 2)
print(nl)

ggsave("nl.png", nl, width = 14, height = 12)

#####################################################################################################################################################