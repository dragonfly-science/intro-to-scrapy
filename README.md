# intro-to-scrapy
Introduction to web scraping using the `scrapy` module

# How to run this repo

This repo is set up to run in a reproducible way using `make` and `docker`.

If you have `make` and `docker` installed, running:

```
make docker

make slides
```

Will build the docker image you need locally, scrape `huggies.co.nz` to create `babynames/babynames.csv` if it does not already exist, and then build the slides `intro-to-scrapy.html`.

Installing `make` and `docker` is only sure to work on a unix system (i.e. Linux or Mac) however.

# How to run this repo on windows

The automation in this repo does not work on windows, but you can still build the contents of the repo by doing the following:

You can install `scrapy` with:

```
pip install scrapy
```

(As per usual, running python code in a virtualenv is recommended but the only python dependency of this repo is on scrapy so make your best decision)

Then once you have `scrapy` installed, from the `babynames` directory, run the following:

```
scrapy crawl huggies -o babynames.csv 
```

This will crawl `huggies.co.nz` to create the `babynames.csv` file.

If you also want to render the slides, then you need R installed as well as the following packages:

- `tidyverse`
- `rmarkdown`
- `kableExtra`
- `reticulate`

You can install these with:

```
install.packages(c('tidyverse', 'rmarkdown', 'kableExtra', 'reticulate'))
```

Once you have these installed you are ready to run:

```
rmarkdown::render("intro-to-scrapy.Rmd")
```

from the `R` command line, or open `intro-to-scrapy.Rmd` from RStudio and knit the slides together there.

# Any issues?

I'll be happy to take issue requests, esp. if these instructions prove unhelpful.
