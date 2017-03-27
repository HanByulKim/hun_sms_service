class NewsController < ApplicationController
   impressionist :actions=>[:article]
    
    def newsindex
        @news = News.paginate(page: params[:page], per_page: 3).order('id DESC')
        respond_to do |format|
            format.html
            format.json{ render json: @news }
        end
    end
    
    def article
        @article = News.find(params[:id])
        @view = News.find(Integer(params[:id]))
        impressionist(@view,"messages")
        @view.views = @view.impressionist_count
        @view.save
    end
    
    def like_toggle
        like = Likenews.find_by(user_id: current_user.id, news_id: params[:news_id])
        if like.nil?
            Likenews.create(user_id: current_user.id, news_id: params[:news_id])
        else
           like.destroy 
        end
        
        redirect_to :back
    end
    
    def blogindex
        @titles = Array.new
        @subtitles = Array.new
        @mainview = Array.new
        @created = Array.new
        @img = Array.new
        
        require 'open-uri'
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=1"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        #doc = doc.css('._photoImage').css('img')[0]
        #if doc['src'] != nil
        #    doc = doc['src']
        #end
        #@img << doc
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=2"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = doc.css('._photoImage').css('img')[0]
        if doc['src'] != nil
            doc = doc['src']
        end
        @img << doc
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=3"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=4"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=5"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=6"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=7"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=8"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=9"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        doc = Nokogiri::HTML(open("http://blog.naver.com/PostList.nhn?from=postList&blogId=sulhoon21&currentPage=10"),nil,'euc-kr')
        @titles << doc.css('.htitle').css('span')[0].text
        @subtitles << doc.css('.view').css('p')[0].text
        @mainview << doc.css('.view').css('p')[1].text
        @created << doc.css('.p12').css('p')[0].text
        #doc.css('div#title_1 span')[0].each do |location|
        #    @titles << location
        #end
    end
end
