library(tidyverse)
library(ggthemes)

total_deaths <- 1142
total_cases <- 110
total_controls <- 1

#Create dataframe of donation probailities, then calculate and fill in prevalence and
#strength of selection effect
df <- as.data.frame(matrix(0, ncol = 1, nrow = 1000))

df <- df %>% 
  mutate(pdon_CTE = seq(0.001, 1, 0.001), #Probability of brain donation for CTE cases
         cases = total_cases/pdon_CTE,
         controls = total_deaths - cases,
         pdon_noCTE = total_controls/controls, #Probability of brain donation for no CTE
         prev = cases/total_deaths, #Prevalence
         ratio = pdon_CTE/pdon_noCTE, #Ratio or strength of selection effect
         ll = prev - 1.96*sqrt((prev*(1-prev))/total_deaths), #Binomial CI calculations
         ul = prev + 1.96*sqrt((prev*(1-prev))/total_deaths)) %>% 
  select(-V1)

#Plot results
(prev_plot <- df %>% 
  filter(prev <= 1.0) %>% 
  ggplot(aes(x = pdon_CTE, y = prev)) +
  geom_line(color = "blue") +
  geom_ribbon(aes(ymin = ll, ymax = ul), alpha = 0.1, fill = "blue") +
  coord_cartesian(ylim = c(0,1.0), xlim = c(0,1)) +
  scale_y_continuous("Prevalence of CTE", breaks = seq(0, 1, 0.1), expand = c(0,0),
                     labels = c("0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%",
                                "80%", "90%", "100%")) +
  scale_x_continuous("Donation Probability Among Those With CTE,
  Ratio of Donation Probability Among Those With vs. Without CTE", 
                     breaks = seq(0, 1, 0.1), expand = c(0,0),
                     labels = c("0%,\nNA", "10%,\n4.2", "20%,\n118.4", "30%,\n232.6",
                                "40%,\n346.8", "50%,\n461.0", "60%,\n575.2",
                                "70%,\n689.4", "80%,\n803.6", "90%,\n917.8",
                                "100%,\n1032.0")) +
  theme(panel.grid.minor = element_blank(),
        plot.margin = unit(c(0.5,1,0.5,0.5), "cm")))

# #The following is just a second way to print the above graph that creates the tick marks by
# #natural cutpoints in the strength of the selection effect rather than % of players with CTE
# #who donated their brains. It is commented out as it wasn't used in the paper.
# 
# 
# #Start from ratio/strength of selection effect
# df <- as.data.frame(matrix(0, ncol = 1, nrow = 1032))
# 
# df <- df %>% 
#   mutate(ratio = seq(1, 1032, 1),
#          pdon_CTE = (110 + ratio)/total_deaths,
#          pdon_noCTE = pdon_CTE/ratio,
#          cases = total_cases/pdon_CTE,
#          controls = total_controls/pdon_noCTE,
#          prev = cases/total_deaths,
#          ll = prev - 1.96*sqrt((prev*(1-prev))/total_deaths),
#          ul = prev + 1.96*sqrt((prev*(1-prev))/total_deaths)) %>% 
#   select(-V1)
# 
# (prev_plot <- df %>% 
#     filter(prev <= 1.0) %>% 
#     ggplot(aes(x = ratio, y = prev)) +
#     geom_line(color = "blue") +
#     coord_cartesian(ylim = c(0,1.0), xlim = c(0,1050)) +
#     scale_y_continuous("Prevalence of CTE", breaks = seq(0, 1, 0.1), expand = c(0,0),
#                        labels = c("0%", "10%", "20%", "30%", "40%", "50%", "60%", "70%",
#                                   "80%", "90%", "100%")) +
#     scale_x_continuous("Ratio of Donation Probability Among Those With vs. Without CTE, 
#     Donation Probability Among Those With CTE", 
#                        breaks = seq(0, 1000, 100), expand = c(0,0),
#                        labels = c("1,\n9.7%", "100,\n18.4%", "200,\n27.1%", "300,\n35.9%",
#                                   "400,\n44.7%", "500,\n53.4%", "600,\n62.2%",
#                                   "700,\n70.9%", "800,\n79.7%", "900,\n88.4%",
#                                   "1000,\n97.2%")) +
#     theme(panel.grid.minor = element_blank(),
#           plot.margin = unit(c(0.5,1,0.5,0.5), "cm")))

