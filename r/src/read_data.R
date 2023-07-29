############################################################
### Read Data ##############################################
############################################################
#+++++++++++++++++++++++++
# Function to calculate the mean and the standard deviation
# for each group
#+++++++++++++++++++++++++
# data : a data frame
# varname : the name of a column containing the variable
#to be summarized
# groupnames : vector of column names to be used as
# grouping variables

#now in functions.R
#data_summary <- function(data, varname, groupnames){
#  summary_func = function(x, col){
#    c(mean = mean(x[[col]], na.rm = T),
#      sd   = sd(x[[col]], na.rm = T))
#  }
#  data_sum = plyr::ddply(data, groupnames, 
#                         .fun = summary_func, varname)
#  data_sum = plyr::rename(data_sum, c("mean" = varname))
# return(data_sum)
##}

# numeric
N <- readr::read_csv(
  here::here("data", "wai_juror_numeric.csv")) %>%
  dplyr::filter(., stringr::str_detect(StartDate, "2023")) %>%
  dplyr::rename(., AvgScore_Risk = DEA3.all.resp)

N %>%
  dplyr::filter(., StartDate > lubridate::dmy_hms("05-01-2023 00:00:01"))


#, Score_Risk = DEA3.resp) #%>%
#  select(., -c(1:5,8:18))
# choice data 
C <- read_csv(
  here::here("data", "wai_juror_choice.csv")) %>% 
  dplyr::filter(., stringr::str_detect(StartDate, "2023")) %>%
  #  dplyr::mutate(., Exp = StartDate < lubridate::dmy_hms("2023-04-08 00:00:01"))
  dplyr::mutate(., Exp =  case_when(
    StartDate < lubridate::ymd_hms(
      "2023-04-08 00:00:01") ~ "Exp 1",
    StartDate >= lubridate::ymd_hms(
      "2023-04-08 00:00:01") ~ "Exp 2",
    #others ...
    TRUE ~ "not coded") # else if not return as NA  
  ) 

C <- C %>%
  dplyr::rename(., 
                AvgScore_Risk = DEA3.all.resp, # The plot for all Scores 
                Score_Risk    = DEA3.resp      # The plot for the Static Score
  ) %>%
  dplyr::select(., -c(1:5,8:18)) %>% 
  dplyr::mutate(., across(
    c(AvgScore_Risk, # the full static plot est 
      Score_Risk,    # the static score plot est 
      RiskEntry,     # the risk communicated by professional 
      MinNumEst,     # minimum numeric risk for "Beyond Reasonable Doubt"
      #MinNumEst_1,     # minimum categorical risk for "Beyond Reasonable Doubt"
      RiskNumEst_1, RiskNumEst_2, RiskNumEst_3, RiskNumEst_4, RiskNumEst_5),
    ~as.numeric(.x))) %>%
  dplyr::rename(., Duration = `Duration (in seconds)`) %>%
  dplyr::mutate_at(., c('Duration'), as.numeric) %>%
  dplyr::mutate(., 
                Minutes = round(Duration/60, 2),
                CrimeAcc = ifelse(Crime == "Sexual Offense", 1, 0),
                DOB     = as.numeric(Age),
                Age     = (2022 - DOB),
                BeyondDoubt  = ifelse(tolower(JuryJudge) == "no", 0, 1),
                RiskCheck_Not_Rem = ifelse( # clean up (a delayed chance to enter the RiskEntry (dropdown))
                  RiskCheck == "Do not remember", "Not Remember", ""), 
                RiskCheck = ifelse( # clean up
                  RiskCheck == "Do not remember", NA, RiskCheck),
                RiskCheck = as.numeric(
                  gsub("% risk|a ", "", tolower(RiskCheck))), 
  ) %>%
  dplyr::mutate(., Plot = as.factor(recode(PlotType, 
                                           "noplot"  = "None", 
                                           "default" = "Unweighted",
                                           "size"    = "Weighted"))) %>%
  dplyr::mutate(., JuryJudge = as.numeric(
    case_when(JuryJudge == "Yes" ~ "1", 
              JuryJudge == "No" ~ "0") )
  ) %>%  # fix the non response
  dplyr::mutate(., 
                RiskNumEst_1 = ifelse(is.na(RiskNumEst_1), 0, RiskNumEst_1), # recode to be 0 if not responded
                RiskLevel_1  = ifelse(is.na(RiskNumEst_1), 0, RiskNumEst_1), # recode to be 0 if not responded
                RiskLevel_2  = ifelse(is.na(RiskNumEst_2), 0, RiskNumEst_2), # recode to be 0 if not responded
                RiskLevel_3  = ifelse(is.na(RiskNumEst_3), 0, RiskNumEst_3), # recode to be 0 if not responded
                RiskLevel_4  = ifelse(is.na(RiskNumEst_4), 0, RiskNumEst_4), # recode to be 0 if not responded
                RiskLevel_5  = ifelse(is.na(RiskNumEst_5), 0, RiskNumEst_5), # recode to be 0 if not responded
  ) %>%
  dplyr::relocate(id, .before = 1) %>%
  dplyr::relocate(Exp, .after = 1) %>%
  dplyr::relocate(Plot, .after = 2) %>%
  dplyr::filter(., Finished == "True")
