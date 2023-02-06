library(targets)
options(tidyverse.quiet=TRUE)

# select the packages to be always present
tar_option_set(packages = c("tidyverse","palmerpenguins"))

# source your functions
library(here)
source(here("code","packages.R"))
source(here("code","functions.R"))

# list the tar targets
list(
  tar_target(penguins_df,
            create_penguins_df()
            ),
  tar_target(fpenguins_df,
             filter_out_any_NA(penguins_df)
            ),
  tar_target(species_bar_plot,
             do_species_bar_plot(fpenguins_df)
            ),
  tar_target(correlation_mx,
             do_cm(fpenguins_df)
             ),
  tar_target(species_size_cp,
             do_cp_species_size(fpenguins_df)
             ),
  tar_target(model_bm_fl,
             do_model_body_mass_flipper_length(fpenguins_df)
            ),
  tar_target(model_bm_fl_df,
             do_df_model_dm_fl(fpenguins_df, model_bm_fl)
             )
  
)