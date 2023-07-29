#BLAIS_2y_obs <- read.csv("C:/Users/gcook/Sync/Data/jurorthreshold/BLAIS_2y_obs.csv")
#write.csv(BLAIS_2y_obs, paste(data_dir, "BLAIS_2y_obs.csv", sep = "/"), row.names = F)

BLAIS_2y_obs <- read.csv(here::here("data", "BLAIS_2y_obs_seed - 99.csv"))
#view(BLAIS_2y_obs)
BLAIS_2y_obs_rate <- 19.5 # from table 2S
BLAIS_Score2_pred <- 9    # from table 2S

BLAIS_2y_mean <- mean(BLAIS_2y_obs$rate)

#BRENT <- read.csv("C:/Users/gcook/Sync/Data/jurorthreshold/BRENT_2y_obs.csv")
#write.csv(BRENT, paste(data_dir, "BRENT_2y_obs.csv", sep = "/"), row.names = F)
BRENT <- read.csv(here::here("data", "BRENT_2y_obs_seed - 99.csv")) %>% 
                          dplyr::filter(score %in% c(2))

BRENT_Score2_mean <- mean(BRENT$rate)



############################## PLOTS ##############################
############################## PLOTS ##############################
############################## PLOTS ##############################

Blais.p.unweighted <- BLAIS_2y_obs %>%
  mutate(., rate = rate/100) %>%
  ggplot(data = ., 
                             mapping = aes(x = score, y = rate
                                           , #alpha = rate
                             )) +
  # for wai1, size 2, width was .7; .3 for wai2, alpha = .5
  #  geom_point(size = 2, 
  #             alpha = .5, 
  #             position = position_jitter(seed = 68, width = .3)) +
  geom_point(aes(
    #size = rate,
    #alpha = rev(rate_z)
  ), 
  alpha = .5, 
  position = position_jitter(seed = 68, width = .3)) + 
  #geom_line(size = .25) + 
  theme_classic() + #minimal() + 
  theme(axis.line = 
          element_line(colour = "black", 
                       size = 1, linetype = "solid"),
        axis.title = element_text(size = 14, face = "bold"), 
        axis.text  = element_text(size = 14),
        strip.text.y = element_text(size = 12),
        aspect.ratio = 1/1,
        legend.position = "none"
  ) +
  scale_x_discrete(
    name   = "Scores", limits = seq(-2, 7)
  ) +
  scale_y_continuous(
    # position = "right",
    name = "Predicted Recidivism Rate (%)", 
    limits = c(0, .75),    #  n.breaks = 50
    breaks = seq(0, .75, .05),
    labels = scales::label_percent()
  ); 
#Blais.p.unweighted


Blais.p.weighted <- BLAIS_2y_obs %>%
  mutate(., rate = rate/100) %>%
  ggplot(data = , 
                           mapping = aes(x = score, y = rate
                                         , #alpha = rate
                           )) +
  # for wai1, size 2, width was .7; .3 for wai2, alpha = .5
  #  geom_point(size = 2, 
  #             alpha = .5, 
  #             position = position_jitter(seed = 68, width = .3)) +
  geom_point(aes(
    size = rate,
    #alpha = rev(rate_z)
  ), 
  alpha = .5, 
  position = position_jitter(seed = 68, width = .3)) + 
  #geom_line(size = .25) + 
  theme_classic() + #minimal() + 
  theme(axis.line = 
          element_line(colour = "black", 
                       size = 1, linetype = "solid"),
        axis.title = element_text(size = 14, face = "bold"), 
        axis.text  = element_text(size = 14),
        strip.text.y = element_text(size = 12),
        aspect.ratio = 1/1,
        legend.position = "none"
  ) +
  scale_x_discrete(
    name   = "Scores", limits = seq(-2, 7)
  ) +
  scale_y_continuous(
    # position = "right",
    name = "Predicted Recidivism Rate (%)", 
    limits = c(0, .75),    #  n.breaks = 50
    breaks = seq(0, .75, .05),
    labels = scales::label_percent()
  )

#Blais.p.weighted


BRENT_2.p.unweighted.10pct <- BLAIS_2y_obs %>%
  mutate(., rate = rate/100) %>%
  filter(., score == 2) %>%
  ggplot(data = ., aes(x = score, y = rate)) +
  #geom_line(size = .25) + 
  geom_point(size = 2, 
             alpha = .5, 
             position = position_jitter(seed = 68, width = 1)) +
  #geom_point(aes(size = rate), alpha = .5, position = position_jitter(seed = 42, width = 1)) +
  theme_classic() + #minimal() + 
  theme(axis.line = 
          element_line(colour = "black", 
                       size = 1, linetype = "solid"),
        axis.title = element_text(size = 14, face = "bold"), 
        axis.text  = element_text(size = 14),
        strip.text.y = element_text(size = 12),
        aspect.ratio = 1/1,
        legend.position = "none"
  ) +
  scale_x_discrete(
    name   = "Score = 2" #, limits = 2
  ) +
  scale_y_continuous(
    # position = "right",
    name = "Predicted Recidivism Rate (%)", 
    limits = c(.01, .20),    #  n.breaks = 50
    breaks = seq(.01, .20, .02),
    labels = scales::percent_format(accuracy = 5L)
  ) +
  ggtitle(""); 
BRENT_2.p.unweighted.10pct

BRENT_2.p.weighted.10pct <- BLAIS_2y_obs %>%
  mutate(., rate = rate/100) %>%
  filter(., score == 2) %>%
  ggplot(data = ., aes(x = score, y = rate)) +
  #geom_line(size = .25) + 
#  geom_point(size = 2, 
#             alpha = .5, 
#             position = position_jitter(seed = 68, width = 1)) +
  geom_point(aes(size = rate), alpha = .5, position = position_jitter(seed = 68, width = 1)) +
  theme_classic() + #minimal() + 
  theme(axis.line = 
          element_line(colour = "black", 
                       size = 1, linetype = "solid"),
        axis.title = element_text(size = 14, face = "bold"), 
        axis.text  = element_text(size = 14),
        strip.text.y = element_text(size = 12),
        aspect.ratio = 1/1,
        legend.position = "none"
  ) +
  scale_x_discrete(
    name   = "Score = 2" #, limits = 2
  ) +
  scale_y_continuous(
    # position = "right",
    name = "Predicted Recidivism Rate (%)", 
    limits = c(.01, .20),    #  n.breaks = 50
    breaks = seq(.01, .20, .02),
    labels = scales::percent_format(accuracy = 5L)
  ) +
  ggtitle("")
#BRENT_2.p.weighted.10pct
#BRENT_2.p.weighted

########################################################################