#  dplyr::select(., -starts_with("DJ")) %>%
#  dplyr::select(., -starts_with("NC")) 

# calculate the estimate error magnitude
C <- C %>% dplyr::mutate(
  AvgScore_Risk_Est_Diff  = AvgScore_Risk - BLAIS_2y_mean,
  Score_Risk_Est_Diff     = Score_Risk - BRENT_Score2_mean,
  Score_Risk_Est_Diff_Exp = Score_Risk - 9
)


# Clean up attention check
C <- C %>% 
  #  dplyr::mutate(., FailedChecks = case_when(
  #    RiskCheck != 9 ~ 1,  # the initial entry check
  #    RiskEntry != 9 ~ 1,  # the second check
  #    TRUE ~ 0)) %>% 
  dplyr::mutate(., FailedChecks = ifelse(RiskEntry != 9, 1, 0)) %>%
  dplyr::mutate(., OrderedRisk = ifelse(
    RiskNumEst_1 <= RiskNumEst_2 & 
      RiskNumEst_2 <= RiskNumEst_3 &
      RiskNumEst_3 <= RiskNumEst_4 &
      RiskNumEst_4 <= RiskNumEst_5, 1, 0
  )) #%>% view()


#################################################################
# Filter Data 
#################################################################


C %>% dplyr::filter(., Income == "More than $105,000") %>%
  select(id)
C %>% dplyr::filter(., AvgScore_Risk > 50) %>% select(id)
C %>% dplyr::filter(., id == 14000) %>% view()



##Exclusionary criteria
# Clean up Data
# remove 
AvgScore_Risk_range <- c(5, 75) # a range for inclusion/ exclusion

C <- C %>% 
  dplyr::mutate(., 
                exclusion = case_when(
                  Plot == "None" ~ "include",
                  AvgScore_Risk >= AvgScore_Risk_range[1] &
                    AvgScore_Risk <= AvgScore_Risk_range[2] ~ "include", 
                  #Income != "More than $105,000" ~ 
                  #   "include", #is this real?
                  #Income != "$75,000 - $89,999" ~ 
                  #   "include",  #is this real?
                  TRUE ~ "exclude") 
  ) #%>% view()


#################################################################
# Split Experiments
#################################################################

C %>%
  dplyr::filter(., Exp == "Exp 1") %>%
  readr::write_csv(., here::here("data", "wai_juror_exp1.csv"))

C %>%
  dplyr::filter(., Exp == "Exp 2") %>%
  readr::write_csv(., here::here("data", "wai_juror_exp2.csv"))

