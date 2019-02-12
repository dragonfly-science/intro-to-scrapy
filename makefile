IMAGE := docker.dragonfly.co.nz/intro-to-scrapy
GIT_TAG ?= $(shell git log --oneline | head -n1 | awk '{print $$1}')
RUN ?= docker run $(INTERACT) --rm -v $$(pwd):/work -w /work -u $(UID):$(GID) $(IMAGE)
UID ?= $(shell id -u)
GID ?= $(shell id -g)

.PHONY: slides
slides:	clean_slides intro-to-scrapy.html

crawl: clean_babynames babynames/babynames.csv

babynames/babynames.csv:
	cd $(dir $@) && $(RUN) scrapy crawl huggies -o $(notdir $@) --logfile $(dir $@)babynames.log

intro-to-scrapy.html: intro-to-scrapy.Rmd babynames/babynames.csv
	$(RUN) Rscript -e 'rmarkdown::render("intro-to-scrapy.Rmd")'

.PHONY: docker
docker:
	docker build --tag $(IMAGE):$(GIT_TAG) .
	docker tag $(IMAGE):$(GIT_TAG) $(IMAGE):latest

.PHONY: docker-push
docker-push:
	docker push $(IMAGE):$(GIT_TAG)

.PHONY: enter
enter: UID=root
enter: GID=root
enter: INTERACT=-it
enter:
	$(RUN) bash

clean_slides:
	rm -f *.html

clean_babynames:
	rm -f babynames/babynames.csv
