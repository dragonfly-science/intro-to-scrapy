# intro-to-scrapy

This repo provides examples of how to use the `scrapy` module to scrape data online. Useful things covered are:

- A concrete example (with code!) of how to scrape babynames from `huggies.co.nz`
- Lecture slides with explanations of how the code works

## I wanna see the slides

The slides are available online here: https://gorbachev.io/site/dragonfly-science/intro-to-scrapy

## Open code

You are welcome to fork this repository and use it as a basis for your own projects. Text content and code on this website are copyright Dragonfly Limited but are licenced for re-use under a [Creative Commons International Attribution 4.0 licence](https://creativecommons.org/licenses/by/4.0/) (see [LICENSE](https://github.com/dragonfly-science/intro-to-scrapy/blob/master/LICENSE) for terms and conditions). 

Please note that this licence does not apply to any logos, emblems and trade marks on the website or to the website’s design elements or to any photography, imagery, or publications.

Copyright of those specific items may not be held by Dragonfly Limited. Unless indicated otherwise, those specific items may not be re-used without express permission.

## How to run this repo on Linux or Mac

This repo is set up to run in a reproducible way using `make` and `docker`.

If you have `make` and `docker` installed, running:

``` bash
make docker

make slides
```

Will build the docker image you need locally, scrape `huggies.co.nz` to create `babynames/babynames.csv` if it does not already exist, and then build the slides `intro-to-scrapy.html`.

Installing `make` and `docker` is only sure to work on a unix system (i.e. Linux or Mac) however.

## How to run this repo on windows

The automation in this repo does not work on windows, but you can still build the contents of the repo by doing the following:

You can install `scrapy` with:

``` bash
pip install scrapy
```

(As per usual, running python code in a virtualenv is recommended but the only python dependency of this repo is on `scrapy` so make your best decision)

Then once you have `scrapy` installed, from the `babynames` directory, run the following:

``` bash
scrapy crawl huggies -o babynames.csv 
```

This will crawl `huggies.co.nz` to create the `babynames.csv` file.

If you also want to render the slides, then you need R installed as well as the following packages:

- `tidyverse`
- `rmarkdown`
- `kableExtra`
- `reticulate`

You can install these with:

``` r
install.packages(c('tidyverse', 'rmarkdown', 'kableExtra', 'reticulate'))
```

Once you have these installed you are ready to run:

``` r
rmarkdown::render("intro-to-scrapy.Rmd")
```

from the `R` command line, or open `intro-to-scrapy.Rmd` from RStudio and knit the slides together there.

## Any issues?

You are welcome to report any issues with the repo, through [GitHub](https://github.com/dragonfly-science/intro-to-scrapy/issues). If you really enjoy fixing other peoples' stuff, pull requests would also be appreciated!
