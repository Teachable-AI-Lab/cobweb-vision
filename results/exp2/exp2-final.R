library(dplyr)
library(readr) # Read the csv file
library(ggplot2)  # Basic plot package

exp1 <- read_csv("[your directory]/cobweb-vision/results/exp2/exp2-final.csv")

exp1$TrainSet <- factor(exp1$TrainSet, 
                        levels = c('D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7', 'D8', 'D9', 'D10'))

df_chosen_1 = exp1 %>% 
  rename(Approach = Model)

p_chosen_1 <- ggplot(df_chosen_1, aes(x = TrainSet, y = TestAccuracy, color = Approach,
                         linetype = Approach, fill = Approach, group = Approach)) +
  geom_errorbar(stat = "summary",
                fun.data = "mean_cl_boot",
                linetype = 'solid',
                width = 0.2) +
  stat_summary(fun.data = "mean_cl_boot",
               geom = "line",
               linewidth = 2,
               alpha = 0.5) +
  labs(x = 'Incoming Training Split', y = 'Test Accuracy', 
       title = NULL) +
  
  theme_minimal() +
  theme(text = element_text(size=18)) +
  scale_color_manual(values = c('fc' = '#006d2c', 'fc-replay' = '#66c2a4',
                                'fc-cnn' = '#253494', 'fc-cnn-replay' = '#4292c6',
                                'cobweb4v' = '#ca0020')) +
  scale_linetype_manual(values = c('fc' = 'solid', 'fc-replay' = 'solid',
                                   'fc-cnn' = 'solid', 'fc-cnn-replay' = 'solid',
                                   'cobweb4v' = 'solid')) +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = 'top')  +
  scale_y_continuous(
    breaks = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0))
print(p_chosen_1)

# Output the stat summary shown in the plots
df_display_1 <- ggplot_build(p_chosen_1)$data[[2]]
# Performances at Split 10:
# cobweb4v: 0.936892738
# fc-fast: 0.006059490
# fc-slow: 0.015375271
# fc-cnn-fast: 0.068035247
# fc-cnn-slow: 0.092731412