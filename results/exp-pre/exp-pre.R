library(dplyr)
library(readr)
library(ggplot2)

exp0_alldata <- read_csv("[your directory]/cobweb-vision/results/exp-pre/exp-pre.csv")

df_entire_0 = exp0_alldata %>%
  rename(Approach = Model)

df_entire_0_init = df_entire_0

p_entire_0_init <- ggplot(df_entire_0_init, aes(x = Maxnodes, y = TestAccuracy, color = Approach,
                         linetype = Approach, fill = Approach, group = Approach)) +
  geom_errorbar(stat = "summary",
                fun.data = "mean_cl_boot",
                linetype = 'solid',
                width = 0.2,
                show.legend = FALSE) +
  stat_summary(fun.data = "mean_cl_boot",
               geom = "line",
               size = 2,
               alpha = 0.5,
               show.legend = FALSE) +
  stat_summary(fun.data = "mean_cl_boot",
               geom = "text",
               aes(label = round(..y.., 5)),
               vjust = -1.,
               show.legend = FALSE,
               color = 'black') +
  # geom_text(aes(label = y), vjust = -0.5) +
  labs(x = '# of maximum best nodes in prediction', y = 'Test accuracy', 
       title = NULL) +
  
  theme_minimal() +
  theme(text = element_text(size=25)) +
  scale_color_manual(values = c('cobweb4v' = '#ca0020')) +
  scale_linetype_manual(values = c("cobweb4v" = "solid")) +
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = c(.9, .2),
        legend.key.size = unit(0.5, "lines"),
  ) +
  scale_y_continuous(
    breaks = c(0.9, 0.91, 0.92, 0.93, 0.94, 0.95, 0.96))
print(p_entire_0_init)

# Output the stat summary shown in the plots
df_display_0_init <- ggplot_build(p_entire_0_init)$data[[2]]
df_display_0_init$y

