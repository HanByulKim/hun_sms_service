class VideoController < ApplicationController
    def index
        @video = Video.paginate(page: params[:page], per_page: 3).order('created_at DESC')
        respond_to do |format|
            format.html
            format.json{ render json: @video }
        end
    end
    
    def player
        @view = Video.find(Integer(params[:id]))
        impressionist(@view,"messages")
        @view.views = @view.impressionist_count
        @view.save
        @play = Video.find(params[:id])
    end
    
    def like_toggle
        like = Likevideo.find_by(user_id: current_user.id, video_id: params[:video_id])
        if like.nil?
            Likevideo.create(user_id: current_user.id, video_id: params[:video_id])
        else
           like.destroy 
        end
        
        redirect_to :back
    end
    
    def comment
        Commentvideo.create(script: params[:comment], video_id: params[:video_id], user_id: params[:user_id], blind: false) 
        redirect_to :back
    end
end