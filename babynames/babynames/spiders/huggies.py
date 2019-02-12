# -*- coding: utf-8 -*-
import scrapy


class HuggiesSpider(scrapy.Spider):
    name = 'huggies'
    allowed_domains = ['huggies.co.nz']
    start_urls = ['https://www.huggies.co.nz/baby-names/' + l for l in 'abcdefghijklmnopqrstuvwxyz']

    def parse(self, response):
        # Extract the urls for every page
        page_xpath = '//div[@class="pagination"]/a/@href'
        page_urls = response.xpath(page_xpath).extract()
        for url in page_urls:
            # Send a request for a page
            next_page = response.urljoin(url)
            yield scrapy.Request(next_page, callback = self.parse_page)

    def parse_page(self, response):
        # Get the baby names
        name_xpath = '//table/tbody/tr/td[@class="name"]/a/text()'
        names = response.xpath(name_xpath).extract()

        # Get the gender for each name
        gender_xpath = '//table/tbody/tr/td[@class="gender"]/span/text()'
        genders = response.xpath(gender_xpath).extract()

        for name, gender in zip(names, genders):
            yield {
              'name': name,
              'gender': gender
            }
