library(dplyr)
library(readr)
library(ggplot2)

# PLEASE import the concatenated table exp0.csv with the directory where the table lies in here:
exp0 <- read_csv("[your directory]/cobweb-vision/results/exp1/all/exp1-final.csv")

exp0$TrainSet <- as.numeric(gsub("D", "", exp0$TrainSet)) * 10

df_entire_0 = exp0 %>% 
  rename(Approach = Model)

df_entire_0_init = df_entire_0

p_entire_0_init <- ggplot(df_entire_0_init, aes(x = TrainSet, y = TestAccuracy, color = Approach,
                                                linetype = Approach, fill = Approach, group = Approach)) +
  geom_errorbar(stat = "summary",
                fun.data = "mean_cl_boot",
                linetype = 'solid',
                width = 0.2) +
  stat_summary(fun.data = "mean_cl_boot",
               geom = "line",
               linewidth = 2,
               alpha = 0.5) +
  labs(x = '# of Training Samples', y = 'Test Accuracy', 
       title = NULL) +
  
  theme_minimal() +
  theme(text = element_text(size=18)) +
  scale_color_manual(values = c('fc' = '#006d2c', 'fc-cnn' = '#253494', 'cobweb4v' = '#ca0020')) +
  scale_linetype_manual(values = c('fc' = 'solid', 'fc-cnn' = 'solid', 'cobweb4v' = 'solid')) +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "top",
        legend.key.size = unit(0.5, "lines"),
        plot.margin = unit(c(1, 2, 1, 1), "lines"))  +
  scale_y_continuous(
    breaks = c(0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0))
print(p_entire_0_init)

# Output the stat summary shown in the plots
df_display_0_init <- ggplot_build(p_entire_0_init)$data[[2]]
# The accuracy of the approaches after the last split:
# cobweb4v: 0.80222
# fc: 0.78723
# fc-cnn: 0.85415
