class StarsController < ApplicationController
    def new 
         @article = Article.find(params[:article_id])
         @stars = @article.stars.new
         
    end
    
    def create
        @article = Article.find(params[:article_id])
        @stars = @article.stars.new(star_params)
        @stars.user = current_user
        if @stars.save
            redirect_to article_path (params[:article_id])
        else
            redirect_to article_path (params[:article_id])
            flash[:alert] = "COULD NOT SAVE RATING DUE TO AN ERROR"
        end
    end
    
    private
        def star_params
            params.require(:star).permit( :rating)
        end
end
