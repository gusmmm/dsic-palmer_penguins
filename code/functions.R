create_penguins_df <- function(){
  penguins_df <- penguins
  return(penguins_df)
}

filter_out_any_NA <- function(df){
filtered_df <- df %>%
    drop_na()              
  return(filtered_df)
}

do_species_bar_plot <- function(df){
  df %>%
    count(species) %>%
    ggplot() + geom_col(aes(x = species, y = n, fill = species)) +
    geom_label(aes(x = species, y = n, label = n)) +
    scale_fill_manual(values = c("darkorange","purple","cyan4")) +
    theme_minimal() +
    labs(title = 'Penguins Species Count')
}

do_cm <- function(df){
    df %>%
    select_if(is.numeric) %>%
    cor() 
}

do_cp_species_size <- function(df){
   ggplot(data = df, 
         aes(x = flipper_length_mm,
             y = body_mass_g)) +
    geom_point(aes(color = species, 
                   shape = species),
               size = 3,
               alpha = 0.8) +
    #theme_minimal() +
    scale_color_manual(values = c("darkorange","purple","cyan4")) +
    labs(title = "Penguin size, Palmer Station LTER",
         subtitle = "Flipper length and body mass for Adelie, Chinstrap and Gentoo Penguins",
         x = "Flipper length (mm)",
         y = "Body mass (g)",
         color = "Penguin species",
         shape = "Penguin species") +
    theme_minimal()
}

do_model_body_mass_flipper_length <- function(df){
  model <- lm(body_mass_g ~ flipper_length_mm, data = df)
  return(model)
}

do_df_model_dm_fl <- function(df, model){
  model_df <- df[,c(5,6)]
  model_df$predicted <- model$fitted.values
  model_df$residual <- model$residuals
  return(model_df)
}




