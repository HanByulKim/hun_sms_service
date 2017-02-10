class NewsController < ApplicationController
    
    def index
        @titles = Array.new
        @subtitles = Array.new
        @mainview = Array.new
        @img = Array.new
        
        require 'open-uri'
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=1"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = doc.css('._photoImage').css('img')[0]
        if doc['src'] != nil
            doc = doc['src']
        end
        @img << doc
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=2"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=3"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=4"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=5"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=6"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=7"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=8"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=9"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=10"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        #doc.css('div#title_1 span')[0].each do |location|
        #    @titles << location
        #end
    end
end
