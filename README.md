# AdvancedR3: Notes to self

This project is about learning advanced coding in R in a reproducible
framework

# Brief description of folder and file contents

TODO: As project evolves, add brief description of what is inside the
data, doc and R folders.

The following folders contain:

-   `data/`: lipodomics.csv and a README.md
-   `doc/`: notes.qmd, learning.qmd, and README.md
-   `R/`: functions.R and README.md

# Installing project R package dependencies

If dependencies have been managed by using
`usethis::use_package("packagename")` through the `DESCRIPTION` file,
installing dependencies is as easy as opening the `AdvancedR3.Rproj`
file and running this command in the console:

```         
# install.packages("remotes")
remotes::install_deps()
```

You'll need to have remotes installed for this to work.

# Resource

For more information on this folder and file workflow and setup, check
out the [prodigenr](https://rostools.github.io/prodigenr) online
documentation.
