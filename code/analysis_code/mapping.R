library(usmap)

plot_usmap(regions = "states")

df<- df %>% mutate(state = tolower(State)) 


plot_usmap(data = race_df, values = "BOX", regions = "states", include = "states") + 
  scale_fill_continuous(low = "white", high = "blue",
                        name = "Pc Estimates", label = scales::comma) + 
  labs(title = "New England Region", subtitle = "Poverty Percentage Estimates for New England Counties in 2014") +
  theme(legend.position = "right")

plot_usmap(data = race_df, values = "Death Rate (estimated)",
           regions = "states", exclude = c("HI", "AK"), color = "blue") + 
  scale_fill_continuous(low = "white", high = "blue",
                        name = "Death Rate (estimated)s", 
                        label = scales::comma) + 
  labs(title = "HIV Death Rates in the United States") +
  theme(legend.position = "right") 

plot_usmap(data = race_df, values = "Ratio Observed/Expected", 
           regions = "states", 
           exclude = c("HI", "AK"), color = "steelblue") +
  scale_fill_continuous(low = "white", high = "steelblue", 
                        name = "Death Rate (estimated)s", 
                        label = scales::comma) + 
  labs(title = "HIV Death Rates in the United States") +
  theme(legend.position = "right") 
